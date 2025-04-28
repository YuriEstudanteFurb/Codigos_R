# --------------------------------------------------------
# Análise do Produto Interno Bruto (PIB) - Banco Mundial
# Autor: Bruno Thiago Tomio
# --------------------------------------------------------

# Instalar pacote se necessário
# install.packages("WDI")
# install.packages("tidyverse")

library(WDI)
library(tidyverse)

# Evitar notação científica
options(scipen = 999)

# --------------------------------------------------------
# VARIÁVEL
# PIB - Produto Interno Bruto (código: NY.GDP.MKTP.CD)
# Medido em dólares correntes (current US$)
# --------------------------------------------------------

# --------------------------------------------------------
# BASES DE DADOS
# --------------------------------------------------------

# Dados em painel: PIB de todos os países em todos os anos disponíveis
dados_painel <- WDI(country = "all", indicator = "NY.GDP.MKTP.CD")

# Corte transversal: PIB dos países em 2023
dados_corte2023 <- WDI(country = "all", indicator = "NY.GDP.MKTP.CD",
                       start = 2023, end = 2023)

# Série temporal: PIB do Brasil entre 2000 e 2024
dados_brasil <- WDI(country = "BR", indicator = "NY.GDP.MKTP.CD",
                    start = 2000, end = 2024)

# --------------------------------------------------------
# GRÁFICO 1: DADOS EM PAINEL
# --------------------------------------------------------

# Filtrar alguns países para facilitar visualização
dados_filtrados <- dados_painel %>%
  filter(country %in% c("Brazil", "United States", "China", "India"))

ggplot(dados_filtrados, aes(x = year, y = NY.GDP.MKTP.CD, color = country)) +
  geom_line(size = 1) +
  scale_y_log10() +
  labs(title = "Evolução do PIB (log10)",
       x = "Ano", y = "PIB (US$ correntes, log)",
       color = "País")

# --------------------------------------------------------
# GRÁFICO 2: CORTE TRANSVERSAL (PIB em 2023)
# --------------------------------------------------------

# Top 10 países com maior PIB em 2023
dados_corte_limp <- dados_corte2023 %>%
  filter(!is.na(NY.GDP.MKTP.CD)) %>%
  top_n(10, NY.GDP.MKTP.CD)

ggplot(dados_corte_limp, aes(x = reorder(country, NY.GDP.MKTP.CD),
                             y = NY.GDP.MKTP.CD)) +
  geom_col(fill = "skyblue") +
  coord_flip() +
  scale_y_log10() +
  labs(title = "Top 10 países por PIB em 2023 (log10)",
       x = "País", y = "PIB (US$ correntes, log)")

# --------------------------------------------------------
# GRÁFICO 3: SÉRIE TEMPORAL - PIB DO BRASIL
# --------------------------------------------------------

ggplot(dados_brasil, aes(x = year, y = NY.GDP.MKTP.CD)) +
  geom_line(color = "darkgreen", size = 1.2) +
  labs(title = "PIB do Brasil (2000–2024)",
       x = "Ano", y = "PIB (US$ correntes)")
