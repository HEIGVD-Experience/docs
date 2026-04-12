package ch.heigvd.iict.dma.location.common

import android.Manifest
import android.location.Geocoder
import android.location.Location
import android.os.Bundle
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import ch.heigvd.iict.dma.location.viewmodels.LocationPermission
import ch.heigvd.iict.dma.location.viewmodels.LocationViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.text.SimpleDateFormat

abstract class LocationAwareActivity : AppCompatActivity() {

    protected val locationViewModel : LocationViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // check permissions and request them if necessary
        locationPermissionRequest.launch(arrayOf(
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.ACCESS_COARSE_LOCATION))

    }

    fun reverseGeocoding(location: Location) {
        lifecycleScope.launch {
            reverseGeocodingCoroutine(location)
        }
    }

    private suspend fun reverseGeocodingCoroutine(location: Location) = withContext(Dispatchers.IO){
        val addresses = Geocoder(applicationContext).getFromLocation(location.latitude, location.longitude, 10)
        addresses?.let { addrs ->
            if(addrs.isNotEmpty()) {
                val displayableAddress = addrs.first().let { addr ->
                    val addressParts = mutableListOf<String>()
                    if(addr.maxAddressLineIndex == 0)
                        addressParts.add(addr.getAddressLine(0))
                    else if(addr.maxAddressLineIndex > 0)
                        for (i in 0 until addr.maxAddressLineIndex)
                            addressParts.add(addr.getAddressLine(i))
                    addressParts.joinToString(separator = ",")
                }
                withContext(Dispatchers.Main) {
                    Toast.makeText(applicationContext, displayableAddress, Toast.LENGTH_LONG).show()
                }
            }
        }
    }

    private val locationPermissionRequest = registerForActivityResult(ActivityResultContracts.RequestMultiplePermissions()) { permissions ->
        when {
            permissions.getOrDefault(Manifest.permission.ACCESS_FINE_LOCATION, false) -> {
                locationViewModel.locationPermissionChanged(LocationPermission.FINE)
            }
            permissions.getOrDefault(Manifest.permission.ACCESS_COARSE_LOCATION, false) -> {
                locationViewModel.locationPermissionChanged(LocationPermission.COARSE)
            } else -> {
                locationViewModel.locationPermissionChanged(LocationPermission.NONE)
            }
        }
    }

    companion object {
        val DATE_FORMAT = SimpleDateFormat("HH:mm:ss - dd.MM.yyyy")
    }

}