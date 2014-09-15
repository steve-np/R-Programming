complete <- function(directory, id = 1:332) {
        idee <- id ## idee now has the list of ids we want to check
        id <- vector() ## id is now local and blank for sure
        len <- length(idee)
        monitorfilesfull <- list.files(directory, full.names = TRUE) ## The list of the .csv files
        allmonitordata <- data.frame() ## This will hold all the data read in from the .csv files
        for (i in 1:332) {
                allmonitordata <- rbind(allmonitordata, read.csv(monitorfilesfull[i], header = TRUE, sep = ","))
        }
        allmonitordata <- allmonitordata[complete.cases(allmonitordata),] ## Save the complete case rows, only
        monitorsubset <- data.frame(stringsAsFactors = FALSE)
        for (j in 1:len) {
                monitorsubset <- rbind(monitorsubset, allmonitordata[which(allmonitordata$ID == idee[j]), ])
        }
        gvect <- nrow(monitorsubset) ## this gives us the number of ids we need to run through the next loop
        completeids <- data.frame(id = (integer(gvect)), nobs = integer(gvect), stringsAsFactors = FALSE)
        idvect <- monitorsubset$ID
        if (length(idvect) == 0) {
                idvect <- idee
                gvect <- 1
        }
        cnt = integer(1)
        cnt = 1
        for (k in 1:gvect) {
                m <- k + 1
                if (identical(k,gvect)) {
                        id <- idvect[k]
                        nobs <- cnt
                        completeids <- rbind(completeids, data.frame(id, nobs, stringsAsFactors = FALSE))
                        cnt <- 1
                } else if (identical(idvect[m], idvect[k])) { 
                        cnt <- cnt + 1
                } else {
                        id <- idvect[k]
                        nobs <- cnt
                        completeids <- rbind(completeids, data.frame(id, nobs, stringsAsFactors = FALSE))
                        cnt <- 1
                }
        }
        completeids <- completeids[which(completeids$id > 0 & completeids$nobs > 0), ]
        ## completeids[ !(completeids$id | completeids$nobs) %in% c(0,0), ]
        completeids
}
## complete("specdata", c(2, 4, 8, 10, 12))