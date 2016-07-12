
library(plyr)
#Datos pelis y usuarios
ratings <- read.table("D:/master/data/recomendaciones/ml-100k/u.data", sep = "\t")
colnames(ratings) <- c("user", "movie", "rating", "timestamp")
ratings$timestamp <- NULL         # no la necesito


#Datos pelis completas
peliculas <- read.table("D:/master/data/recomendaciones/ml-100k/u.item", sep = "|",quote="")
colnames(peliculas) [1]<- "movie"
colnames(peliculas) [2]<- "titulo"

#Datos usuarios
usuarios <- read.table("D:/master/data/recomendaciones/ml-100k/u.user", sep = "|",quote="")
colnames(usuarios) [1]<- "user"
colnames(usuarios) [2]<- "edad"
colnames(usuarios) [3]<- "sexo"
colnames(usuarios) [4]<- "ocupacion"

ratings_tit <- merge(x = ratings, y = peliculas[ , c("movie", "titulo")], by = "movie", all.x=TRUE)

recom <- function(edad,sexo,ocupacion){
  
  user_filtrado <- usuarios[abs(usuarios$edad-edad)<=5,]
  user_filtrado <- user_filtrado[user_filtrado$sexo==sexo,]
  user_filtrado <- user_filtrado[user_filtrado$ocupacion==ocupacion,]
  res2 <-ratings_tit[ratings_tit$user %in% user_filtrado$user,]
  res_rating <- ddply(res2,.(movie),summarize, n.users=length(movie),mean_rating=mean(rating))
    res_rating <- res_rating[res_rating$n.users>4,]
    res_rating <- merge(x = res_rating, y = peliculas[ , c("movie", "titulo")], by = "movie", all.x=TRUE)
  recom <- res_rating[order(-(res_rating$mean_rating)),]
    recom <- recom[,c("movie","titulo")]
}

shinyServer(function(input, output) {  
  #renderTable es la que me pinta la tabla
  #  output$tablaPelis <- renderTable({peliculas})
  output$tablaPelis <- renderTable({
    head(recom(input$edad,input$sexo,input$ocupacion),n=10)
  })
  
})
