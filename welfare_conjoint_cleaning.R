# This code is to get the raw data from Qualtrics into something I can use for analysis.
# Uploading the data: Qualtrics had two lines of headers, so I'm keeping one and deleting the other
raw_dat_naming <- read.csv("welfare_conjoint_RAW.csv", head = TRUE)
raw_dat <- raw_dat_naming[-2,]
# I'm starting by getting rid of all the metadata variables I don't care about, then
# Renaming variables so they are more understandable (instead of, say, "Q12")
which(colnames(raw_dat)=="Q7")
which(colnames(raw_dat)=="Q12")
raw_dat_reduce <- raw_dat[-1,17:99] #I had an extra row so getting rid of that here too!
# This gets rid of things like MTurk validation codes, IP addresses, etc that I don't care about
# Question renaming. Will not be commenting much here. Each respondent looked at ten total profiles,
# so I'll try to organize on both the profile number AND the pair they belong to.
var_names = c("pref1or2","cand1eval","cand2eval","cand1age","cand1gender","cand1race","cand1educ","cand1employ","cand1house","cand2age","cand2gender","cand2race","cand2educ","cand2employ","cand2house","order12",
              "pref3or4","cand3eval","cand4eval","cand3age","cand3gender","cand3race","cand3educ","cand3employ","cand3house","cand4age","cand4gender","cand4race","cand4educ","cand4employ","cand4house","order34",
              "pref5or6","cand5eval","cand6eval","cand5age","cand5gender","cand5race","cand5educ","cand5employ","cand5house","cand6age","cand6gender","cand6race","cand6educ","cand6employ","cand6house","order56",
              "pref7or8","cand7eval","cand8eval","cand7age","cand7gender","cand7race","cand7educ","cand7employ","cand7house","cand8age","cand8gender","cand8race","cand8educ","cand8employ","cand8house","order78",
              "pref9or10","cand9eval","cand10eval","cand9age","cand9gender","cand9race","cand9educ","cand9employ","cand9house","cand10age","cand10gender","cand10race","cand10educ","cand10employ","cand10house","order910",
              "dem_age","dem_gender","dem_party")
length(var_names) # making sure it matches with the dataset
names(raw_dat_reduce) <- var_names
# It looks so much better already.
# Next step is to recode my variables. There's sort of a lot to do but it's trivial:
# 1. Cleaning my Likert scales (1 and 7 are strings currently) for ten variables
# 2. Recoding categorical data into ordinal variables. I do this for candidate age, education, and employment (from "most unemployed" to employed)

raw_dat_reduce$cand1eval <- ifelse(raw_dat_reduce$cand1eval == "1 - Absolutely Not Admit", 1, 
                                  ifelse(raw_dat_reduce$cand1eval == "7 - Definitely Admit", 7, 
                                  ifelse(raw_dat_reduce$cand1eval == "6", 6, 
                                  ifelse(raw_dat_reduce$cand1eval == "5", 5, 
                                  ifelse(raw_dat_reduce$cand1eval == "4", 4,
                                  ifelse(raw_dat_reduce$cand1eval == "3", 3,
                                  ifelse(raw_dat_reduce$cand1eval == "2", 2, 99)))))))
# Doing this for the other evaluation variables...
raw_dat_reduce$cand2eval <- ifelse(raw_dat_reduce$cand2eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand2eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand2eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand2eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand2eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand2eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand2eval == "2", 2, 99)))))))
raw_dat_reduce$cand3eval <- ifelse(raw_dat_reduce$cand3eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand3eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand3eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand3eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand3eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand3eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand3eval == "2", 2, 99)))))))
raw_dat_reduce$cand4eval <- ifelse(raw_dat_reduce$cand4eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand4eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand4eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand4eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand4eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand4eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand4eval == "2", 2, 99)))))))
raw_dat_reduce$cand5eval <- ifelse(raw_dat_reduce$cand5eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand5eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand5eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand5eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand5eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand5eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand5eval == "2", 2, 99)))))))
raw_dat_reduce$cand6eval <- ifelse(raw_dat_reduce$cand6eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand6eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand6eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand6eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand6eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand6eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand6eval == "2", 2, 99)))))))
raw_dat_reduce$cand7eval <- ifelse(raw_dat_reduce$cand7eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand7eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand7eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand7eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand7eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand7eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand7eval == "2", 2, 99)))))))
raw_dat_reduce$cand8eval <- ifelse(raw_dat_reduce$cand8eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand8eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand8eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand8eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand8eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand8eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand8eval == "2", 2, 99)))))))
raw_dat_reduce$cand9eval <- ifelse(raw_dat_reduce$cand9eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand9eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand9eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand9eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand9eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand9eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand9eval == "2", 2, 99)))))))
raw_dat_reduce$cand10eval <- ifelse(raw_dat_reduce$cand10eval == "1 - Absolutely Not Admit", 1, 
                                   ifelse(raw_dat_reduce$cand10eval == "7 - Definitely Admit", 7, 
                                          ifelse(raw_dat_reduce$cand10eval == "6", 6, 
                                                 ifelse(raw_dat_reduce$cand10eval == "5", 5, 
                                                        ifelse(raw_dat_reduce$cand10eval == "4", 4,
                                                               ifelse(raw_dat_reduce$cand10eval == "3", 3,
                                                                      ifelse(raw_dat_reduce$cand10eval == "2", 2, 99)))))))
