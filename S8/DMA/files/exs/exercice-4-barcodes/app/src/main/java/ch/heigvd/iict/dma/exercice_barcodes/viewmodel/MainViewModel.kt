package ch.heigvd.iict.dma.exercice_barcodes.viewmodel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import ch.heigvd.iict.dma.exercice_barcodes.model.MyNdefMessage

class MainViewModel : ViewModel() {
    private val _messages = MutableLiveData<List<MyNdefMessage>>(emptyList())
    val messages: LiveData<List<MyNdefMessage>> = _messages

    fun updateReadMessages(newMessages: List<MyNdefMessage>) {
        _messages.value = newMessages
    }
}

