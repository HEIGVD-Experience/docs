package ch.heigvd.iict.dma.location

import android.annotation.SuppressLint
import android.os.Bundle
import android.os.Looper
import android.util.Log
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.core.location.LocationRequestCompat
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.children
import ch.heigvd.iict.dma.location.common.LocationAwareActivity
import ch.heigvd.iict.dma.location.databinding.ActivityFusedBinding
import ch.heigvd.iict.dma.location.viewmodels.LocationPermission
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import java.util.Date

class FusedActivity : LocationAwareActivity() {

    private lateinit var binding: ActivityFusedBinding

    private lateinit var fusedLocationProviderClient: FusedLocationProviderClient

    @SuppressLint("MissingPermission")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // depuis android 15 (sdk 35), le mode edge2edge doit être activé
        enableEdgeToEdge()

        binding = ActivityFusedBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // comme edge2edge est activé, l'application doit garder un espace suffisant pour la barre système
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // la barre d'action doit être définie dans le layout, on la lie à l'activité
        setSupportActionBar(binding.toolbar)

        // get fused location client
        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this)

        // we "hide" the interface if permissions are not granted
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

        // react to user's events
        binding.lastLocationBtn.setOnClickListener {
            fusedLocationProviderClient.lastLocation.addOnSuccessListener { location ->
                locationViewModel.updateLocation(location)
            }
        }

        binding.enabledLocalisation.addOnButtonCheckedListener { _, checkedId, isChecked ->
            if(checkedId == R.id.enabled_localisation_on && isChecked) {
                // we want to enable location updates

                val priorityLevel = when (binding.requirementChoice.checkedRadioButtonId) {
                    R.id.requirement_highaccuracy -> LocationRequestCompat.QUALITY_HIGH_ACCURACY
                    R.id.requirement_balanced -> LocationRequestCompat.QUALITY_BALANCED_POWER_ACCURACY
                    else -> LocationRequestCompat.QUALITY_LOW_POWER
                }

                val interval = when(binding.requirementChoice.checkedRadioButtonId) {
                    R.id.requirement_highaccuracy -> 1 * 1000L
                    R.id.requirement_balanced -> 10 * 1000L
                    R.id.requirement_lowpower -> 60 * 1000L
                    else -> LocationRequestCompat.PASSIVE_INTERVAL
                }

                val locationRequest = LocationRequest.Builder(interval)
                    .setPriority(priorityLevel)
                    .build()

                fusedLocationProviderClient.requestLocationUpdates(locationRequest, locationCallback, Looper.myLooper())
                locationViewModel.isUpdatingLocation()
                Log.d("FusedActivity", "enable location update")
            }
            else if(checkedId == R.id.enabled_localisation_off && isChecked) {
                // disable
                fusedLocationProviderClient.removeLocationUpdates(locationCallback)
                locationViewModel.clearLocation()
                locationViewModel.finishUpdatingLocation()
                Log.d("FusedActivity", "disable location update")
            }
        }

        binding.locationGeocodingBtn.setOnClickListener {
            reverseGeocoding(locationViewModel.lastLocation.value!!)
        }

        // we update GUI according to update state and location changed
        locationViewModel.isUpdatingLocation.observe(this) { isUpdating ->
            binding.lastLocationBtn.isEnabled = !isUpdating
            binding.requirementChoice.children.forEach { choice ->
                choice.isEnabled = !isUpdating
            }
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

    private val locationCallback: LocationCallback = object : LocationCallback() {
        override fun onLocationResult(locationResult: LocationResult) {
            locationResult.lastLocation?.let {
                locationViewModel.updateLocation(it)
            }
        }
    }

}