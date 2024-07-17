# Instalar y cargar paquetes necesarios
install.packages("readr") #facilita la lectura y escritura de textos
install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
library(readr)

# Cargar el archivo CSV
df <- read_csv("C:/export-data-jesi.csv")

# resumen general de los datos:
  
summary(df)

#podemos graficar el número de publicaciones por año

ggplot(df, aes(x = `Publication Year`)) +
  geom_bar() +
  labs(title = "Número de Publicaciones por Año",
       x = "Año de Publicación",
       y = "Número de Publicaciones")

#grafico por tipo de publicaciones

ggplot(df, aes(x = `Item Type`)) +
  geom_bar() +
  labs(title = "Distribución de Tipos de Publicaciones",
       x = "Tipo de Publicación",
       y = "Número de Publicaciones") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#contamos las publicaciones por autor, ¿sería útil graficarlas?
autor_publicaciones <- df %>%
  group_by(Author) %>% #agrupamos por autor
  summarise(Count = n()) %>% #cuenta las publicaciones que tiene cada autor.
  arrange(desc(Count)) #ordenamos en forma descendente

# le pedimos que muestre las primeras filas
head(autor_publicaciones)

#Aquí grafico las Publicaciones por autor, aunque no es tan útil en este caso porque en mi archivo sólo un autor tiene 2 publicaciones, el resto tiene sólo una

ggplot(df, aes(y = `Author`)) +
  geom_bar() +
  labs(title = "Publicaciones por Author",
       y = "Autor",
       x = "Cantidad de Publicaciones")


# Graficamos las publicaciones por idioma, filtramos los valores vacíos, NA, en la columna Language

ggplot(df %>% filter(!is.na(Language)), aes(x = Language)) +
  geom_bar() +
  labs(title = "Publicaciones por Idioma",
       x = "Idioma",
       y = "Número de Publicaciones") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))