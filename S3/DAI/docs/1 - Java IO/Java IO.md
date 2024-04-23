---
Type: PriseDeNote
MiseAuPropre: non
---
- [Définition](#d%C3%A9finition)
- [Types de données](#types-de-donn%C3%A9es)
	- [Avec ou sans buffer](#avec-ou-sans-buffer)
- [Traitement d'un fichier binaire](#traitement-dun-fichier-binaire)
	- [Sans buffer](#sans-buffer)
	- [Avec buffer](#avec-buffer)
- [Traitement d'un fichier texte](#traitement-dun-fichier-texte)
	- [Sans buffer](#sans-buffer)
	- [Avec buffer](#avec-buffer)

## Définition
>[!important]
>Les IOs en Java représente les entrées et sorties. Cela reprends donc les notions de lecture et d'écriture dans un fichier.

## Types de données
Il existe deux type de données principales traitable par les IO, on parle de fichiers **textes** ainsi que de fichiers **binaires**.
### Avec ou sans buffer
Il existe deux options lors du traitement des fichiers, ceux-ci s'appliquent au fichiers textes ainsi qu'aux fichiers binaires. Soit avec buffer soit sans. Le traitement avec buffer est plus efficace car il stock dans la mémoire une certaine quantité donnée avant d'ouvrir le fichier et d'y écrire dedans. Ce qui fait gagner beaucoup de temps autant à la lecture qu'à l'écriture.

## Traitement d'un fichier binaire
Les fichiers binaires sont un peu le classique car dans leur interprétation ils ne requièrent aucun transcodage. On lit chacun de leurs bits puis les recopient ou applique un traitement.

>[!important]
>Les objets `FileInputStream` ainsi que `FileOutputStream` ne traite pas l'encodage des caractères, car ils lisent/écrivent des octets bruts. Par conséquent, ils sont souvent utilisés pour lire des fichiers binaires.
### Sans buffer
**Lecture**
```java
// Ouverture du fichier dans la variable fis. Le paramètre filename est de type String.
FileInputStream fis = new FileInputStream(filename)

// Permet de lire le fichier jusqu'à que -1 soit retourné, ce qui vaut à la fin du fichier.
while (fis.read() != -1) { }
```
**Ecriture**
```java
// Ouverture du fichier en mode écriture dans la varibale fos.
FileOutputStream fos = new FileOutputStream(filename)

// Permet d'écrire les bits dans le fichier. Ici on passe un tableau de bits.
fos.write(new byte[sizeInBytes]);
```
### Avec buffer
**Lecture**
```java
// Ouverture du fichier peremttant le lecture classique sur le fichier.
FileInputStream fis = new FileInputStream(filename);  

// Utilisation de la lecture classique pour créer un objet de lecture bufferisée
BufferedInputStream bis = new BufferedInputStream(fis);

// Lecture du fichier de façon bufferiséee jusqu'à atteindre -1 qui signifie la fin du fichier
while (bis.read() != -1) { }
```
**Ecriture**
```java
FileOutputStream fos = new FileOutputStream(filename);  

BufferedOutputStream bis = new BufferedOutputStream(fos);

fos.write(new byte[sizeInBytes]);
```

## Traitement d'un fichier texte
Le principe permettant la lecture ainsi que l'écriture de fichiers textes sont plus ou moins similaires au traitement des fichiers binaires. Cependant plusieurs différences sont notables.

>[!important]
>Les objets `FileReader` ainsi que `FileWriter` traite l'encodage des caractères, car ils doivent lire/écrire directement du texte dans le fichier. De ce fait dans la signature des objets il est possible de préciser le format en ajoutant par exemple : `StandardCharsets.UTF_8`. L'encodage par défaut est celui défini sur votre machine (il varie en fonction de Linux/MacOs ainsi que Windows)

### Sans buffer
**Lecture**
```java
// Ouvre le fichier en lecture
FileReader fr = new FileReader(filename)

// Lis le fichier jusqu'à arriver au bout de celui-ci
while(fr.read() != -1) { }
```
**Ecriture**
```java
// Ouvre le fichier en écriture
FileWriter fw = new FileWriter(filename)

// Ecris des char dans le fichier
fw.write(new char[sizeInBytes]);
```

### Avec buffer
**Lecture**
```java
// Ouvre le fichier en lecture
FileReader fr = new FileReader(filename);

// Utilise la lecture classique pour créer une lecture bufferisée
BufferedReader br = new BufferedReader(fr);

// Lis le fichier texte jusqu'à qu'il renvoie -1 signifiant la fin du fichier
while (br.read() != -1) { }
```
**Ecriture**
```java
FileWriter fw = new FileWriter(filename);

BufferedWriter bw = new BufferedWriter(fw);

bw.write(new char[sizeInBytes]);
```
