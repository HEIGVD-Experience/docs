package ch.heigvd.iict.dma.exercices_nfc.viewmodels

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.map
import ch.heigvd.iict.dma.exercices_nfc.models.MyNdefMessage

class NfcViewModel : ViewModel() {

    private val _messagesRead = MutableLiveData(mutableListOf<MyNdefMessage>())
    val messagesRead : LiveData<List<MyNdefMessage>> = _messagesRead.map { l -> l.toList().map { el -> el.copy() } }

    fun updateReadMessage(messages: Collection<MyNdefMessage>) {
        _messagesRead.value?.let { list ->
            list.clear()
            list.addAll(messages)
            _messagesRead.postValue(list)
        }
    }

}