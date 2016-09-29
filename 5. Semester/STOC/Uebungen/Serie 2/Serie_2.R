# Serie 2

# (2.1a)
head(geysir)
summary(geysir)
dim(geysir)
colnames(geysir)
nrow(geysir)
geysir[,"Zeitspanne"]
geysir[,2]

par(mfrow = c(2,2))
hist(geysir[,"Zeitspanne"])
hist(geysir[,"Zeitspanne"], breaks = 20)
hist(geysir[,"Zeitspanne"], breaks = seq(41, 96, by = 11)) # Gruppen sind 11 gross also 41-52...
1+3.3*log10(nrow(geysir))

# (2.1b)

hist(geysir[, "Eruptionsdauer"])

plot(geysir[,"Zeitspanne"],geysir[,"Eruptionsdauer"])
identify(geysir[,"Zeitspanne"],geysir[,"Eruptionsdauer"])
cor(geysir[,"Zeitspanne"],geysir[,"Eruptionsdauer"])

hist(geysir[,"Eruptionsdauer"],freq=FALSE)

# (2.1c)

eruptionsdauern <- geysir[,"Eruptionsdauer"]
n <- length(eruptionsdauern)
plot(sort(eruptionsdauern), (1:n)/n, type = "s", ylim = c(0,1),
     ylab = "Kumulative Verteilungsfunktion",
     xlab = "Der Groesse nach geordnete Eruptionszeiten (in Minuten)",
     main="")


# Aufgabe 2.5
# a)

head(hubble)
plot(hubble[,"distance"], hubble[,"recession.velocity"])

# b)

distance <- hubble[,"distance"]
recession.velocity <- hubble[,"recession.velocity"]
lm(distance ~ recession.velocity)
reg <- lm(distance ~ recession.velocity)
