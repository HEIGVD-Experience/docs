package ch.heigvd.iict.dma.exercices_nfc.adapters

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import ch.heigvd.iict.dma.exercices_nfc.R
import ch.heigvd.iict.dma.exercices_nfc.models.MyNdefMessage
import ch.heigvd.iict.dma.exercices_nfc.models.MyTextNdefMessage
import ch.heigvd.iict.dma.exercices_nfc.models.MyUriNdefMessage

class NdefMessageAdapter (messages : List<MyNdefMessage> = emptyList()) : RecyclerView.Adapter<NdefMessageAdapter.ViewHolder>() {

    var itemClickListener : ItemClickListener? = null

    var messages : List<MyNdefMessage> = messages
        set(value) {
            val sortedList = value.sortedBy { it.id }
            val diffCallBack = NdefMessagesDiffCallBack(messages, sortedList)
            val diffItems = DiffUtil.calculateDiff(diffCallBack)
            field = sortedList
            diffItems.dispatchUpdatesTo(this)
        }

    override fun getItemCount() = messages.size

    override fun getItemViewType(position: Int) : Int {
        return when(messages[position]) {
            is MyUriNdefMessage -> 0
            is MyTextNdefMessage -> 1
            else -> {
                Log.e(TAG, "Unknown type: <${messages[position]::class.java.simpleName}>")
                -1
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layout = when(viewType) {
            0 -> R.layout.row_item_message_uri
            1 -> R.layout.row_item_message_text
            else -> {
                Log.e(TAG, "Unknown type: <viewType>")
                -1
            }
        }
        return ViewHolder(LayoutInflater.from(parent.context).inflate(layout, parent, false))
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(messages[position])
    }

    inner class ViewHolder(view: View) : RecyclerView.ViewHolder(view), View.OnClickListener {
        private val textValue = view.findViewById<TextView>(R.id.row_item_message_txt_value)
        private val textLang = view.findViewById<TextView>(R.id.row_item_message_txt_lang)
        private val uri = view.findViewById<TextView>(R.id.row_item_message_uri_uri)

        init {
            view.setOnClickListener(this)
        }

        fun bind(message: MyNdefMessage) {
            when(message) {
                is MyUriNdefMessage -> {
                    uri.text = message.uri.toString()
                }
                is MyTextNdefMessage -> {
                    textValue.text = message.value
                    textLang.text = message.languageCode
                }
                else -> {
                    Log.e(TAG, "Should never happen...")
                }
            }
        }

        override fun onClick(v: View?) {
            itemClickListener?.onItemClick(v, layoutPosition)
        }

    }

    companion object {
        private val TAG = NdefMessageAdapter::class.java.simpleName

        interface ItemClickListener {
            fun onItemClick(view: View?, position: Int)
        }
    }

}

class NdefMessagesDiffCallBack(private val oldList : List<MyNdefMessage>, private val newList: List<MyNdefMessage>) : DiffUtil.Callback() {
    override fun getOldListSize() = oldList.size

    override fun getNewListSize() = newList.size

    override fun areItemsTheSame(oldItemPosition: Int, newItemPosition: Int)
            = oldList[oldItemPosition].id == newList[newItemPosition].id

    override fun areContentsTheSame(oldItemPosition: Int, newItemPosition: Int)
            = oldList[oldItemPosition] == newList[newItemPosition]
}
