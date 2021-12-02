# Introduktion til R ved DEFACTUM



Program til introduktionskursus i R til dataanalyse ved DEFACTUM 30/11-2021 og 3/12-2021.



## Dag 1 (8.45-14.45)


| Time  | Module                                                       | Content                                                      | Undervisningsformat |
| ----- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| 00:00 | **[Introduktion til R](https://quasidemic.github.io/teachR/teachR-what-is-R.slides.html)** | Hvad er R? <br />Generelle forskelle mellem R og andre analyseprogrammer <br />Introduktion til RStudio brugerfladen <br />Håndtering af arbejdsstier og projekter i RStudio | Slides              |
| 00:20 | **[Basale koncepter i R](https://quasidemic.github.io/teachR/teachR_basic-concepts.slides.html)** | Objekter og typer <br />Funktioner og pakker                 | Slides              |
| 0:55  | *Pause*                                                      |                                                              | -                   |
| 1:00  | **[Basale koncepter i R](https://quasidemic.github.io/teachR/teachR_basic-concepts.slides.html)** | Datastrukturer i R: vectorer, lister og data frames <br />(Kontrolstrukturer i R: loops og if-betingelser) | Slides              |
| 1:20  | ***[Øvelse: Basale koncepter](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/1)*** |                                                              | Øvelse              |
| 1:35  | **[Introduktion til data frames](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_data-frames.ipynb)** | Indlæsning af csv-filer som data frames (med `readr`)<br />Simpel udforskning af data | Live coding         |
| 1:55  | *Pause*                                                      |                                                              |                     |
| 2:00  | **[Introduktion til data frames - fortsat](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_data-frames.ipynb)** | Opbygning af data frames (indexes, kolonner)<br />Deskriptive mål | Live coding         |
| 2:35  | ***[Øvelse: Data frames](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/4)*** |                                                              | Øvelse              |
| 2:45  | **[Introduktion til datavisualisering i R (med ggplot2)](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_visualize-ggplot2.ipynb)** | Generering af plots                                          | Live coding         |
| 3:00  | *Frokost*                                                    |                                                              | -                   |
| 3:45  | **Datahåndtering i R (med tidyverse)**                       | Introduktion til tidyverse<br />[Filtrering og selektion](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_filter-subset.ipynb)<br />[Variabelgenerering og simpel rekodning](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_create-recode-classes.ipynb) | Live coding         |
| 4:30  | ***[Øvelse: Datahåndtering](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/5)*** |                                                              | Øvelse              |
| 4:40  | *Pause*                                                      |                                                              | -                   |
| 4:45  | **Datahåndtering i R (med tidyverse) - fortsat**             | [Rekodning af kategorier](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_recoding-categories.ipynb)<br />Rekodning af flere variable<br /> | Live coding         |
| 5:05  | ***[Øvelse: Rekodning af kategorier](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/7)*** |                                                              | Øvelse              |
| 5:20  | **[Introduktion til datavisualisering i R (med ggplot2) - fortsat](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_visualize-ggplot2.ipynb)** | Gængse plots (scatterplots, smooth, bar, histogram)<br />Justering af plot-elementer | Live coding         |
| 5:45  | ***[Øvelse: ggplot2](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/13)*** |                                                              | Øvelse              |
| 6:00  | *Slut*                                                       |                                                              | -                   |



## Dag 2 (8.45-14.45)


| Time  | Module                                                       | Content                                                      | Undervisningsformat         |
| ----- | ------------------------------------------------------------ | ------------------------------------------------------------ | --------------------------- |
| 00;00 | ***Genopfriskning***                                         | Hvor slap vi?                                                | Live coding                 |
| 00:10 | ***[Øvelse: ggplot2](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/14)*** |                                                              | Øvelse                      |
| 00:30 | **[Håndtering af factors i R](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_factors.ipynb)** | Konvertering til factor<br />Ordered/unordered<br />Factors i plots | Live coding                 |
| 00:55 | *Pause*                                                      |                                                              | -                           |
| 1:00  | **[Indlæsning af andre datatyper (med `haven`)](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_haven-stata.ipynb)** | Indlæsning af Stata-data i R <br />Håndtering af labels      | Live coding                 |
| 1:15  | **Datahåndtering i R (med tidyverse) - fortsat**             | [Join/merge af data](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_join-pivot.ipynb)<br /><br />Rekodning af flere variable<br />[Pivotering](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_join-pivot.ipynb) | Live-coding / Demonstration |
| 1:55  | *Pause*                                                      |                                                              | -                           |
| 2:00  | ***[Øvelse: Rekodning af kategorier](https://quasidemic.github.io/teachR/teachR_exercises.slides.html#/7)*** |                                                              | Øvelse                      |
| 2:15  | **[Udforskning af data](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_tables-summaries.ipynb)** | Frekvenstabeller<br />"Split-apply-combine" med group by og summarise | Live coding                 |
| 2:45  | **[Simple uafhængighedstests](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_statistics-intro.ipynb)** | Chi-i-anden                                                  | Live coding                 |
| 2:55  | *Pause*                                                      |                                                              |                             |
| 3:00  | **[Simple uafhængighedstests - fortsat](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_statistics-intro.ipynb)** | T-tests                                                      | Live coding                 |
| 3:30  | *Frokost*                                                    |                                                              | -                           |
| 4:00  | **[Introduktion til statistisk modellering i R](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_statistical-modelling.ipynb)** | Simple lineære og logistiske regressionsanalyser i R<br />Factors og regressionsanalyser | Live coding                 |
| 4:30  | **[Eksport af resultater](https://github.com/quasidemic/teachR/blob/master/notebooks/teachR_output-results.ipynb)** | Tabeller med `kable`<br />Modeller med `stargazer`           | Live coding                 |
| 4:55  | *Pause*                                                      |                                                              | -                           |
| 5:00  | Buffer                                                       |                                                              | -                           |
| 5:15  | **Introduktion til RMarkdown**                               |                                                              | Live coding                 |
| 6:00  | Slut                                                         |                                                              | -                           |

