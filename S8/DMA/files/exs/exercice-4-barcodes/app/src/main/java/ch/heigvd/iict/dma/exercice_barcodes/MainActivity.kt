package ch.heigvd.iict.dma.exercice_barcodes

import android.app.PendingIntent
import android.content.Intent
import android.net.Uri
import android.nfc.NdefMessage
import android.nfc.NfcAdapter
import android.nfc.tech.Ndef
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AlertDialog
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import ch.heigvd.iict.dma.exercice_barcodes.databinding.ActivityMainBinding
import ch.heigvd.iict.dma.exercice_barcodes.model.MyNdefMessage
import ch.heigvd.iict.dma.exercice_barcodes.model.MyTextNdefMessage
import ch.heigvd.iict.dma.exercice_barcodes.model.MyUriNdefMessage
import ch.heigvd.iict.dma.exercice_barcodes.ui.NdefMessageAdapter
import ch.heigvd.iict.dma.exercice_barcodes.viewmodel.MainViewModel

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private lateinit var ndefAdapter: NdefMessageAdapter
    private var nfcAdapter: NfcAdapter? = null
    private lateinit var viewModel: MainViewModel

    private val pendingIntent by lazy {
        PendingIntent.getActivity(
            this,
            0,
            Intent(this, javaClass).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
        )
    }

    private val techLists by lazy {
        arrayOf(arrayOf(Ndef::class.java.name))
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        enableEdgeToEdge()

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        setSupportActionBar(binding.toolbar)
        supportActionBar?.title = getString(R.string.title_nfc)

        nfcAdapter = NfcAdapter.getDefaultAdapter(this)
        viewModel = MainViewModel()

        ndefAdapter = NdefMessageAdapter { message ->
            when (message) {
                is MyTextNdefMessage -> showTextDialog(message)
                is MyUriNdefMessage -> startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(message.uri)))
            }
        }
        binding.ndefRecyclerView.adapter = ndefAdapter

        viewModel.messages.observe(this) { messages ->
            ndefAdapter.submitList(messages)
            binding.emptyStateText.visibility = if (messages.isEmpty()) android.view.View.VISIBLE else android.view.View.GONE
        }

        // Handle the launch intent when app is opened from a scanned tag while inactive.
        handleNfcIntent(intent)
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
        super.onNewIntent(intent)
        setIntent(intent)
        handleNfcIntent(intent)
    }

    private fun setupForegroundDispatch() {
        nfcAdapter?.enableForegroundDispatch(this, pendingIntent, null, techLists)
    }

    private fun stopForegroundDispatch() {
        nfcAdapter?.disableForegroundDispatch(this)
    }

    private fun handleNfcIntent(intent: Intent?) {
        if (intent == null) return

        val action = intent.action
        if (
            action != NfcAdapter.ACTION_NDEF_DISCOVERED &&
            action != NfcAdapter.ACTION_TECH_DISCOVERED &&
            action != NfcAdapter.ACTION_TAG_DISCOVERED
        ) {
            return
        }

        val ndefMessages = readNdefMessages(intent)
        val parsedMessages = ndefMessages
            .flatMap { it.records.asList() }
            .mapNotNull(MyNdefMessage::parseRecord)

        viewModel.updateReadMessages(parsedMessages)
    }

    private fun readNdefMessages(intent: Intent): List<NdefMessage> {
        val messages: Array<NdefMessage>?
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU) {
            messages = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES, NdefMessage::class.java)
        } else {
            @Suppress("DEPRECATION")
            val rawMessages = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES)
            @Suppress("UNCHECKED_CAST")
            messages = rawMessages as? Array<NdefMessage>
        }

        return messages?.toList().orEmpty()
    }

    private fun showTextDialog(message: MyTextNdefMessage) {
        AlertDialog.Builder(this)
            .setTitle(getString(R.string.text_dialog_title, message.languageCode))
            .setMessage(message.text)
            .setPositiveButton(android.R.string.ok, null)
            .show()
    }

}