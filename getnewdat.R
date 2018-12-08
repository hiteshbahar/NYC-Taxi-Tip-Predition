
getdat = function(dat,name){
  
  library(stringr)
  
  # Split up pick up times and drop off times into dummy variables of 4 time zones
  
  k = str_split_fixed(dat$tpep_dropoff_datetime, " ", Inf)
  j = str_split_fixed(k[,2], ":", Inf)
  l = j[,1]
  l = as.numeric(l)
  pt1 = rep(0,length(l));pt2 = rep(0,length(l));pt3 = rep(0,length(l));pt4 = rep(0,length(l))
  pt1[which(l<6)] = 1;pt2[which(l>=6 & l<12)] = 1;pt3[which(l>=12 & l<18)] = 1;pt4[which(l>=18)] = 1
  pt = cbind(pt1,pt2,pt3,pt4)
  
  k = str_split_fixed(dat$tpep_dropoff_datetime, " ", Inf)
  j = str_split_fixed(k[,2], ":", Inf)
  l = j[,1]
  l = as.numeric(l)
  dt1 = rep(0,length(l));dt2 = rep(0,length(l));dt3 = rep(0,length(l));dt4 = rep(0,length(l))
  dt1[which(l<6)] = 1;dt2[which(l>=6 & l<12)] = 1;dt3[which(l>=12 & l<18)] = 1;dt4[which(l>=18)] = 1
  dt = cbind(dt1,dt2,dt3,dt4)
  
  # Categorize into one of the four seasons
  

  
  a = str_split_fixed(dat$tpep_dropoff_datetime, "-", Inf)
  i = a[,2]
  i = as.numeric(i)
  szn1 = rep(0,length(i));szn2 = rep(0,length(i));szn3 = rep(0,length(i));szn4 = rep(0,length(i))
  szn1[which(a<=2 & a == 12)] = 1;szn2[which(a>=3 & a<=5)] = 1
  szn3[which(a>=6 & a<=8)] = 1;szn4[which(a>=9 & a<=11)] = 1
  szn = cbind(szn1,szn2,szn3,szn4)
  
  # Convert dates into weekdays
  
  k = str_split_fixed(dat$tpep_dropoff_datetime, " ", Inf)
  l = k[,1]
  r = weekdays(as.Date(l))
  sun = rep(0,length(r));mon = rep(0,length(r));tues = rep(0,length(r));wed = rep(0,length(r));
  thurs = rep(0,length(r));fri = rep(0,length(r));sat = rep(0,length(r))
  sun[which(r == "Sunday")] = 1
  mon[which(r == "Monday")] = 1
  tues[which(r == "Tuesday")] = 1
  wed[which(r == "Wednesday")] = 1
  thurs[which(r == "Thursday")] = 1
  fri[which(r == "Friday")] = 1
  sat[which(r == "Saturday")] = 1
  day = cbind(sun,mon,tues,wed,thurs,fri,sat)
  
  
  bind = cbind(dat,szn,day,pt,dt)
  rm <- c(1,3,4)
  bind = bind[,-rm]
  
  write.csv(bind, file = name)
  return(bind)
  
}

#dat = read.csv("./570_project/training_data/jan_2017.csv")
#new = getdat(dat,"jan_2017.csv")

dat2 = read.csv("./570_project/training_data/feb_2017.csv")
new2 = getdat(dat2, "feb")



