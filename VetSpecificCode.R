# read in datasets
mcesdat = read.csv("mces_data20231122.csv")
destdat = read.csv("destination_data20231122.csv")
surveydat = read.csv("survey_data20231122.csv")
solutionfunddat = read.csv("solutions_fund20231122.csv")

summary(destdat)
unique(destdat$Pregnant)
unique(destdat$Entry.Exit.Destination)
unique(destdat$Gender)


# Distribution of Days to Exit for Veterans
## helps us to understand how long veterans stay in the houselessness system before exiting. 
hist(destdat$Days.to.Exit.Destination[destdat$Veteran == "Yes (HUD)" & destdat$Days.to.Exit.Destination <= 1000],
     main = "Majority of Veterans Experience Homelessness between 121 and 356 days",
     sub = "Distribution of Days Homelessness Experienced (up to 1000)",
     xlab = "Days to Exit",
     col = "maroon",
     border = "orange")

hist(destdat$Days.to.Exit.Destination[destdat$Veteran == "Yes (HUD)" & destdat$Days.to.Exit.Destination >= 1000],
     main = "Five Veterans Experienced more than 1000 days of Homelessness",
     sub = "Distribution of Days Homelessness Experienced (Greater than 1000)",
     xlab = "Days to Exit",
     col = "maroon",
     border = "orange")

summary(destdat$Days.to.Exit.Destination[destdat$Veteran == "Yes (HUD)"])

## Destination Exit Data
veterandestcounts = table(destdat$Entry.Exit.Destination[destdat$Veteran == "Yes (HUD)"])
orderedcounts = veterandestcounts[order(veterandestcounts)]

destmapping <- c(
  "No exit interview completed (HUD)" = "No Exit Interview",
  "Rental by client, no ongoing housing subsidy (HUD)" = "Rental, No Subsidy",
  "Rental by client, with ongoing housing subsidy (HUD)" = "Rental, With Subsidy", 
  "Staying or living with family, permanent tenure (HUD)" = "Family, Permanent",
  "Staying or living with family, temporary tenure (e.g., room, apartment, or house) (HUD)" = "Family, Temporary",
  "Substance abuse treatment facility or detox center (HUD)" = "Substance Abuse Facility",
  "Staying or living with friends, temporary tenure (e.g., room, apartment, or house) (HUD)" = "Friends, Temporary",
  "Jail, prison, or juvenile detention facility (HUD)" = "Jail, Prison, Juvenile Facility",
  "Staying or living with friends, permanent tenure (HUD)" = "Friends, Permanent",
  "Transitional housing for homeless persons (including homeless youth) (HUD)" = "Transitional House, Including Youth",
  "Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside) (HUD)" = "Not Meant for Habitation",
  "Residential project or halfway house with no homeless criteria (HUD)" = "Residential Project / Halfway House",
  "Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter (HUD)" = "Emergency Shelter",
  "Psychiatric hospital or other psychiatric facility (HUD)" = "Psychiatric Facility",
  "Deceased (HUD)" = "Deceased",
  "Long-term care facility or nursing home (HUD)" = "Nursing Home / Long Term Care",
  "Hospital or other residential non-psychiatric medical facility (HUD)" = "Hospital",
  "Other (HUD)" = "Other",
  "Client prefers not to answer (HUD)" = "Prefered Not to Answer",
  "Moved from one HOPWA funded project to HOPWA PH (HUD)" = "HOPWA to HOPWA PH",
  "Hotel or motel paid for without emergency shelter voucher (HUD)" = "Hotel without Emergency Voucher",
  "Foster care home or foster care group home (HUD)" = "Foster Care / Group Home",
  "Owned by client, no ongoing housing subsidy (HUD)" = "Owned Home, no Subsidy",
  "Host Home (non-crisis) (HUD)" = "Host Home",
  "Owned by client, with ongoing housing subsidy (HUD)" = "Owned Home, with Subsidy"
)

destdat$ShortEntryExitDestination = destmapping[destdat$Entry.Exit.Destination]
uniqueshortdestinations = unique(destdat$ShortEntryExitDestination)
shortdestcounts = table(destdat$ShortEntryExitDestination)
neworderedcounts = shortdestcounts[order(shortdestcounts)]

par(mar = c(5, 9, 5, 9) + 0.1)
barplot(neworderedcounts,
        names.arg = names(neworderedcounts),
        main = "Veterans Renting without Assistance Leading Cause to End Homelessness",
        sub = "Veteran Entry Exit Destinations by Greatest to Least",
        xlab = "Number of Veterans",
        ylab = "",
        col = "maroon",
        horiz = TRUE,
        las = 1,
        cex.names = 0.5,
        xlim = c(0, 250))
mtext("Entry Exit Destination", side = 2, line = 1, at = 31, las = 1, cex = 0.7)

## Gender Data
gentabledat = table(destdat$Gender[destdat$Veteran == "Yes (HUD)"])

# Create a barplot
barplot(gentabledat, 
        col = "maroon", 
        main = "Veterans by Gender",
        xlab = "Gender", 
        ylab = "Count", 
        ylim = c(0,200))
text(rep(seq_along(table_data), each = 1), table_data + 5, labels = table_data, pos = 3, col = "black", cex = 0.8)

