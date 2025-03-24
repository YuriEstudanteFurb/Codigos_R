# Passo 1: Instalar os pacotes necessários (caso ainda não tenha instalado)
install.packages("ggplot2")
install.packages("dplyr")
install.packages("lubridate")

# Passo 2: Carregar as bibliotecas
library(ggplot2)
library(dplyr)
library(lubridate)

# Passo 3: Baixar o arquivo CSV
url <- "https://www.tesourotransparente.gov.br/ckan/dataset/f0468ecc-ae97-4287-89c2-6d8139fb4343/resource/e5f90e3a-8f8d-4895-9c56-4bb2f7877920/download/VendasTesouroDireto.csv"
data <- read.csv(url, sep=";", stringsAsFactors = FALSE)

# Passo 4: Renomear as colunas
colnames(data) <- c("TIPO_TITULO", "VENCIMENTO_DO_TITULO", "DATA_VENDA", "PU", "QUANTIDADE", "Valor")

# Passo 5: Converter a coluna 'DATA_VENDA' para o formato de data
data$DATA_VENDA <- dmy(data$DATA_VENDA)

# Passo 6: Substituir vírgula por ponto nas colunas 'PU' e 'QUANTIDADE' e transformá-las em numéricas
data$PU <- as.numeric(gsub(",", ".", data$PU))
data$QUANTIDADE <- as.numeric(gsub(",", ".", data$QUANTIDADE))

# Passo 7: Filtrar apenas os dados do título 'Tesouro Selic'
data_tesouro_selic <- data %>%
  filter(TIPO_TITULO == "Tesouro Selic") %>%
  arrange(desc(DATA_VENDA))

# Passo 8: Plotar os gráficos

# Configuração do gráfico
par(mfrow=c(2, 1), mar=c(4, 4, 2, 2), oma=c(0, 0, 2, 0))

# Gráfico 1: PU ao longo do tempo
plot(data_tesouro_selic$DATA_VENDA, data_tesouro_selic$PU, type="l", col="blue", 
     xlab="Data Venda", ylab="PU", main="Preço Unitário (PU)", lwd=2)

# Gráfico 2: Quantidade ao longo do tempo
plot(data_tesouro_selic$DATA_VENDA, data_tesouro_selic$QUANTIDADE, type="l", col="green", 
     xlab="Data Venda", ylab="Quantidade", main="Quantidade de Vendas", lwd=2)

# Ajuste final no layout do gráfico
mtext("Vendas Tesouro Direto - Tesouro Selic", outer=TRUE, cex=1.5)
