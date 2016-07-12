##Shiny
A web application framework for R

##Share Shiny with shinyapps.io

The easiest way to turn your Shiny app into a web page is to use shinyapps.io, RStudio’s hosting service for Shiny apps.

shinyapps.io lets you upload your app straight from your R session to a server hosted by RStudio. You complete control over
your app including server administration tools.

['Shinyapps.io'](https://www.shinyapps.io/)

```{r}
install.packages('rsconnect')
rsconnect::setAccountInfo(name='montsefigueiro', token='XXXXXX', secret='XXXXXX')
library(rsconnect)
rsconnect::deployApp('D:/master/data/recomendaciones/Recomend/Recomend')
```

In this directory there are:
* server.R
* ui.R
* u.data
* u.item
* u.user



