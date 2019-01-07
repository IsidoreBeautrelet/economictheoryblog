setwd("/Users/williamlief/Documents/github/economictheoryblog")
source("robust_summary.R")

library(dplyr)

data("iris")
iris.subset <- filter(iris, Petal.Width < 1.2)


m0 <- lm(Sepal.Length ~ Sepal.Width, data = iris.subset)
m1 <- lm(Sepal.Length ~ Sepal.Width, data = iris %>% filter(Petal.Width < 1.2))
m2 <- lm(Sepal.Length ~ Sepal.Width, data = filter(iris, Petal.Width < 1.2))


summary(m0, cluster = c("Species"))
summary(m1, cluster = c("Species"))
summary(m2, cluster = c("Species"))