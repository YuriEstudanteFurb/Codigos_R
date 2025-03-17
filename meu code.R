# install.packages("WDI")
library(WDI)
# 	GDP (current US$)(NY.GDP.MKTP.CD)
 #  BAIXAR OOS DADOS DO PIB (PRODUTO INTERNO BRUTO)
 #  TUDO QUE É PRODUZIDO EM UM PAIS/ESTADO/MUN
 #  EM UM DETERMINADO PERIODO
 #
 #	GDP (current US$)(NY.GDP.MKTP.CD)
 #  GROSS DOMESTIC PRODUCT (GDP) EM DOLARS NORTE-AMERICANO
 #  CODIGO NY.GDP.MKTP
 #
 #
 
 
 COD_GDP <- WDIsearch('GDP')
 # É IMPORTANTE PROVURAR PELO PR´RPRIO SITE
 #DO BANCO MUNDIAL , É MAIS
 #EFICIENTE
 
 
 
 # COM O CODIGO , VAMOS BAIXAR OS DADOS
options(scipen = 999) # ajustar numeros cientificos  
basepib <- WDI(country = "all", indicator = "NY.GDP.MKTP.CD", start = 2023 ,end = 2023)


