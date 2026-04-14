package ch.heigvd.iict.dma.exercices_nfc

import android.app.PendingIntent
import android.content.Intent
import android.content.IntentFilter
import android.nfc.NdefMessage
import android.nfc.NfcAdapter
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import ch.heigvd.iict.dma.exercices_nfc.adapters.NdefMessageAdapter
import ch.heigvd.iict.dma.exercices_nfc.databinding.ActivityMainBinding
import ch.heigvd.iict.dma.exercices_nfc.models.MyNdefMessage
import ch.heigvd.iict.dma.exercices_nfc.models.MyTextNdefMessage
import ch.heigvd.iict.dma.exercices_nfc.models.MyUriNdefMessage
import ch.heigvd.iict.dma.exercices_nfc.viewmodels.NfcViewModel
import kotlin.concurrent.thread

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private val nfcViewModel : NfcViewModel by viewModels()

    private lateinit var nfcAdapter : NfcAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // depuis android 15 (sdk 35), le mode edge2edge doit être activé
        enableEdgeToEdge()

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // comme edge2edge est activé, l'application doit garder un espace suffisant pour la barre système
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // la barre d'action doit être définie dans le layout, on la lie à l'activité
        setSupportActionBar(binding.toolbar)

        // check NFC presence
        val nfcAdapterNullable = NfcAdapter.getDefaultAdapter(this)
        if(nfcAdapterNullable == null) {
            Toast.makeText(this, R.string.nfc_not_available, Toast.LENGTH_LONG).show()
            finish()
            return
        }
        nfcAdapter = nfcAdapterNullable
        if(!nfcAdapter.isEnabled) {
            Toast.makeText(this, R.string.nfc_not_enabled, Toast.LENGTH_LONG).show()
            finish()
            return
        }

        // initialize recyclerview
        val adapter = NdefMessageAdapter()
        binding.readerMessageList.adapter = adapter
        binding.readerMessageList.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
        binding.readerMessageList.addItemDecoration(DividerItemDecoration(this,LinearLayoutManager.VERTICAL))

        // add on click event
        adapter.itemClickListener = object : NdefMessageAdapter.Companion.ItemClickListener {
            override fun onItemClick(view: View?, position: Int) {
                when(val message = adapter.messages[position]) {
                    is MyTextNdefMessage -> {
                        AlertDialog.Builder(this@MainActivity)
                            .setMessage(message.value)
                            .setNeutralButton(android.R.string.ok, null)
                            .create().show()
                    }
                    is MyUriNdefMessage -> {
                        val intent = Intent(Intent.ACTION_VIEW)
                        intent.data = message.uri
                        startActivity(intent)
                    }
                }
            }
        }

        nfcViewModel.messagesRead.observe(this) { messages ->
            adapter.messages = messages
            if(messages.isEmpty()) {
                binding.readerMessageList.visibility = View.GONE
                binding.readerMessageEmptylist.visibility = View.VISIBLE
            } else {
                binding.readerMessageList.visibility = View.VISIBLE
                binding.readerMessageEmptylist.visibility = View.GONE
            }
        }
    }

    override fun onResume() {
        super.onResume()
        setupForegroundDispatch()
    }

    override fun onPause() {
        super.onPause()
        stopForegroundDispatch()
    }

    override fun onNewIntent(intent: Intent) {
        // method called when the system scan an NFC tag we are looking for
        super.onNewIntent(intent)

        // we process the intent, looking for the tag
        processIntent(intent)
    }

    private fun processIntent(intent: Intent) {
        // processing should not be done in UI-Thread
        thread {
            val messageList = mutableListOf<MyNdefMessage>()

            // we extract NDEF_MESSAGES from the intent payload
            // (the intent can contain something else than NDEF_MESSAGES)
            val rawMessages =
                if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU)
                    intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES, NdefMessage::class.java)
                else
                    intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES)

            rawMessages?.also { rawMsgs ->
                val messages: List<NdefMessage> = rawMsgs.map { it as NdefMessage }
                //each NDEF message can contains multiples NDEF records, we decode them
                messages.forEach { message ->
                    message.records.forEach { record ->
                        try {
                            val r = MyNdefMessage.parseRecord(record)
                            messageList.add(r)
                        } catch (e: IllegalArgumentException) {
                            Log.e(TAG, "Unsupported NDEF message: ${e.message}");
                        }
                    }
                }
            }

            nfcViewModel.updateReadMessage(messageList)
        }
    }


    // enable NFC dispatch when activity is active
    private fun setupForegroundDispatch() {
        // we ask the system to look for any NFC tag containing NDEF message
        // when a tag is read, the system will use the following pending intent to pass its content
        // to the current activity

        val intent = Intent(this.applicationContext, this::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_SINGLE_TOP

        val pendingIntent = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            PendingIntent.getActivity(this.applicationContext, 0, intent, PendingIntent.FLAG_MUTABLE)
        } else {
            PendingIntent.getActivity(this.applicationContext, 0, intent, 0)
        }

        val intFilter = IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED)
        val filters = arrayOf(intFilter)
        val techLists = arrayOf(arrayOf("android.nfc.tech.Ndef"))

        nfcAdapter.enableForegroundDispatch(this, pendingIntent, filters, techLists)
    }

    // disable NFC dispatch when activity is inactive
    private fun stopForegroundDispatch() {
        nfcAdapter.disableForegroundDispatch(this)
    }

    companion object {
        private val TAG = MainActivity::class.simpleName
    }

}