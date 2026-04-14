package ch.heigvd.iict.dma.exercice_barcodes.ui

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import ch.heigvd.iict.dma.exercice_barcodes.databinding.ItemNdefMessageBinding
import ch.heigvd.iict.dma.exercice_barcodes.model.MyNdefMessage

class NdefMessageAdapter(
    private val onClick: (MyNdefMessage) -> Unit
) : ListAdapter<MyNdefMessage, NdefMessageAdapter.NdefMessageViewHolder>(DiffCallback) {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): NdefMessageViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        val binding = ItemNdefMessageBinding.inflate(inflater, parent, false)
        return NdefMessageViewHolder(binding)
    }

    override fun onBindViewHolder(holder: NdefMessageViewHolder, position: Int) {
        holder.bind(getItem(position), onClick)
    }

    class NdefMessageViewHolder(
        private val binding: ItemNdefMessageBinding
    ) : RecyclerView.ViewHolder(binding.root) {

        fun bind(message: MyNdefMessage, onClick: (MyNdefMessage) -> Unit) {
            binding.messageTypeText.text = message.title
            binding.messageContentText.text = message.content
            binding.root.setOnClickListener { onClick(message) }
        }
    }

    private object DiffCallback : DiffUtil.ItemCallback<MyNdefMessage>() {
        override fun areItemsTheSame(oldItem: MyNdefMessage, newItem: MyNdefMessage): Boolean {
            return oldItem == newItem
        }

        override fun areContentsTheSame(oldItem: MyNdefMessage, newItem: MyNdefMessage): Boolean {
            return oldItem == newItem
        }
    }
}

