---
Type: PriseDeNote
MiseAuPropre: non
---

## Formule calcule cardinal union
Si $n = 2$
$$
|A\cup B| = |A| + |B| - |A \cap B|
$$
Si $n = 3$
$$
|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |A \cap C| - |B \cap C| + |A \cap B \cap C|
$$
Si $n = 4$
$$
\begin{align}\lvert A\cup B\cup C\cup D \rvert &= \lvert A \rvert +\lvert B \rvert +\lvert C \rvert +\lvert D \rvert \\
&-\lvert A\cap B \rvert -\lvert A\cap C \rvert - \lvert A\cap D \rvert - \lvert B\cap C \rvert -\lvert B\cap D \rvert - \lvert C\cap D \rvert  \\
&+\lvert A\cap B\cap C \rvert +\lvert A\cap C\cap D \rvert +\lvert B\cap C\cap D \rvert +\lvert A\cap B\cap D \rvert  \\
&- \lvert A\cap B\cap C\cap D \rvert \end{align}
$$
Cas général
$$
\lvert A\cup A_{1} \cup A_{n} \rvert = \sum_{i = 1}^ {n} \lvert A_{i} \rvert - \sum_{i < j} \lvert A_{i} \cap A_{j}  \rvert + \sum_{i<j<k} \left\lvert  A_{i} \cap A_{j} \cap A_{k} \right\rvert + (-1)^k\lvert A_{1} \cap A_{2} \cap A_{k} \rvert   
$$