# Now for age:
raw_dat_reduce$cand1age <- ifelse(raw_dat_reduce$cand1age == "18-19", 0,
                           ifelse(raw_dat_reduce$cand1age == "20-29", 1,
                           ifelse(raw_dat_reduce$cand1age == "30-39", 2,
                           ifelse(raw_dat_reduce$cand1age == "40+", 3, 99))))
raw_dat_reduce$cand2age <- ifelse(raw_dat_reduce$cand2age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand2age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand2age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand2age == "40+", 3, 99))))
raw_dat_reduce$cand3age <- ifelse(raw_dat_reduce$cand3age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand3age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand3age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand3age == "40+", 3, 99))))
raw_dat_reduce$cand4age <- ifelse(raw_dat_reduce$cand4age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand4age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand4age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand4age == "40+", 3, 99))))
raw_dat_reduce$cand5age <- ifelse(raw_dat_reduce$cand5age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand5age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand5age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand5age == "40+", 3, 99))))
raw_dat_reduce$cand6age <- ifelse(raw_dat_reduce$cand6age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand6age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand6age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand6age == "40+", 3, 99))))
raw_dat_reduce$cand7age <- ifelse(raw_dat_reduce$cand7age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand7age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand7age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand7age == "40+", 3, 99))))
raw_dat_reduce$cand8age <- ifelse(raw_dat_reduce$cand8age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand8age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand8age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand8age == "40+", 3, 99))))
raw_dat_reduce$cand9age <- ifelse(raw_dat_reduce$cand9age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand9age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand9age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand9age == "40+", 3, 99))))
raw_dat_reduce$cand10age <- ifelse(raw_dat_reduce$cand10age == "18-19", 0,
                                  ifelse(raw_dat_reduce$cand10age == "20-29", 1,
                                         ifelse(raw_dat_reduce$cand10age == "30-39", 2,
                                                ifelse(raw_dat_reduce$cand10age == "40+", 3, 99))))
