package ch.heigvd.iict.dma.exercice_barcodes.model

import android.nfc.NdefRecord
import java.nio.charset.Charset

sealed interface MyNdefMessage {
    val title: String
    val content: String

    companion object {
        private val uriPrefixMap = mapOf(
            0x00 to "",
            0x01 to "http://www.",
            0x02 to "https://www.",
            0x03 to "http://",
            0x04 to "https://"
        )

        fun parseRecord(record: NdefRecord): MyNdefMessage? {
            return if (record.tnf == NdefRecord.TNF_WELL_KNOWN && record.type.contentEquals(NdefRecord.RTD_TEXT)) {
                parseTextRecord(record)
            } else if (record.tnf == NdefRecord.TNF_WELL_KNOWN && record.type.contentEquals(NdefRecord.RTD_URI)) {
                parseUriRecord(record)
            } else {
                null
            }
        }

        private fun parseTextRecord(record: NdefRecord): MyNdefMessage? {
            val payload = record.payload
            if (payload.isEmpty()) return null

            val status = payload[0].toInt()
            val isUtf16 = (status and 0x80) != 0
            val languageCodeLength = status and 0x3F
            if (payload.size <= languageCodeLength + 1) return null

            val languageCode = String(payload, 1, languageCodeLength, Charsets.US_ASCII)
            val textEncoding: Charset = if (isUtf16) Charsets.UTF_16 else Charsets.UTF_8
            val text = String(payload, languageCodeLength + 1, payload.size - languageCodeLength - 1, textEncoding)

            return MyTextNdefMessage(languageCode = languageCode, text = text)
        }

        private fun parseUriRecord(record: NdefRecord): MyNdefMessage? {
            val payload = record.payload
            if (payload.isEmpty()) return null

            val prefixCode = payload[0].toInt() and 0xFF
            val prefix = uriPrefixMap[prefixCode] ?: ""
            val suffix = String(payload, 1, payload.size - 1, Charsets.UTF_8)

            return MyUriNdefMessage(uri = prefix + suffix)
        }
    }
}

