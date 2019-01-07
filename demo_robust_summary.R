# load necessary packages for demo
library(RCurl)
library(dplyr)
# the summary function needs this package
library(sandwich) 

# import the function from repository
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)


data("iris")
iris.subset <- filter(iris, Petal.Width < 1.2)


m0 <- lm(Sepal.Length ~ Sepal.Width, data = iris.subset)
m1 <- lm(Sepal.Length ~ Sepal.Width, data = iris %>% filter(Petal.Width < 1.2))
m2 <- lm(Sepal.Length ~ Sepal.Width, data = filter(iris, Petal.Width < 1.2))


summary(m0, cluster = c("Species"))
summary(m1, cluster = c("Species"))
summary(m2, cluster = c("Species"))
