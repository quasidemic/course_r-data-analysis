library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

ess18 <- read_csv("./data/ESS2018DK_subset.csv")

head(ess18)

colnames(ess18)

rownames(ess18)

dim(ess18)
nrow(ess18)
ncol(ess18)

str(ess18)

summary(ess18)
summary(ess18$yrbrn)

min(ess18$yrbrn)
max(ess18$yrbrn)
mean(ess18$yrbrn)
sd(ess18$yrbrn)

unique(ess18$ppltrst)

summary(ess18$inwtm)

mean(ess18$inwtm, na.rm = TRUE)


ess18_males <- filter(ess18, gndr == 'Male')
ess18_males_sub <- select(ess18_males, idno, gndr, yrbrn, edlvddk)

ess18_males_sub <- ess18 %>%
  filter(gndr == 'Male') %>%
  select(idno, gndr, yrbrn, edlvddk)

head(arrange(ess18_males_sub, desc(yrbrn), idno))


# Create a subset of the data containing females born after 1980 with the variables: idno, gndr, yrbrn, netustm

ess18_females <- ess18 %>%
  filter(gndr == "Female", 
         yrbrn > 1980) %>%
  select(idno, gndr, yrbrn, netustm)

ess18_males <- ess18 %>%
  filter(gndr == "Male", 
         yrbrn > 1980) %>%
  select(idno, gndr, yrbrn, netustm)

mean(ess18_females$netustm, na.rm = TRUE)
mean(ess18_males$netustm, na.rm = TRUE)

table(ess18_females$yrbrn)

ess18 %>%
  group_by(gndr) %>%
  summarise(
            mean_net = mean(netustm, na.rm = TRUE),
            size = n()
    )

ess18 %>%
  group_by(yrbrn) %>%
  summarize(size = n())


ess18$inwth <- ess18$inwtm / 60
head(select(ess18, inwth, inwtm))

ess18 <- mutate(ess18, inwth = inwtm / 60)

ess18 <- ess18 %>%
  mutate(inwth = inwtm / 60,
         tygrtr_num = as.numeric(tygrtr))

mean(ess18$tygrtr_num, na.rm = TRUE)

ess18_nona <- drop_na(ess18)

say_hi <- function(){
  print("Hi!")
}

mean_nona <- function(x){
  mean(x, na.rm = TRUE)
}


ggplot(data = filter(ess18, grspnum < 100000), mapping = aes(x = yrbrn, y = grspnum)) +
  geom_point(colour = "blue") +
  geom_smooth(colour = "lightgreen", method = "lm") + 
  theme_minimal()
