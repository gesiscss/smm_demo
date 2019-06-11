install.packages("httr")
require("httr")
install.packages("jsonlite")
require("jsonlite")

base <- "http://10.6.13.139:8000/api/politicians/"
call1 <- paste(base,"all/", sep="")
get_politicians_df <- as.data.frame(fromJSON(content(GET(call1), "text"), flatten = TRUE))
View(get_politicians_df)
# In the table 'get_politicians_df' you can see all the extracted politicians with respected twitter, facebook and wikipedia ids.

# Please choose a politician from the table above and input the `politician_id` and `aggregation` variables below:
politician_id <- "27"
aggregation <- "month" # aggregation can be by day ('day'), week ('week') or month('month')

call_tweets <- paste(base,"twitter/tweets_by/politicians/", politician_id, "/?aggregate_by=", aggregation, sep="")
call_replies <- paste(base,"twitter/replies_to/politicians/", politician_id, "/?aggregate_by=", aggregation, sep="")
tweets_by = as.data.frame(fromJSON(content(GET(call_tweets), "text"), flatten = TRUE))
replies_to = as.data.frame(fromJSON(content(GET(call_replies), "text"), flatten = TRUE))
merged = merge(tweets_by, replies_to, by='labels')

View(merged)
with(merged,plot(labels, values.x, type="h", main='The number of aggregated tweets for a politician', xlab='Date', ylab='Number of tweets'))
lines(merged$labels, merged$values.x, col='red')
lines(merged$labels, merged$values.y, col='blue')
