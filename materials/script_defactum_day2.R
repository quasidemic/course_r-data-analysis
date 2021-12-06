library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

# Read in data
ess18 <- read_csv("./data/ESS2018DK_subset.csv")

# Explore data
head(ess18)
summary(ess18)
summary(ess18$ppltrst)

# Create subset
ess18_males_sub <- ess18 %>%
  filter(gndr == 'Male') %>%
  select(idno, gndr, yrbrn, edlvddk)

# Summarize by gender
ess18 %>%
  group_by(gndr) %>%
  summarise(mean_net = mean(netustm, na.rm = TRUE),
            size = n()
            )

# Recode/create variables with mutate
ess18 <- ess18 %>%
  mutate(inwth = inwtm / 60,
         tygrtr_num = as.numeric(tygrtr))

class(ess18)
class(ess18$tygrtr)
class(ess18$tygrtr_num)


# Create scatterplot with fitted line
ggplot(data = filter(ess18, grspnum < 100000), mapping = aes(x = yrbrn, y = grspnum)) +
  geom_point(colour = "blue") +
  geom_smooth(colour = "lightgreen", method = "lm") + 
  theme_minimal()

# Output several plots as png files
export_vars <- c('grspnum', 'netustm')
ess18_filtered <- filter(ess18, grspnum < 100000)

i <- 1
for (expvar in export_vars){
  
  p <- ggplot(data = ess18_filtered, mapping = aes(x = yrbrn, y = ess18_filtered[[expvar]]))
  
  p <- p +
    geom_point(colour = "blue") +
    geom_smooth(colour = "lightgreen", method = "lm") + 
    labs(x = "Year born", y = expvar) + 
    theme_minimal()
  
  plot_name <- paste0("./output/", "plot", as.character(i), ".png")
  ggsave(plot_name, plot = p)
  i <- i +1
}
rm(export_vars, ess18_filtered, expvar, plot_name, p)

# Change colnames
ess18names <- colnames(ess18)
colnames(ess18) <- paste0("v", 1:length(ess18names))

varnames <- c()
for (i in 1:length(ess18names)){
  vname <- colnames(ess18)[i]
  varnames[vname] <- ess18names[i]
}
rm(i, vname)


# Mere ggplot
ggplot(data = filter(ess18, v14 < 100000), mapping = aes(x = v9, y = v14)) +
  geom_point(colour = "blue") +
  geom_smooth(colour = "lightgreen", method = "lm") + 
  theme_minimal()

ess18_filt <- filter(ess18, v14 < 100000)

ggplot(data = ess18_filt, aes(x = v14)) +
  geom_histogram()


ggplot(data = ess18_filt, aes(x = v14, colour = as.factor(v3))) +
  geom_boxplot() + 
  facet_wrap(~v8)

# 
ggplot(data = ess18_filt, mapping = aes(x = v9, y = v14, colour = v8)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  labs(title = "Månedsløn og fødselsår", x = "Fødselsår", 
       y = "Månedsløn (selvraporteret)", colour = "Køn") + 
  scale_colour_discrete(labels = c("Kvinde", "Mand")) + 
  scale_y_continuous(limits = c(0, 100000), breaks = c(1:20 * 5000)) + 
  theme_classic() + 
  scale_colour_brewer(palette = "Dark2")


ggplot(data = ess18, aes(x = v4, fill = v8)) + 
  geom_bar(position = "dodge") + 
  ggthemes::theme_few() + 
  scale_y_continuous(limits = c(0,600), breaks = c(1:10 * 60)) +
  scale_fill_brewer(palette = "Blues", labels = c("Kvinde", "Mand")) + 
  ggthemes::theme_few()


## Factors
str(ess18)

class(ess18$v4)

ess18 <- ess18 %>%
  mutate(v4_fct = as.factor(v4))

class(ess18$v4_fct)
unique(ess18$v4_fct)

ess18 <- ess18 %>%
  mutate(v4_fct_r = parse_factor(v4, ordered = TRUE, levels = c("No", "Yes")))

unique(ess18$v4_fct_r)

ess18$v4_fct_r[2] > "No"

ggplot(data = ess18_filt, aes(x = v9, y = v14, colour = as.factor(v3))) + 
  geom_point()

## Append/merge
library(haven)
ess18_occu <- read_dta("./data/ESS2018DK_subset_occu-ethn.dta")
ess18_occu <- zap_labels(ess18_occu)
ess18_occu <- ess18_occu %>%
  rename(v1 = idno)

ess18_join <- left_join(ess18, ess18_occu, by = "v1")

ess18_fulljoin <- full_join(ess18, ess18_occu, by = "v1")
ess18_fulljoin2 <- full_join(ess18, ess18_fulljoin, by = "v1")

## Rekodning
ess18 <- ess18 %>%
  mutate(v4_da = recode(v4, "Yes" = "Ja", "No" = "Nej"))
unique(ess18$v4_da)

ess18 <- ess18 %>%
  mutate(v13_b = if_else(v13 > 37, ">37", "<=37"))

ess18 %>%
  group_by(v13_b) %>%
  summarize(count = n())

ess18 %>%
  count(v13_b)

ess18 <- ess18 %>%
  mutate(v13_cat = case_when(
    v13 %in% c(1:36) ~ "1 til 36",
    v13 == 37 ~ "37",
    v13 > 37 ~ "Over 37"
  ))

table(ess18$v13_cat)

lm_model <- lm(v2 ~ v9 + v4_fct, 
               data = ess18)
summary(lm_model)

lm_model <- lm(v2 ~ v9 + relevel(v4_fct, ref = "Not eligible to vote"), 
               data = ess18)
summary(lm_model)

lm_model <- lm(v2 ~ v9 + v4_fct_r, 
               data = ess18)
summary(lm_model)

library(stargazer)
lm_model <- lm(v2 ~ v9 + v8, data = ess18)

stargazer(lm_model, type = "html",
          title = "Gender and age effects on time spent on the internet",
          covariate.labels = c("Year born", "Sex = Male"),
          dep.var.caption = "Time spent on the internet", 
          out = "netust_lm.html")



