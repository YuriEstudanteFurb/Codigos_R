
install.packages('WDI')
install.packages()

---
title: "Yuri Corrêa Rocha"
format: html
editor: visual
---
  
  ```{r}
#| label: load-packages # nomes únicos
#| include: false # não inclui o resultado no doc

library(tidyverse) # pacote ggplot2 (gráficos)
library(WDI) # pacote dos dados

# BASES DE DADOS
# COLOCAR OS TRÊS OBJETOS DE DADOS

# EXEMPLO DA AULA 6
# DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')
# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD',
                    start = 2023, end = 2023)
# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')
```

## VARIÁVEL

Falar sobre sua variável.

## GRÁFICO COM DADOS EM PAINEL

Falar sobre o gráfico com dados em painel.

```{r}
#| label: dadosempainel
#| warning: false
#| echo: false

ggplot(data = dadospib,
       mapping = aes(y = NY.GDP.MKTP.CD,
                     x = year)) +
  geom_point()
```

## GRÁFICO COM CORTE TRANSVERSAL

Falar sobre o gráfico com dados de corte tranversal.

```{r}
#| label: dadoscortetransversal
#| warning: false 
#| echo: false  

ggplot(dadospib2023,
       mapping = aes(y = NY.GDP.MKTP.CD,
                     x = year)) +
  geom_point()
```

## GRÁFICO COM SÉRIE TEMPORAL

Falar sobre o gráfico com dados de série temporal.

```{r}
#| label: dadosserietemporal
#| warning: false 
#| echo: false

ggplot(dadospibbr,
       mapping = aes(y = NY.GDP.MKTP.CD,
                     x = year)) +
  geom_line()
```