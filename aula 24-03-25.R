# API (FORMA DE ACESSO)
#DADOS DO BANCO MUNDIAL (WORLD BANK)
#WORDK DEVELOPMENT INDICADORES(BASE DE DADOS)

#NA AULA PASSADA , ACESSAMOS OD DADOS DO PIB
#PTODUTO INTERNO BRUTO
#
#

#install.packages("WDI")
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

basepib_BR <- WDI(country = "BR", indicator = "NY.GDP.MKTP.CD", start = 2023,end = 2024)


# DADOS EM PAINEL

# Carregar o pacote WDI
library(WDI)

# Taxa de crescimento médio anualizada - PIB global para todos os países
base_CRECIMENTO <- WDI(country = "all", indicator = "NY.GDP.MKTP.CD")

# Cortes transversais - PIB global para todos os países entre 2020 e 2024
base_CRECIMENTO_TEMPORAL <- WDI(country = "all", indicator = "NY.GDP.MKTP.CD", start = 2020, end = 2024)

# Séries temporais - PIB do Brasil entre 2020 e 2024
base_CRECIMENTO_LOCAL <- WDI(country = "BR", indicator = "NY.GDP.MKTP.CD", start = 2020, end = 2024)



#	 Taxa de crescimento médio anualizada do consumo 
#  ou renda média per capita real da pesquisa, população total (%)(SI.SPR.PCAP.ZG)





