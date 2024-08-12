
# Instalamos y cargamos paquetes necesarios
install.packages("readr") #facilita la lectura y escritura de textos
install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
library(readr)

# Cargar el archivo CSV
 df<-read_csv("C:/ER/export-data.csv")

# resumen general de los datos:
  
summary(df)

#graficamos el número de publicaciones por año

ggplot(df, aes(x = `Publication.Year`)) +
  geom_bar() +
  labs(title = "Número.de.Publicaciones",
       x = "Publication.Year",
       y = "Número.de.Publicaciones")

#graficamos el número de publicaciones por año y cambiamos de color

ggplot(df, aes(x = `Publication.Year`, y = `Número.de.Publicaciones`)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Número.de.Publicaciones por Año",
       x = "Publication.Year",
       y = "Número.de.Publicaciones")

#graficamos Número de publicaciones por Creador

ggplot(df, aes(x = `Publication.Year`, y = `Número.de.Publicaciones`)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Número de Publicaciones por Creador",
       x = "Publication.Year",
       y = "Número de Publicaciones") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#graficamos Número de publicaciones por Creador y cambiamos el color



ggplot(df, aes(x = `Publication.Year`, y = `Número.de.Publicaciones`)) +
  geom_bar(stat = "identity", fill = "green") +
  labs(title = "Número de Publicaciones por Creador",
       x = "Publication.Year",
       y = "Número de Publicaciones") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
