#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: [
    Cheatsheet GO
  ],
  lesson: "SDR",
  col: 1,
  doc,
)

= Snippet d'exercice
```Go
package main

import "fmt"

func main() {

	var test = "Michel";
	
	nom := "Christophe";
	
	tableau := [3]string{test, nom, "Paul"}
	
	age := map[string]string{
		tableau[0]: "22",
		tableau[1]: "24",
		tableau[2]: "18",
	}
	
	if i := 10; i > 0 {
		tableau[0] = "42"
	}

	fmt.Println("Salut,",
				test + " (" + age["Michel"] + " ans),",
				nom + " (" + age[nom] + " ans) ainsi que", 
				tableau[2])
}
```