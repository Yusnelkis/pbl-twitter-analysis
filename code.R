# Retrieve data from Twitter accounts of PBL
# PBL has two Twitter accounts:
#   - nlenvironagency
#   - Leefomgeving

# Shape up
library(rtweet)
key <- "AEfU7JtzIcL0wFT5fTFjYwX2p"
secret <- "RkzLkK3EBqPrdl5vpSg1YyH8pGZkKUnm8HPuHLU6xYkRsoVwAP"
twitter_token <- create_token(app = "rtweet-app", key, secret)

# Get data from PBL accounts:
pbl <- lookup_users(c("nlenvironagency", "Leefomgeving"))

# Get friends and followers

pbl.nl.fol <- get_followers("Leefomgeving", token = twitter_token)
pbl.en.fol <- get_followers("nlenvironagency", token = twitter_token) #720
pbl.nl.fri <- get_friends("Leefomgeving", token = twitter_token) #1888
pbl.en.fri <- get_friends("nlenvironagency", token = twitter_token)#430

# Add info
pbl.nl.fol <- lookup_users(pbl.nl.fol) #8596
pbl.en.fol <- lookup_users(pbl.en.fol) #701
pbl.nl.fri <- lookup_users(pbl.nl.fri) #1887
pbl.en.fri <- lookup_users(pbl.en.fri)#429

# Search for tweets linking to PBL
tw.pbl.recent <- search_tweets(q = "url:pbl.nl", n=18000, retryonratelimit = TRUE) #106 recent
tw.pbl.mixed <- search_tweets(q = "url:pbl.nl",type = "mixed", n=18000, 
                              retryonratelimit = TRUE) #107
tw.pbl.popular <- search_tweets(q = "url:pbl.nl",type = "popular", n=18000, 
                                retryonratelimit = TRUE) #2
tw.pbl <- data.frame()
tw.pbl <- rbind(tw.pbl.mixed, tw.pbl.popular, tw.pbl.recent)
library(dplyr)
tw.pbl <- unique(tw.pbl) # 105
rm(tw.pbl.mixed, tw.pbl.popular, tw.pbl.recent)
# Info from users tweeting about pbl.nl content
tw.pbl.users <- users_data(tw.pbl)

# SEARCH REPORTS
reps <- data.frame()

rep1.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/aanpassen-aan-klimaatverandering-kwetsbaarheden-zien-kansen-grijpen",
  n=18000, type = "mixed", retryonlimit = TRUE)
rep1.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/Aanpassen_aan_klimaatverandering_WEB_2.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep2.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/arbeidsmarkt-zonder-grenzen",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep2.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_CBS_2015_Arbeidsmarkt%20zonder%20grenzen_1759.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep3.w <- search_tweets(
  q = "http://themasites.pbl.nl/balansvandeleefomgeving/",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep3.p <- search_tweets(
  q = "http://themasites.pbl.nl/balansvandeleefomgeving/wp-content/uploads/pbl-2016-balans-van-de-leefomgeving-2016-1838.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep4.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/belastingverschuiving-meer-vergroening-en-minder-complexiteit",
  n=18000, retryonlimit = TRUE)

rep4.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-belastingverschuiving-meer-vergroening-en-minder-complexiteit_1737.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep5.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/dalende-bodems-stijgende-kosten",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep5.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-dalende-bodems-stijgende-kosten-1064.pdf",
  n=18000, retryonlimit = TRUE)

rep6.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/de-macht-van-het-menu",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep6.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2013_De_macht_van_het_menu_792.pdf",
  n=18000, retryonlimit = TRUE)

