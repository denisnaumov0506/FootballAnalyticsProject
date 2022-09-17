library(jsonlite)
library(httr)
library(rvest)
library(tidyverse)
library(lubridate)
#install.packages("stringr")
library("stringr")


getRanking = function(page){
  url_New = paste0('https://www.transfermarkt.com/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=2010-05-26&page=', page)
  url_New %>%
    read_html() %>% html_elements(".items") -> FIFA
  FIFA %>%
    html_elements("tr .hauptlink img") %>%
    html_attr("title") -> Land
  
  
  FIFA %>%
    html_elements("tr .zentriert.cp") %>%
    html_text()-> Rang
  
  FIFA %>%
    html_elements("tr .zentriert.hauptlink") %>%
    html_text()-> Punkte
  df = data.frame(Land=Land, Rang=Rang, Punkte=Punkte, Datum = as.Date("2010-05-26"))
  return(df)
}


FIFA_Ranking = map_df(1:4, getRanking)


getRanking_Datum = function(page, Datum){
  url_New = paste0('https://www.transfermarkt.com/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=', Datum,'&page=', page)
  url_New %>%
    read_html() %>% html_elements(".items") -> FIFA
  FIFA %>%
    html_elements("tr .hauptlink img") %>%
    html_attr("title") -> Land
  
  
  FIFA %>%
    html_elements("tr .zentriert.cp") %>%
    html_text()-> Rang
  
  Rang <- str_replace_all(Rang," ","")
  
  FIFA %>%
    html_elements("tr .zentriert.hauptlink") %>%
    html_text()-> Punkte
  df = data.frame(Land=Land, Rang=Rang, Punkte=Punkte, Datum = as.Date(Datum))
  return(df)
}

# Testing

getRanking_Datum(1,"2010-05-26")
FIFA_Ranking_Datum = map2_df(1:4, c("2010-05-26"),getRanking_Datum)
FIFA_Ranking_Datum

Zu_Datum = function(Datum){
  FIFA_Rank_Datum = map2_df(1:9, c(Datum),getRanking_Datum)
}
  


## Total_df = map_df(Jahr_2010,Zu_Datum)

## Scraping the dates

url1 = "https://www.transfermarkt.com/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=2010-05-26"
url1 %>%
  read_html() %>% 
      html_elements(".inline-select select option") %>% 
      html_text() -> Dates
Dates

## Transform the dates

mdy(Dates)

## Whole Dataset

Total_df = map_df(mdy(Dates),Zu_Datum)


## Storing the dataset into a csv file

write.csv(Total_df,"C:\\Users\\laami\\Desktop\\Mamba\\Sommersemester 2022\\Topics in Data Science\\FIFA_Ranking2.csv", row.names = FALSE)

#write.csv(Total_df,"C:\\Users\\laami\\Desktop\\Mamba\\Sommersemester 2022\\Topics in Data Science\\FIFA.csv", row.names = FALSE,fileEncoding = 'UTF-8-BOM' )
