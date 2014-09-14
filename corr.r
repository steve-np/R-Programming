corr <- function(directory, threshold = 0) {
        monitorfilesfull <- list.files(directory, full.names = TRUE) ## The list of the .csv files
        allmonitordata <- data.frame() ## This will hold all the data read in from the .csv files
        for (i in 1:332) {
                allmonitordata <- rbind(allmonitordata, read.csv(monitorfilesfull[i], header = TRUE, sep = ","))
        }
        corrdata <- data.frame(stringsAsFactors = FALSE)
        allmonitordata <- allmonitordata[complete.cases(allmonitordata),]
        allmonitordata <- allmonitordata[, c(2,3,4)]
        gvect <- nrow(allmonitordata)
        ## for (j in 1:gvect) {
        ##       if (nrow(allmonitordata[j,]) > threshold) {
        ##                corrdata <- rbind(corrdata, data.frame(cor(allmonitordata)    
        ##        }
        ##}
        ##str(corrdata)
        
        
        
        
        ## completeids <- rbind(completeids, data.frame(id = idvect[k], nobs = cnt, stringsAsFactors = FALSE))
        ## allmonitordata <- allmonitordata[complete.cases(allmonitordata),]
        ## cr <- corr("specdata", 150)
        ## summary(cr)
}

## corr("specdata", 150)