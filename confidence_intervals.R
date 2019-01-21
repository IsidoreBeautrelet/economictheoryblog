conf <- function(x,conf_level=0.95,distribution="normal"){
  mean <- mean(x,na.rm = T)
  if(distribution=="normal"){
  error <- qnorm(1-(1-conf_level)/2)*sd(x,na.rm =T )/sqrt(length(na.omit(x)))
  }else{
    n<-length(na.omit(x))
    error <- qt(1-(1-conf_level)/2,df=n-1)*sd(x,na.rm =T )/sqrt(n)
  }
  c(mean-error,mean+error)
}

conf_fix <- function(mean,std,n,conf_level=0.95,distribution="normal"){
  if(distribution=="normal"){
    error <- qnorm(1-(1-conf_level)/2)*std/sqrt(n)
  }else{
    error <- qt(1-(1-conf_level)/2,df=n-1)*std/sqrt(n)
  }
  c(mean-error,mean+error)
}
