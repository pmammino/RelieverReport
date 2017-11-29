---
output: html_document
---
# About The Site

## Glossary

* **gmLI** - Average leverage index when brought into the game for an individual pitcher (From Fangraphs)

* **LI** - gmLI adjusted for league average among all relievers for a given season. A value above 1 means the player was in higher than average leverage situations while below 1 means less than average.

* **CON1** - Principal component that combines GB/FB and ISO allowed. It is a scaled and center measure that is based off the sample of "high leverage" relievers. The larger the number the higher the ISO allowed and the lower the GB/FB rate. For reliever purposes the lower the better.

* **ADREIP** - RE24 per inning pitched adjusted for the average leverage. The formula is:
$(RE24 * LI)/ IP$
For the "high leverage" reliever sample; the average is 0.18.

* **xADREIP** - Expected ADREIP based off a regression equation that uses Swinging Strike Rate, BB/9, and CON1. This value is an approximation of how a given pitcher would perform if used in a "high leverage" role (Uses 2012-2016 Data).

* **"High Leverage"** - Any time the words "high leverage" are used together in this type of analysis it means that over the course of a full season a given pitcher threw more than 40 innings with an adjusted gmLI over 1.2. This means that he pitched in situations where the leverage was a minimum of 20% greater than the average for that season.

***

All data courtesy of Fangraphs. Questions/suggestions/concerns can be addressed to relieverreport@gmail.com.

You can read my articles explaining and utilizing the analysis [here](https://robaseball.com/@pmammino).