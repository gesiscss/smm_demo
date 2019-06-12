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

#plotting
install.packages("ggplot2")
require("ggplot2")
ggplot(data = merged, mapping = aes(labels)) +
  geom_line(aes(y = values.x, color="Tweets", group=response_type.x)) +
  geom_line(aes(y = values.y, color="Replies", group=response_type.y)) +
  labs(title = "The number of aggregated tweets for a politician", x = "Date", y = "N") +
  theme(axis.text.x = element_text(colour = "grey20", size = 9, angle = 60, hjust = 0.5, vjust = 0.5),
        axis.text.y = element_text(colour = "grey20", size = 9), legend.title = element_blank())

