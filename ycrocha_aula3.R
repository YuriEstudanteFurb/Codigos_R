# Instalar pacotes, se necessário
install.packages("tidyverse")
install.packages("WDI")

# Carregar pacotes
library(tidyverse)
library(WDI)

# Ajustar números científicos
options(scipen = 999)  

# Baixar dados do PIB global e do Brasil
basepib <- WDI(country = "all", indicator = "NY.GDP.MKTP.CD")
basepib_BR <- WDI(country = "BR", indicator = "NY.GDP.MKTP.CD")

# Baixar dados de incidência de HIV nos EUA
baseHIV <- WDI(country = "US", indicator = "SH.HIV.INCD")

# Criar gráfico do PIB do Brasil ao longo dos anos
grafserie <- ggplot(basepib_BR,
                    mapping = aes(y = NY.GDP.MKTP.CD, 
                                  x = year)) + 
  geom_point()

# Exibir gráfico
print(grafserie)


grafserie <- ggplot(baseHIV, 
                    mapping = aes(y = SH.HIV.INCD, x = year)) + 
  geom_line()

print(grafserie)
