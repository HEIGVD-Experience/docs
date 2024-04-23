#import "/_settings/typst/template-qk.typ": conf
#show: doc => conf(
  title: [
    Arrays and Iterables,
  ],
  lesson: "WEB",
  col: 1,
  doc,
)

= Exercice 1
Réécrire le code donné pour que doInOneSecond ne prenne plus qu’un argument, et retourne une Promise.
```javascript
function doInOneSecond(arg, callback) {
    console.log(arg);
    setTimeout(callback, 500);
}

doInOneSecond("five...", function() {
    doInOneSecond("four...", function() {
        doInOneSecond("three...", function() {
            doInOneSecond("two...", function() {
                doInOneSecond("one...", function() {
                    console.log("fire!!!");
                });
            });
        });
    });
});
```
*Réponse*
```javascript
function doInOneSecond(arg) {
    console.log(arg);
    return new Promise(resolve => {
        setTimeout(() => {
            resolve();
        }, 1000); // Utilisation de 1000 ms pour attendre une seconde
    });
}

doInOneSecond("five...")
    .then(() => doInOneSecond("four..."))
    .then(() => doInOneSecond("three..."))
    .then(() => doInOneSecond("two..."))
    .then(() => doInOneSecond("one..."))
    .then(() => {
        console.log("fire!!!");
    });
```