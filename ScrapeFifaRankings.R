
base_url = "https://www.transfermarkt.de/statistik/weltrangliste/statistik/stat/plus/0/galerie/0?datum=2010-05-26&page="

page = 1



scrapeRankings = function(page) {

    columnValues = list()

    new_url = paste0(base_url, page)

    print(new_url)

    new_url %>%
        read_html() %>%
        html_elements('.responsive-table') -> responsive

    responsive %>%
        html_elements('tr td:nth-of-type(1)') %>%
        html_text() -> rank

    print(rank)

    responsive %>%
        html_elements('tr td:nth-of-type(2)') %>%
        html_text() -> nations

    print(nations)

    responsive %>%
        html_elements('tr td:nth-of-type(4)') %>%
        html_text() -> points

    print(points)

    columnValues = append(columnValues, list(rank))
    columnValues = append(columnValues, list(nations))
    columnValues = append(columnValues, list(points))

    columnValues
}

df = NULL

for (i in 1:9) {

    testData = scrapeRankings(i)

    if(!is.data.frame(df)) {
        df = data.frame(testData[[1]])

        for (i in 2:length(testData)) {
            df[i] = testData[[i]]
        }
    } else {
        df_new = data.frame(testData[[1]])

        for (i in 2:length(testData)) {
            df_new[i] = testData[[i]]
        }
        df = bind_rows(df, df_new)
    }
}

df

