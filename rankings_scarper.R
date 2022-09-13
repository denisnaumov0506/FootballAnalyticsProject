library(jsonlite)
library(httr)
library(rvest)
library(tidyverse)
library(lubridate)



getRanking = function(page, date){

    response = GET(paste0('https://www.transfermarkt.com/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=', date, '&page=', page))

    sc = status_code(response)

    if(sc == 200) {
        url_New = paste0('https://www.transfermarkt.com/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=', date, '&page=', page)
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
        df = data.frame(Land=Land, Rang=Rang, Punkte=Punkte, Datum = as.Date(date))
        return(df)
    } else {
        return(data.frame())
    }


}

?map2_df

getRanking(2)
FIFA_Ranking = function(date) {
    return (map2_df(1:9, date, getRanking))
}

seq(as.Date('2010-05-26'), as.Date('2010-12-31'), by=1)

test = map_df(seq(as.Date('2010-05-26'), as.Date('2010-12-31'), by=1), FIFA_Ranking)
test

write.csv(test, 'rankingsSaid.csv')

getRank = function(country, date) {
    FIFA_Ranking = map2_df(1:9, date, getRanking)

    FIFA_Ranking %>%
        filter(Land == country) %>%
        select('Rang') -> Land_Rang

    return(Land_Rang)
}

getRank('France', '2022-06-23')

?map_df

?pmap_df

url1 = "https://www.transfermarkt.com/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=2010-05-26"

url1 %>%
    read_html() %>%
    html_elements('.inline-select select option') %>%
    html_text -> test

    test

