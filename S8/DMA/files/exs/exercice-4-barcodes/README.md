# Exercice 5 - Lecture de tags NFC (NDEF)

## Objectif
Développer une app Android (1 seule activité) qui lit un tag NFC NDEF et affiche ses enregistrements.

- Types à supporter: `RTD_TEXT` et `RTD_URI`
- Affichage: liste des messages décodés
- Interaction:
  - clic sur un texte -> dialogue
  - clic sur une URI -> ouverture du navigateur

## Ce qui a été implémenté

### 1) Lecture quand l'app est déjà ouverte (foreground dispatch)
Dans `MainActivity`:
- activation du dispatch en `onResume()` (`setupForegroundDispatch()`)
- désactivation en `onPause()` (`stopForegroundDispatch()`)
- traitement des tags via `onNewIntent()` -> `handleNfcIntent()`

### 2) Décodage des enregistrements NDEF
Dans `MyNdefMessage.parseRecord()`:
- `RTD_TEXT` (TNF well-known) : décodage du byte de status, du code langue, puis du texte UTF-8/UTF-16
- `RTD_URI` (TNF well-known) : décodage du préfixe URI (byte 0) + suffixe UTF-8

### 3) Affichage MVVM
- `MainViewModel` expose une `LiveData<List<MyNdefMessage>>`
- `updateReadMessages()` met à jour la liste
- `RecyclerView` + `NdefMessageAdapter` affiche les entrées
- état vide affiché tant qu'aucun message n'a été lu

### 4) Lecture quand l'app est inactive
Dans `AndroidManifest.xml`:
- permission NFC
- activité `singleTop` (évite plusieurs instances)
- intent-filters NFC (`NDEF_DISCOVERED`, `TECH_DISCOVERED`, `TAG_DISCOVERED`)
- filtre techno `Ndef` via `res/xml/nfc_tech_filter.xml`

## Fichiers principaux
- `app/src/main/java/ch/heigvd/iict/dma/exercice_barcodes/MainActivity.kt`
- `app/src/main/java/ch/heigvd/iict/dma/exercice_barcodes/model/MyNdefMessage.kt`
- `app/src/main/java/ch/heigvd/iict/dma/exercice_barcodes/model/MyTextNdefMessage.kt`
- `app/src/main/java/ch/heigvd/iict/dma/exercice_barcodes/model/MyUriNdefMessage.kt`
- `app/src/main/java/ch/heigvd/iict/dma/exercice_barcodes/viewmodel/MainViewModel.kt`
- `app/src/main/java/ch/heigvd/iict/dma/exercice_barcodes/ui/NdefMessageAdapter.kt`
- `app/src/main/res/layout/activity_main.xml`
- `app/src/main/res/layout/item_ndef_message.xml`
- `app/src/main/AndroidManifest.xml`
- `app/src/main/res/xml/nfc_tech_filter.xml`

## Vérification rapide
Build effectué localement avec succès:

```zsh
cd "/Users/guillaume/Documents/HEIG-VD/S8/DMA/files/exs/exercice-4-barcodes"
sh ./gradlew :app:assembleDebug --no-daemon
```

## Check-list de démo (rapport)
- [ ] NFC activé sur le téléphone
- [ ] App au premier plan -> scan du tag -> liste remplie
- [ ] Clic sur `TEXT` -> dialogue avec le contenu
- [ ] Clic sur `URI` -> navigateur ouvert
- [ ] App fermée/inactive -> scan du tag -> ouverture de l'app et affichage
- [ ] Pas de duplication d'activité (grâce à `singleTop`)