rep7.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/de-veerkrachtige-binnenstad",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep7.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2015_De%20veerkrachtige%20binnenstad_1667.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep8.w <- search_tweets(
  q = "http://www.pbl.nl/node/56816",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep8.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2013_Evaluation-of-policy-options-to-reform-the-EU-ETS_934.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep9.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/grondstof-voor-de-circulaire-economie",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep9.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-grondstof-voor-de-circulaire-economie-1790.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep10.w <- search_tweets(
  q = "https://sustainabledevelopment.un.org/index.php?page=view&type=400&nr=1981&menu=1515",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep10.p <- search_tweets(
  q = "https://sustainabledevelopment.un.org/content/documents/1981cbd-ts-79-en.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep11.w <- search_tweets(
  q = "http://www.pbl.nl/en/publications/implications-of-long-term-scenarios-for-medium-term-targets-2050",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep11.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2015-implications-for-long-term-scenarios-for-medium-term-targets-2050_01871.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep12.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/kansrijk-mobiliteitsbeleid",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep12.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL&CPB_2016_Kansrijk_Mobiliteitsbeleid_2337.PDF",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep13.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/kansrijk-woonbeleid",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep13.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL&CPB_2016_Kansrijk-woonbeleid_1837.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep14.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/kiezen-en-delen",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep14.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2014_Kiezen%20%C3%A9n%20delen_1358.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep15.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/kleine-kansen-grote-gevolgen",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep15.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2014_Kleine-kansen-grote-gevolgen_1031.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep16.w <- search_tweets(
  q = "http://www.pbl.nl/onderwerpen/klimaatverandering",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep17.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/koers-houden-in-de-delta",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep17.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-koers-houden-in-de-delta-2338.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep18.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/monitor-infrastructuur-en-ruimte-2016",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep18.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-monitor-infrastructuur-en-ruimte-2016-2110.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep19.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/nationale-energieverkenning-2015",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep19.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2015-nationale-energie-verkenning-2015_01712.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep20.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/nationale-energieverkenning-2016",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep20.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-nationale-energieverkenning-2016_2070.PDF",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep21.w <- search_tweets(
  q = "http://themasites.pbl.nl/natuurlijk-kapitaal-nederland/",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep21.p <- search_tweets(
  q = "http://themasites.pbl.nl/natuurlijk-kapitaal-nederland/wp-content/uploads/2014/PBL_2016_Natuurlijk-kapitaal_1455.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep22.w <- search_tweets(
  q = "http://themasites.pbl.nl/natuurverkenning/",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep22.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL-2012-Natuurverkenning-2010-2040-50041400.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep23.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/nederland-in-2030-2050-twee-referentiescenario%E2%80%99s-toekomstverkenning-welvaart-en-leefomgeving",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep24.w <- search_tweets(
  q = "http://www.pbl.nl/en/publications/nitrogen-on-the-table-the-influence-of-food-choices-on-nitrogen-emissions-and-the-european-environment",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep24.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/Nitrogen_on_the_Table_Report_WEB.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep25.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/opties-voor-energie-en-klimaatbeleid",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep25.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-opties-voor-energie-en-klimaatbeleid_2393.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep26.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/de-economie-van-de-stad",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep26.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2015_De%20economie%20van%20de%20stad_1723.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep27.w <- search_tweets(
  q = "http://www.pbl.nl/nieuws/nieuwsberichten/2015/de-stad-magneet-roltrap-en-spons",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep27.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2015_De%20stad_magneet,%20roltrap%20en%20spons_1610.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep28.w <- search_tweets(
  q = "https://europa.eu/capacity4dev/unep/document/unep-irp-report-food-systems-and-natural-resources",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep28.p <- search_tweets(
  q = "https://europa.eu/capacity4dev/file/30169/download?token=vMOMVDgR",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep30.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/transformatiepotentie-woningbouwmogelijkheden-in-de-bestaande-stad",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep30.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2017-transformatiepotentie-woningbouwmogelijkheden%20in%20de%20bestaande%20stad-2420.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep31.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/vergrijzing-en-ruimte",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep31.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL_2013_Vergrijzing%20en%20ruimte_450.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep32.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/vergroenen-en-verdienen",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep32.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/PBL-2013-Vergroenen-en-verdienen-1061.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep33.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/wat-betekent-het-parijsakkoord-voor-het-nederlands-langetermijnklimaatbeleid",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep33.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/pbl-2016-wat-betekent-het-parijsakkoord-voor-het-nederlandse-langetermijn-klimaatbeleid-2580.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)


rep34.w <- search_tweets(
  q = "http://www.pbl.nl/publicaties/waterkwaliteit-nu-en-in-de-toekomst",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep34.p <- search_tweets(
  q = "http://www.pbl.nl/sites/default/files/cms/publicaties/Waterkwaliteit%20Beleidsstudie_4e_proef.pdf",
  n=18000, type = "mixed", retryonlimit = TRUE)

rep1 <- rbind(rep1.w, rep1.p)
rep1$rep_id <- "rep1"
rep2 <- rbind(rep2.w, rep2.p)
rep2$rep_id <- "rep2"
rep3 <- rbind(rep3.w, rep3.p)
rep3$rep_id <- "rep3"
rep4 <- rbind(rep4.w, rep4.p)
rep4$rep_id <- "rep4"
rep5 <- rbind(rep5.w, rep5.p)
rep5$rep_id <- "rep5"
rep6 <- rbind(rep6.w, rep6.p)
rep6$rep_id <- "rep6"
rep7 <- rbind(rep7.w, rep7.p)
rep7$rep_id <- "rep7"
rep8 <- rbind(rep8.w, rep8.p)
rep8$rep_id <- "rep8"
rep9 <- rbind(rep9.w, rep9.p)
rep9$rep_id <- "rep9"
rep10 <- rbind(rep10.w, rep10.p)
rep10$rep_id <- "rep10"
rep11 <- rbind(rep11.w, rep11.p)
rep11$rep_id <- "rep11"
rep12 <- rbind(rep12.w, rep12.p)
rep12$rep_id <- "rep12"
rep13 <- rbind(rep13.w, rep13.p)
rep13$rep_id <- "rep13"
rep14 <- rbind(rep14.w, rep14.p)
rep14$rep_id <- "rep14"
rep15 <- rbind(rep15.w, rep15.p)
rep15$rep_id <- "rep15"
rep16$rep_id <- "rep16"
rep17 <- rbind(rep17.w, rep17.p)
rep17$rep_id <- "rep17"
rep18 <- rbind(rep18.w, rep18.p)
rep18$rep_id <- "rep18"
rep19 <- rbind(rep19.w, rep19.p)
rep19$rep_id <- "rep19"
rep20 <- rbind(rep20.w, rep20.p)
rep20$rep_id <- "rep20"
rep21 <- rbind(rep21.w, rep21.p)
rep21$rep_id <- "rep21"
rep22 <- rbind(rep22.w, rep22.p)
rep22$rep_id <- "rep22"
rep23$rep_id <- "rep23"
rep24 <- rbind(rep24.w, rep24.p)
rep24$rep_id <- "rep24"
rep25 <- rbind(rep25.w, rep25.p)
rep25$rep_id <- "rep25"
rep26 <- rbind(rep26.w, rep26.p)
rep26$rep_id <- "rep26"
rep27 <- rbind(rep27.w, rep27.p)
rep27$rep_id <- "rep27"
rep28 <- rbind(rep28.w, rep28.p)
rep28$rep_id <- "rep28"
rep30 <- rbind(rep30.w, rep30.p)
rep30$rep_id <- "rep30"
rep31 <- rbind(rep31.w, rep31.p)
rep31$rep_id <- "rep31"
rep32 <- rbind(rep32.w, rep32.p)
rep32$rep_id <- "rep32"
rep33 <- rbind(rep33.w, rep33.p)
rep33$rep_id <- "rep33"
rep34 <- rbind(rep34.w, rep34.p)
rep34$rep_id <- "rep34"

reps <- rbind(rep1, rep2, rep3, rep4, rep5, rep6, rep7, rep8, rep9, rep10, 
              rep11, rep12, rep13, rep14, rep15, rep16, rep17, rep18, rep19, rep20, 
              rep21, rep22, rep23, rep24, rep25, rep26, rep27, rep28, rep30, 
              rep31, rep32, rep33, rep34)
