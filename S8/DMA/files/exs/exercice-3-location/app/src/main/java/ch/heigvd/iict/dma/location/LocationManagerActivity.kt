package ch.heigvd.iict.dma.location

import android.annotation.SuppressLint
import android.location.LocationListener
import android.location.LocationManager
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import ch.heigvd.iict.dma.location.common.LocationAwareActivity
import ch.heigvd.iict.dma.location.databinding.ActivityLocationproviderBinding
import ch.heigvd.iict.dma.location.viewmodels.LocationPermission
import java.util.Date

class LocationManagerActivity : LocationAwareActivity() {

    private lateinit var binding: ActivityLocationproviderBinding

    private lateinit var locationManager: LocationManager

    @SuppressLint("MissingPermission")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // depuis android 15 (sdk 35), le mode edge2edge doit être activé
        enableEdgeToEdge()

        binding = ActivityLocationproviderBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // comme edge2edge est activé, l'application doit garder un espace suffisant pour la barre système
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // la barre d'action doit être définie dans le layout, on la lie à l'activité
        setSupportActionBar(binding.toolbar)

        // get location manager
        locationManager = getSystemService(LOCATION_SERVICE) as LocationManager

        // we "hide" th interface if permissions are not granted
        locationViewModel.locationPermission.observe(this) { permission ->
            when(permission) {
                LocationPermission.NONE -> {
                    binding.groupWithPermission.visibility = View.GONE
                    binding.groupWithoutPermission.visibility = View.VISIBLE
                }
                else -> {
                    binding.groupWithPermission.visibility = View.VISIBLE
                    binding.groupWithoutPermission.visibility = View.GONE
                }
            }
        }

        // we disable FUSED provider for android SDK < 31
        if (android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.S)
            binding.sourcesFused.visibility = View.GONE

        // react to user's events
        binding.enabledLocalisation.addOnButtonCheckedListener { _, checkedId, isChecked ->
            val minUpdateTimeMs = 0L
            val minDistanceM = 0f

            if(checkedId == R.id.enabled_localisation_on && isChecked) {
                // we want to enable location updates
                if(binding.sourcesPassive.isChecked)
                    locationManager.requestLocationUpdates(LocationManager.PASSIVE_PROVIDER, minUpdateTimeMs, minDistanceM, locationListener)
                if(binding.sourcesNetwork.isChecked)
                    locationManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, minUpdateTimeMs, minDistanceM, locationListener)
                if(binding.sourcesGps.isChecked)
                    locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, minUpdateTimeMs, minDistanceM, locationListener)
                if(binding.sourcesFused.isChecked)
                    locationManager.requestLocationUpdates(LocationManager.FUSED_PROVIDER, minUpdateTimeMs, minDistanceM, locationListener)

                locationViewModel.isUpdatingLocation()
                Log.d("LocationManagerActivity", "enable location update")
            }
            else if(checkedId == R.id.enabled_localisation_off && isChecked) {
                // disable
                locationManager.removeUpdates(locationListener)
                locationViewModel.clearLocation()
                locationViewModel.finishUpdatingLocation()
                Log.d("LocationManagerActivity", "disable location update")
            }
        }

        binding.locationGeocodingBtn.setOnClickListener {
            reverseGeocoding(locationViewModel.lastLocation.value!!)
        }

        // we update GUI according to update state and location changed
        locationViewModel.isUpdatingLocation.observe(this) { isUpdating ->
            binding.sourcesPassive.isEnabled = !isUpdating
            binding.sourcesNetwork.isEnabled = !isUpdating
            binding.sourcesGps.isEnabled = !isUpdating
            binding.sourcesFused.isEnabled = !isUpdating
        }

        locationViewModel.lastLocation.observe(this) { lastLocation ->
            if(lastLocation == null) {
                binding.locationGeocodingBtn.isEnabled = false
                binding.locationResultTime.setText("")
                binding.locationResultProvider.setText("")
                binding.locationResultLatitude.setText("")
                binding.locationResultLongitude.setText("")
                binding.locationResultAccuracy.setText("")
                binding.locationResultAltitude.setText("")
                binding.locationResultSpeed.setText("")
                binding.locationResultBearing.setText("")
            } else {

                val date = Date().apply {
                    time = lastLocation.time
                }

                binding.locationGeocodingBtn.isEnabled = true
                binding.locationResultTime.setText(DATE_FORMAT.format(date))
                binding.locationResultProvider.setText("${lastLocation.provider}")
                binding.locationResultLatitude.setText("${lastLocation.latitude}")
                binding.locationResultLongitude.setText("${lastLocation.longitude}")
                binding.locationResultAccuracy.setText("${lastLocation.accuracy}")
                binding.locationResultAltitude.setText("${lastLocation.altitude}")
                binding.locationResultSpeed.setText("${lastLocation.speed}")
                binding.locationResultBearing.setText("${lastLocation.bearing}")
            }
        }
    }

    override fun onPause() {
        super.onPause()
        binding.enabledLocalisation.check(R.id.enabled_localisation_off)
    }

    private val locationListener: LocationListener = LocationListener { location ->
        locationViewModel.updateLocationWithFilter(location)
    }

}