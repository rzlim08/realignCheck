# Realign Check

Function that plots the realignment parameters and determines the max calculated movements. 

### How do I use this?
To print the plot, use the realignCheck function

## realignCheck

### Example
* realignCheck(true, niftifs, 'file', 3.5, 3.5)

### Input
* plot - boolean, if true plot rp files
* niftifs - niftifs object
* filename - name of the 'ps' file to be created
* threshold translation - threshold to flag for translation parameters in rp file
* threshold rotation - threshold to flag for rotation parameters in rp file 

### Output
* if plot, creates a 'ps' file with given filename 
* returns a struct 
