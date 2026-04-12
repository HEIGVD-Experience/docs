package ch.heigvd.iict.dma.location.viewmodels

import android.app.Application
import android.location.Location
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData

class LocationViewModel(application: Application) : AndroidViewModel(application) {

    private val _locationPermission = MutableLiveData(LocationPermission.NONE)
    val locationPermission : LiveData<LocationPermission> get() = _locationPermission

    private val _lastLocation = MutableLiveData<Location?>(null)
    val lastLocation : LiveData<Location?> get() = _lastLocation

    private val _isUpdatingLocation = MutableLiveData(false)
    val isUpdatingLocation : LiveData<Boolean> get() = _isUpdatingLocation

    fun locationPermissionChanged(newPermission : LocationPermission) {
        _locationPermission.postValue(newPermission)
    }

    fun updateLocation(location: Location) {
        _lastLocation.postValue(location)
    }

    fun updateLocationWithFilter(location: Location) {
        if(isBetterLocation(location))
            _lastLocation.postValue(location)
    }

    fun clearLocation() {
        _lastLocation.postValue(null)
    }

    fun isUpdatingLocation() {
        _isUpdatingLocation.postValue(true)
    }

    fun finishUpdatingLocation() {
        _isUpdatingLocation.postValue(false)
    }

    private fun isBetterLocation(location: Location): Boolean {
        val currentBestLocation = _lastLocation.value
            ?: // A new location is always better than no location
            return true

        // Aujourd'hui la documentation d'Android pousse fortement à l'utilisation de la librairie
        // FusedLocationProviderClient, en particulier la documentation en lien avec le LocationProvider
        // a été réduite au minimum.
        // En s'enregistrant à deux sources (networn + gps), nous allons recevoir aléatoirement les annonces
        // des deux sources, certaines sont plus récentes que d'autres, et toutes n'ont pas la même précision
        // Pour garder uniquement la plus adéquate, il y a lieu de filtrer les annonces reçues.
        // Cf. documentation en archive :
        // src: https://web.archive.org/web/20181016205734/https://developer.android.com/guide/topics/location/strategies

        return true //FIXME
    }

}

enum class LocationPermission {
    FINE,
    COARSE,
    NONE
}