library(plotly)
df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_us_cities.csv')

df$q <- with(df, cut(pop, quantile(pop)))
levels(df$q) <- paste(c("1st", "2nd", "3rd", "4th", "5th"), "Quantile")
df$q <- as.ordered(df$q)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(df, locationmode = 'USA-states', sizes = c(1, 250)) %>%
  add_markers(
    x = ~lon, y = ~lat, size = ~pop, color = ~q, hoverinfo = "text",
    text = ~paste(df$name, "<br />", df$pop/1e6, " million")
  ) %>%
  layout(title = '2014 US city populations<br>(Click legend to toggle)', geo = g)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = plotly_POST(p, filename="scattergeo/bubble")
chart_link

dataaaa <- merge(data,dest[,1:5], by=c("srch_destination_id"))
dataaaa$srch_ci <- format(dataaaa$srch_ci, "%m-%d")
dataaaa$srch_ci <- as.Date(dataaaa$srch_ci, "%m-%d")
dataaaa$season
dataaas <- head(dataaaa,100)
library(zoo)
yq <- as.yearqtr(as.yearmon(dataaaa$srch_ci, "%Y-%m-%d") + 1/12)
dataaaa$Season <- factor(format(yq, "%q"), levels = 1:4, 
                    labels = c("winter", "spring", "summer", "fall"))
dataaaa$Season <- as.ordered(dataaaa$Season)

g <- list(
  scope = 'world',
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)


table <- as.data.frame(table(dataaaa$srch_destination_name))


p <- plot_geo(dataaaa, locationmode = 'USA-states', sizes = c(1, 250)) %>%
  add_markers(
    x = dataaaa$srch_destination_longitude, y = dataaaa$user_location_latitude, size = ~pop, color = ~Season, hoverinfo = "text",
    text = ~paste(df$name, "<br />", df$pop/1e6, " million")
  ) %>%
  layout(title = '2014 US city populations<br>(Click legend to toggle)', geo = g)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = plotly_POST(p, filename="scattergeo/bubble")
chart_link
?plot_geo