# Now for education...
raw_dat_reduce$cand1educ <- ifelse(raw_dat_reduce$cand1educ == "High school graduate", 0,
                            ifelse(raw_dat_reduce$cand1educ == "Some college", 1,
                            ifelse(raw_dat_reduce$cand1educ == "College graduate", 2,
                            ifelse(raw_dat_reduce$cand1educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand2educ <- ifelse(raw_dat_reduce$cand2educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand2educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand2educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand2educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand3educ <- ifelse(raw_dat_reduce$cand3educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand3educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand3educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand3educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand4educ <- ifelse(raw_dat_reduce$cand4educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand4educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand4educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand4educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand5educ <- ifelse(raw_dat_reduce$cand5educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand5educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand5educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand5educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand6educ <- ifelse(raw_dat_reduce$cand6educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand6educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand6educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand6educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand7educ <- ifelse(raw_dat_reduce$cand7educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand7educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand7educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand7educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand8educ <- ifelse(raw_dat_reduce$cand8educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand8educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand8educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand8educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand9educ <- ifelse(raw_dat_reduce$cand9educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand9educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand9educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand9educ == "Graduate or professional degree", 3, 99))))
raw_dat_reduce$cand10educ <- ifelse(raw_dat_reduce$cand10educ == "High school graduate", 0,
                                   ifelse(raw_dat_reduce$cand10educ == "Some college", 1,
                                          ifelse(raw_dat_reduce$cand10educ == "College graduate", 2,
                                                 ifelse(raw_dat_reduce$cand10educ == "Graduate or professional degree", 3, 99))))

# I have 5 variables asking which of the two candidates/applicants the respondent prefers over the other.
# The problem is, they are listed as "Applicant X" so I will take the last character for each and make it a factor.

raw_dat_reduce$pref1or2 <- substring(raw_dat_reduce$pref1or2, 11, 11)
raw_dat_reduce$pref3or4 <- substring(raw_dat_reduce$pref3or4, 11, 11)
raw_dat_reduce$pref5or6 <- substring(raw_dat_reduce$pref5or6, 11, 11)
raw_dat_reduce$pref7or8 <- substring(raw_dat_reduce$pref7or8, 11, 11)
raw_dat_reduce$pref9or10 <- substring(raw_dat_reduce$pref9or10, 11, 11)

# Nice!
# My next step will be recoding the genders of both the candidates/applicants and the respondents. Scaling to 0 and 1 will be useful if I want to do linear regression at any point.
raw_dat_reduce$cand1gender <- ifelse(raw_dat_reduce$cand1gender == "Female", 0,
                              ifelse(raw_dat_reduce$cand1gender == "Male", 1, 99))
# And the rest of them, plus the respondent gender recoding:
raw_dat_reduce$cand2gender <- ifelse(raw_dat_reduce$cand2gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand2gender == "Male", 1, 99))
raw_dat_reduce$cand3gender <- ifelse(raw_dat_reduce$cand3gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand3gender == "Male", 1, 99))
raw_dat_reduce$cand4gender <- ifelse(raw_dat_reduce$cand4gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand4gender == "Male", 1, 99))
raw_dat_reduce$cand5gender <- ifelse(raw_dat_reduce$cand5gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand5gender == "Male", 1, 99))
raw_dat_reduce$cand6gender <- ifelse(raw_dat_reduce$cand6gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand6gender == "Male", 1, 99))
raw_dat_reduce$cand7gender <- ifelse(raw_dat_reduce$cand7gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand7gender == "Male", 1, 99))
raw_dat_reduce$cand8gender <- ifelse(raw_dat_reduce$cand8gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand8gender == "Male", 1, 99))
raw_dat_reduce$cand9gender <- ifelse(raw_dat_reduce$cand9gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand9gender == "Male", 1, 99))
raw_dat_reduce$cand10gender <- ifelse(raw_dat_reduce$cand10gender == "Female", 0,
                                     ifelse(raw_dat_reduce$cand10gender == "Male", 1, 99))
raw_dat_reduce$dem_gender <- ifelse(raw_dat_reduce$dem_gender == "Female", 0,
                                     ifelse(raw_dat_reduce$dem_gender == "Male", 1, 99))

# For now, the last one I will recode is employment status. This is because it codes quite nicely as an ordinal variable, going from "unemployed, not seeking employment" to "unemployed, seeking employment" to "employed".

raw_dat_reduce$cand1employ <- ifelse(raw_dat_reduce$cand1employ == "Unemployed - not seeking employment", 0,
                              ifelse(raw_dat_reduce$cand1employ == "Unemployed - seeking employment", 1,
                              ifelse(raw_dat_reduce$cand1employ == "Employed", 2, 99)))
raw_dat_reduce$cand2employ <- ifelse(raw_dat_reduce$cand2employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand2employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand2employ == "Employed", 2, 99)))
raw_dat_reduce$cand3employ <- ifelse(raw_dat_reduce$cand3employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand3employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand3employ == "Employed", 2, 99)))
raw_dat_reduce$cand4employ <- ifelse(raw_dat_reduce$cand4employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand4employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand4employ == "Employed", 2, 99)))
raw_dat_reduce$cand5employ <- ifelse(raw_dat_reduce$cand5employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand5employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand5employ == "Employed", 2, 99)))
raw_dat_reduce$cand6employ <- ifelse(raw_dat_reduce$cand6employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand6employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand6employ == "Employed", 2, 99)))
raw_dat_reduce$cand7employ <- ifelse(raw_dat_reduce$cand7employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand7employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand7employ == "Employed", 2, 99)))
raw_dat_reduce$cand8employ <- ifelse(raw_dat_reduce$cand8employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand8employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand8employ == "Employed", 2, 99)))
raw_dat_reduce$cand9employ <- ifelse(raw_dat_reduce$cand9employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand9employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand9employ == "Employed", 2, 99)))
raw_dat_reduce$cand10employ <- ifelse(raw_dat_reduce$cand10employ == "Unemployed - not seeking employment", 0,
                                     ifelse(raw_dat_reduce$cand10employ == "Unemployed - seeking employment", 1,
                                            ifelse(raw_dat_reduce$cand10employ == "Employed", 2, 99)))

# This is leaps and bounds cleaner to read than what I started with. Time to export it for now.
welfare_cleaned <- raw_dat_reduce
write.csv(welfare_cleaned, file = "cleaned_welfare_dataset.csv")
