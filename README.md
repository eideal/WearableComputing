### The Code
The `run_analysis.R` file downloads Samsung Galaxy S smartphone accelerometer datasets, ultimately producing a clean dataset called `Tidy.txt`.

### Running the Code
```S
source("run_analysis.R")
```
This `run_analysis.R` code will create a `/data/` directory, if it doesn't already exist, in which the accelerometer data will be downloaded and unzipped.

The smartphone accelerometer data is obtained as a zip file from:
```S
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```
The code will write a file called `Tidy.txt`, which is a clean dataset, containing average measurements for 66 variables, parameterized by the subject (there are 30 subjects) and the activity they are performing (there are 6 possible activities). Please see the `CodeBook.md` for more information on the variables and the procedure for obtaining the tidy dataset.



