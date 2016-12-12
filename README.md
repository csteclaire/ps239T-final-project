# ps239T-final-project

## Introduction

This is my final project repo for PS239T, a computational tools course taught out of the political science department at UC - Berkeley. My project focuses on a potential research project of mine that aims to use a full-profile conjoint to be able to parse out potentially hidden or underlying attitudes on welfare and welfare recipients. The final project for this course is a pilot of this conjoint to troubleshoot and to get *some* substantive data to play around with.

A majority of my time on this final project was spent in Qualtrics, creating a survey that was later put up as a HIT on MTurk. My Qualtrics survey is fairly heavily coded using JavaScript (and some HTML) to randomize both the order of my profile dimensions, the profile attributes themselves, and to ensure that these randomizations could be saved and exported for my later analysis. This required me to bootcamp JavaScript and HTML quickly for the sake of the project.

I later spent some time cleaning the data. Mostly, this entailed recoding values that Qualtrics recorded as characters and turning them into ordinal variables. I had to split some strings up and remove some unnecessary variables, too. My "final" product in the context of the class is a cleaned dataset, ready to frustrate me as I try to figure the analysis out over winter break!

## Dependencies

1. RStudio, 0.99.903
  (Using R, 3.3.2)

## Files
1. welfare_conjoint_steclaire.qsf This is an exported copy of the survey I ran in Qualtrics through MTurk. It has a majority of what I did, including the JavaScript and the HTML used to carry out the purpose of the survey.

2. qualtricscode.md In case you don't feel like dragging along through a Qualtrics survey, the meat and potatoes of the JavaScript/HTML code are pasted here with some tips/comments.

#### Data
1. welfare_conjoint_RAW.csv The original raw dataset that I exported from Qualtrics upon the survey completion.

2. cleaned_welfare_dataset.csv The final product here. A cleaned up dataset that will hopefully help me navigate through complicated conjoint analysis much easier.

#### Code
1. welfare_conjoint_cleaning.R This is the R script I used to clean my data. I put in my raw dataset and exported the cleaned one. I commented as much as I could, but since a lot of recoding and reassinging values was done to multiple variables I sort of circumvented the "comment every 3 lines" rule (sorry if this is heavily enforced!). It's trivial enough that I don't think there can be any confusion.


## Conclusion/Contact Information/Acknowledgements

For technical guidance, my thanks to Rachel Bernhard and Kyle Dropp. A large inspiration for this project is an article by Hainmueller and Hopkins (2014). Huge thanks to Rachel Bernhard for making a computational tools class enjoyable and as free of stress as possible for a computational tools class.

If you stumble upon this repository and have any questions/comments/suggestions etc please contact me at csteclaire@berkeley.edu. I already have some future updating and directions for this research from classmates and can always use extra input. Thanks!
