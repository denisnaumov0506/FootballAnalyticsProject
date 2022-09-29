FIFA_Rank <- read.csv2("https://raw.githubusercontent.com/denisnaumov0506/FootballAnalyticsProject/master/FIFA_Ranking.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="latin1")
Recent_FIFA <- read.csv2("https://raw.githubusercontent.com/denisnaumov0506/FootballAnalyticsProject/master/Recent_FIFA_Ranking.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="latin1")

FIFA_Ranking <- rbind(FIFA_Rank,Recent_FIFA)

FIFA_Ranking %>%
  separate(Rang, c('Rang', 'Sym')) %>%
  select(-'Sym') %>%
  mutate(fifa_date = ymd(Datum)) %>%
  select(-c('Datum')) -> Whole_FIFA_Ranking
