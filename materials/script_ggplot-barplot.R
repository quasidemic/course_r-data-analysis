# Percentage gender
plot_data <- ess18 %>%
  filter(!is.na(v4)) %>%
  group_by(v8, v4) %>%
  summarize(count = n()) %>%
  mutate(pct = count/sum(count))

# Percentage vote
plot_data <- ess18 %>%
  filter(!is.na(v4)) %>%
  group_by(v4, v8) %>%
  summarize(count = n()) %>%
  mutate(pct = count/sum(count))


ggplot(plot_data, aes(x = v4, y = pct, fill = v8, label = scales::percent(pct))) + 
  geom_bar(position = "dodge", stat = "identity", colour = "black") + 
  scale_y_continuous(limits = c(0,1), labels = scales::percent) + 
  labs(title = "Vote across gender", x = "Voted in last election", y = "Percent of gender", fill = "Gender") + 
  geom_text(position = position_dodge(width = 1), vjust = -0.5) + 
  scale_fill_brewer(palette = "Dark2") + 
  theme_bw()