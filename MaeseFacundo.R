install.packages("tidyverse")
library(tidyverse)
provincias <- read.csv('./Provincias.csv')

provincias <- provincias %>%
  rename(situacion_calle = Personas.en.situación.de.calle..vía.pública.)

# Calculamos la media de personas en situación de calle por provincia
media_situacion_calle <- provincias %>%
  group_by(Nombre.de.provincia) %>% #Agrupamos los datos por la columna Nombre.de.provincia.
  summarise(media_situacion_calle = mean(situacion_calle, na.rm = TRUE)) #Calculamos la media de la columna situacion_calle por cada provincia agrupada, generamos una nueva columna 'media_situacion_calle'

# Creamos el gráfico de personas en situación de calle por provincias
ggplot(provincias, aes(x = reorder(Nombre.de.provincia, situacion_calle), y = situacion_calle)) + #indicamos que datos asignamos a cada eje
  geom_bar(stat = "identity", na.rm = TRUE) + #el tipo de gráfico que realizaremos, podría 
  coord_flip() +  # Giramos el gráfico para mayor legibilidad
  labs(title = "Personas en situaciones de calle por Provincias argentinas", #indicamos las etiquetas
       x = "Provincias",
       y = "Cantidad de personas en situación de calle") +
  theme_light() #indicamos el tema, ggplot tiene 8 temas, el genérico es minimal