package ch.heigvd.iict.dma.exercice_barcodes.model

data class MyTextNdefMessage(
    val languageCode: String,
    val text: String
) : MyNdefMessage {
    override val title: String = "TEXT ($languageCode)"
    override val content: String = text
}

