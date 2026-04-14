package ch.heigvd.iict.dma.exercice_barcodes.model

data class MyUriNdefMessage(
    val uri: String
) : MyNdefMessage {
    override val title: String = "URI"
    override val content: String = uri
}

