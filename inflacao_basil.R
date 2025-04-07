# Instalar pacotes se necessário
# install.packages("WDI")
# install.packages("tidyverse")

library(WDI)
library(tidyverse)

# Buscar dados de inflação do Brasil entre 2020 e 2025
inflacao_br <- WDI(
  country = "BR",
  indicator = "FP.CPI.TOTL.ZG",
  start = 2020,
  end = 2025
)

# Checar se há dados disponíveis e organizar
inflacao_br <- inflacao_br %>%
  arrange(year) %>%
  mutate(
    ano = as.factor(year)  # Usar fator para eixo X limpo
  )

# Verificar se há dados (alguns anos futuros podem estar vazios)
print(inflacao_br)

# Gráfico da inflação ao longo dos anos
grafico_linha <- ggplot(inflacao_br, aes(x = ano, y = FP.CPI.TOTL.ZG, group = 1)) +
  geom_line(color = "#2980b9", size = 1.2) +
  geom_point(size = 4, color = "#2980b9") +
  geom_text(aes(label = round(FP.CPI.TOTL.ZG, 1)), vjust = -1, size = 4.5) +
  labs(
    title = "📉 Variação da Inflação no Brasil (2020 - 2025)",
    subtitle = "Inflação anual (% ao ano)",
    x = "Ano",
    y = "Inflação (%)",
    caption = "Fonte: Banco Mundial / WDI"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(size = 18, face = "bold"),
    plot.subtitle = element_text(size = 14),
    axis.text = element_text(size = 12),
    plot.caption = element_text(size = 10, color = 
                                  "gray40")
  )

# Mostrar gráfico
print(grafico_linha)
