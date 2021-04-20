# Getting your data into R
Elliot Gould  
17/01/2017  




# Storing data and adding it to your project

*Rectangular, text-files*

We will focus on how to read plain-text rectangular files into R. Non-proprietry formats, such as plain-text files are best used for recording and storing field or other data because they can be used by anyone, without need of special software to view or edit them (British Ecological Society, 2014). Common file extensions include `.txt` or `.CSV` files. CSV stands for Comma Separated Value files. These are simply plain-text files with each line representing a row in the tabular data, and each value being separated by a comma.

One added benefit of using text-files to store data, is that we can put them under version control. Let's do this now.

*Challenge 4: add some new data to a project directory (1-minute)*

> 1. If you didn't already in module 1, go to the [workshop repository data folder](https://github.com/egouldo/VicBioCon17_data_wrangling/tree/master/data) and download the csv files called `bat_dat.csv` and `iris.csv`
> 2. Save them to your data folder
> 3. Commit the files in git and push to GitHub

*A note on creating CSV Files with your own data*

You can transcribe data you have collected into a CSV file using Microsoft Excel or in open-source CSV editors, such as [comma chameleon ](http://comma-chameleon.io). Existing Microsoft Excel spreadsheets can also be converted into `CSV` files. See the [tidy data module](./06_tidy_data.Rmd) for tips on how best to format and structure your data. 

# Importing your data into R

The [`readr` package](http://r4ds.had.co.nz/data-import.html) comes with a selection of tools for importing data into R, turning flat files into R dataframes. For importing other non-CSV flat-file types, check the readr package documentation. The function `readr::read_csv()` reads in CSV files. For those familiar with R, the `read_csv()` function is very similar to base Rs `read.csv()`. Here are some reasons to use `readr` to import your flat-files:

- `readr` functions are about 10x faster than their base equivalents, and you can set a progress bar for importing larger files.
- `readr` functions produce tibbles (more on this below!), and are more careful in how files are imported: character vectors will not be coerced to factors, row names are not used, and column names will not be muddled.
- They are more reproducible: Behaviour of base R functions can be determined by both your operating system and environment variables, so sometimes code that imports data successfully on your computer will not work on someone else's computer.

Lets import the bat data into R using `read_csv()`


```r
readr::read_csv("./data/bat_dat.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_integer(),
##   Site = col_character(),
##   Size = col_double(),
##   SQQ = col_double(),
##   `Water Depth` = col_double(),
##   `Imp 5km` = col_double(),
##   Imp2km = col_double(),
##   Imp1km = col_double(),
##   Imp500m = col_double(),
##   NDVI2km = col_double(),
##   NDVI1km = col_double(),
##   NDVI500m = col_double(),
##   House500 = col_double(),
##   House1km = col_double(),
##   House2km = col_double(),
##   House5km = col_double(),
##   Light500m = col_double(),
##   Light1km = col_double(),
##   Light2km = col_double(),
##   Light5km = col_double(),
##   Road500m = col_double()
##   # ... with 13 more columns
## )
```

```
## See spec(...) for full column specifications.
```

```
## # A tibble: 188 × 83
##           Site Habitat Season Chgouldii Chmorio `CG/Mormlp` MormII
##          <chr>   <int>  <int>     <int>   <int>       <int>  <int>
## 1  Albert Park       1      1       151       0           6      0
## 2  Albert Park       1      2        38       2           1      0
## 3        Amber       1      1         3      10           0      0
## 4        Amber       1      2         6       9           1      0
## 5        Avoca       1      1         0       0           0      0
## 6        Avoca       1      2        13      72           1      0
## 7        Banjo       1      1        52       3           0      0
## 8        Banjo       1      2        17       0           1      0
## 9    Blackburn       1      1       117       1           7      1
## 10   Blackburn       1      2         0       1           0      0
## # ... with 178 more rows, and 76 more variables: Mschocean <int>,
## #   Nyctspp <int>, Mmacropus <int>, `Nspp/Mmacr` <int>, Scotspp. <int>,
## #   Taustralis <int>, Vdarlingtoni <int>, Vregulus <int>,
## #   Vvulturnus <int>, Unidentified <int>, BatSpecies <int>,
## #   BatActivity <int>, Col <int>, Dip <int>, Eph <int>, Hem <int>,
## #   Lep <int>, Hym <int>, Tri <int>, Manto <int>, Psoc <int>, Orth <int>,
## #   Neur <int>, Derm <int>, Bla <int>, Iso <int>, Odo <int>, Plec <int>,
## #   Insectabundance <int>, TotalOrder <int>, Moon <int>, NatEx <int>,
## #   Bioregion <int>, Size <dbl>, SQQ <dbl>, `Water Depth` <dbl>, `Imp
## #   5km` <dbl>, Imp2km <dbl>, Imp1km <dbl>, Imp500m <dbl>, NDVI2km <dbl>,
## #   NDVI1km <dbl>, NDVI500m <dbl>, `Trees 5km` <int>, Trees2km <int>,
## #   Trees1km <int>, Trees500m <int>, House500 <dbl>, House1km <dbl>,
## #   House2km <dbl>, House5km <dbl>, Light500m <dbl>, Light1km <dbl>,
## #   Light2km <dbl>, Light5km <dbl>, Road500m <dbl>, Road1km <dbl>,
## #   Road2km <dbl>, Road5km <dbl>, Distriver <dbl>, Distwetland <dbl>,
## #   Distwater <dbl>, Distbushland <dbl>, Aqvegcov <dbl>, EphemVeg <dbl>,
## #   TreeCoverage <dbl>, `TreesLarge>20dbh.plot` <int>,
## #   `TreesSmall<20dbh.plot` <int>, `Trees total.plot` <int>,
## #   Shrubs.plot <int>, Hollows.total <int>, Otherroostsnumber.total <int>,
## #   TotalRoost <int>, Distance1sttree <dbl>, Temp <dbl>, Humidity <dbl>
```

Notice that `readr` prints out the column specification, giving the name and type of each column. This is important for ensuring that the values in a particular column have been read as the right data type. You can manually change the data type if it is read in as the wrong type (see parsing data, below).

## Tweaking `read_csv()`

You can control many different aspects of data import using the many arguments of `read_csv()`.

```r
args(read_csv)
```

```
## function (file, col_names = TRUE, col_types = NULL, locale = default_locale(), 
##     na = c("", "NA"), quoted_na = TRUE, comment = "", trim_ws = TRUE, 
##     skip = 0, n_max = Inf, guess_max = min(1000, n_max), progress = interactive()) 
## NULL
```

Often we deal in data collected and given to us by other people, perhaps a consultant or research assistant collected your data. This removes a lot of control over the way the data is formatted. Sometimes people do funny things, like use strange character strings to represent missing values (pro-tip: `NA` is good). If our data comes from a machine in the lab, like a PCR machine log, it might provide metadata or other details about the nature of the collected data. Below are some examples for dealing with these situations.

### Skipping the first line

`read_csv()` uses the first line of data as the data frame's column names. Sometimes you might have metadata in the first few lines, perhaps as a YAML header or as commented lines (using `#`), other times you might be missing column names in your CSV file. 

*1. Skipping metadata or comments with the `skip` argument*

Skipping Comments:


```r
readr::read_csv("./data/iris.csv", comment = "#")
```

```
## Parsed with column specification:
## cols(
##   Sepal.Length = col_double(),
##   Sepal.Width = col_double(),
##   Petal.Length = col_double(),
##   Petal.Width = col_double(),
##   Species = col_character()
## )
```

```
## # A tibble: 150 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl>   <chr>
## 1           5.1         3.5          1.4         0.2  setosa
## 2           4.9         3.0          1.4         0.2  setosa
## 3           4.7         3.2          1.3         0.2  setosa
## 4           4.6         3.1          1.5         0.2  setosa
## 5           5.0         3.6          1.4         0.2  setosa
## 6           5.4         3.9          1.7         0.4  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           5.0         3.4          1.5         0.2  setosa
## 9           4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
## # ... with 140 more rows
```

Skipping a specified number of lines:


```r
readr::read_csv("./data/iris.csv", skip = 18)
```

```
## Parsed with column specification:
## cols(
##   Sepal.Length = col_double(),
##   Sepal.Width = col_double(),
##   Petal.Length = col_double(),
##   Petal.Width = col_double(),
##   Species = col_character()
## )
```

```
## # A tibble: 150 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl>   <chr>
## 1           5.1         3.5          1.4         0.2  setosa
## 2           4.9         3.0          1.4         0.2  setosa
## 3           4.7         3.2          1.3         0.2  setosa
## 4           4.6         3.1          1.5         0.2  setosa
## 5           5.0         3.6          1.4         0.2  setosa
## 6           5.4         3.9          1.7         0.4  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           5.0         3.4          1.5         0.2  setosa
## 9           4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
## # ... with 140 more rows
```

*2. Missing Column Names*

Simply set the `col_names` argument to FALSE


```r
read_csv("A,2,30\nB,5,60", col_names = FALSE) # '\n' tells read_csv to move onto a new line!
```

```
## # A tibble: 2 × 3
##      X1    X2    X3
##   <chr> <int> <int>
## 1     A     2    30
## 2     B     5    60
```

Or pass a character vector to `col_names`:

```r
read_csv("A,2,30\nB,5,60", 
         col_names = c("site", "native_grass_species", "total_percent_cover")) # c() or concatenate creates a vector
```

```
## # A tibble: 2 × 3
##    site native_grass_species total_percent_cover
##   <chr>                <int>               <int>
## 1     A                    2                  30
## 2     B                    5                  60
```

### Specifying Missing Values with characters other than NA


```r
read_csv("site,native_reptile_species, mean_weight_g\nA,5,50\nB,0,.",
         na = ".")
```

```
## # A tibble: 2 × 3
##    site native_reptile_species mean_weight_g
##   <chr>                  <int>         <int>
## 1     A                      5            50
## 2     B                      0            NA
```

*Challenge 5: load data into R (1-minute)*

> 1. Return to the script  `01_tidy_data.R` and edit it to import data into your R workspace using readr. Don't forget to assign it to an informatively named object.
> 2. Source the script to load the data into R's workspace.
> 3. Commit to git, push to GitHub.



## Parsing column type specification

`readr` will automatically detect the type of values for each column (take a look back at the output from when we read in the bat and iris datasets). However, sometimes we would like to override the default options and provide more specialised types of data. For example, sometimes we might want R to treat a column as a logical or a date rather than as an integer or character vector. 

If any unexpected values occur that dont match your specification, `readr` will tell you which row, column, and what the exact problem is for that value. This is a really good way of ensuring that there are no erroneous values within your dataset, perhaps introduced by transcription error.

Because readr inspects only the first 1000 rows to guess the data type, it is not always perfect. This is another reason to manually supply column types during import. It is good practice to supply column types upon import, that way you can ensure that your import code is consistent and reproducible. 

However, sometimes it might be unreasonable to supply column types, for example when you have species names as the values or observations in a column. In that instance it is worth modifying the variable after import, we'll get to that in [the dplyr module using `mutate()`](./05_dplyr-walkthrough.Rmd).

*We can specify column types using the `col_types` argument*

Here's an example using the `iris.csv` dataset:


```r
read_csv("./data/iris.csv", comment = "#", 
         col_types = cols(
                 Sepal.Length = col_double(),
                 Sepal.Width = col_double(),
                 Petal.Length = col_double(),
                 Petal.Width = col_double(),
                 Species = col_factor(c("setosa", "versicolor", "virginica"))
         ))
```

```
## # A tibble: 150 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
## 1           5.1         3.5          1.4         0.2  setosa
## 2           4.9         3.0          1.4         0.2  setosa
## 3           4.7         3.2          1.3         0.2  setosa
## 4           4.6         3.1          1.5         0.2  setosa
## 5           5.0         3.6          1.4         0.2  setosa
## 6           5.4         3.9          1.7         0.4  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           5.0         3.4          1.5         0.2  setosa
## 9           4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
## # ... with 140 more rows
```

For a full list of the column type options, see the column type help page in the readr package documentaiton `vignette("column-types", package = "readr")`.

Values for the `Season` variable in `bat_dat` were entered using integers. `readr` consequently read them in as integers, but in actuality this variable should be a factor, because the values represent categories or classes rather than true counts.


```r
bat_dat <- readr::read_csv("./data/bat_dat.csv", 
                           col_types = cols(
                                   Season = col_factor(levels = c(1,2))
                           ))
```

*Challenge 6: parsing column type specification 5-minute*

> 1. Edit your data import command from the previous challenge, so that you supply column types for the the columns:

```
Habitat == factor, levels: 0, 1
Season == factor, levels: 1,2
Bioregion == factor, levels: 1 to 4, NA.
```
> 2. Hint: you can call `dplyr::distinct(bat_dat, Season)` to show the unique values for the Season column. Repeat for each variable independently to check what levels to supply to the `col_factor` argument.
> 3. Save, commit and push your script changes to GitHub
> 4. Source the file to update the object in R's workspace.



# Writing CSV Files

You can write your dataframes as CSV files using the `write_csv()` function. A good point in your data analysis cycle to save your dataframes as CSV's is once you have completed cleaning and tidying your data. Remember from the [project management module](./01_project_management_scaffolding.Rmd), that any modifications to the data set should not be over-written on the original data file. You should save any modifications in a new file in your .`/outputs/` directory.


```r
write_csv(x = iris, path = "./output/iris.csv")
```

# Overviewing your imported data

Once your data has been imported into R, it's useful to examine it to firstly get a sense of your data, and secondly to aid in diagnosing any inaccuracies that might have occurred either during data capture, data transcription from hard to digital, if your field data was recorded on paper, or perhaps there was an error during the import of the data into R (sometimes R can convert your column to the wrong 'type' e.g. a character instead of numeric value). Overviewing your data after import is simple yet critical task and should take place before any data wrangling or analysis - it could potentially save future-you much time down and heartache down the track.

*Printing in the console*

Looking at your data frame in the console often clogs your console, and doesn't tell you much about the type of data in each column. The column names might often be obscured. If your console is completely clogged by a dataframe with many rows, you might not even be able to see the first few rows.

**Challenge 7 (interactive)**

Run each line of code in the console below.


```r
iris # Clogs your console, am I right?
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0         3.6          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4         0.3     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1         0.1     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19           5.7         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23           4.6         3.6          1.0         0.2     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8         3.4          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2         3.5          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2         4.1          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35           4.9         3.1          1.5         0.2     setosa
## 36           5.0         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3         0.2     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4         3.0          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9         0.4     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50           5.0         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57           6.3         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6         1.3 versicolor
## 60           5.2         2.7          3.9         1.4 versicolor
## 61           5.0         2.0          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63           6.0         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8         1.4 versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83           5.8         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5         1.6 versicolor
## 87           6.7         3.1          4.7         1.5 versicolor
## 88           6.3         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90           5.5         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4         1.2 versicolor
## 92           6.1         3.0          4.6         1.4 versicolor
## 93           5.8         2.6          4.0         1.2 versicolor
## 94           5.0         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2         1.3 versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3         1.3 versicolor
## 99           5.1         2.5          3.0         1.1 versicolor
## 100          5.7         2.8          4.1         1.3 versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6         3.0          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2         3.6          6.1         2.5  virginica
## 111          6.5         3.2          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1         2.4  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119          7.7         2.6          6.9         2.3  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126          7.2         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4         2.1  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146          6.7         3.0          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2         3.4          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
```

```r
dplyr::tbl_df(iris) # Much better!
```

```
## # A tibble: 150 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
## 1           5.1         3.5          1.4         0.2  setosa
## 2           4.9         3.0          1.4         0.2  setosa
## 3           4.7         3.2          1.3         0.2  setosa
## 4           4.6         3.1          1.5         0.2  setosa
## 5           5.0         3.6          1.4         0.2  setosa
## 6           5.4         3.9          1.7         0.4  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           5.0         3.4          1.5         0.2  setosa
## 9           4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
## # ... with 140 more rows
```

`tbl_df()` converts your dataframe to the class `tbl` (pronounced 'tibble')

Only the data that can fit on the screen will be displayed. Note that when printed to the console, `tbl`'s dimensions are printed at the top of the print response, and any variables that do not fit onto the screen are listed at the bottom of the printout. Importantly the 'type' of each column is displayed in angle brackets: 

- `<int>` for type integer
- `<dbl>` for doubles, or real numbers
- `<chr>` for character vectors, or strings
- `<dttm>` date-times
- `<lgl>` logical, vectors that contain only `TRUE` or `FALSE`
- `<fctr>` factors, representing categorical variables with a fixed number of possible values
- `<date>` date

In programming language, dplyr functions are said not to have 'side-effects', meaning that unless you assign any of your changes to an object, your code is simply printed the console, rather than being saved to the object in R's memory.



```r
class(iris) # Coercion to class tbl has not been saved!
```

```
## [1] "data.frame"
```

```r
class(dplyr::tbl_df(iris)) # This is the correct output!
```

```
## [1] "tbl_df"     "tbl"        "data.frame"
```

```r
iris <- dplyr::tbl_df(iris) # Lets save the changes to R's memory by assigning it to the existing object 'iris'
iris_copy <- dplyr::tbl_df(iris) # if we give a new name, rather than the name of the existing object, this saves the output from our commands to a new object, here its called 'iris_copy'
```

*Getting a glimpse of your data*

Dplyr's `glimpse()` function yields an information dense summary of tbl data, and is particularly handy when you have many variables in your dataset.


```r
dplyr::glimpse(iris)
```

```
## Observations: 150
## Variables: 5
## $ Sepal.Length <dbl> 5.1, 4.9, 4.7, 4.6, 5.0, 5.4, 4.6, 5.0, 4.4, 4.9,...
## $ Sepal.Width  <dbl> 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1,...
## $ Petal.Length <dbl> 1.4, 1.4, 1.3, 1.5, 1.4, 1.7, 1.4, 1.5, 1.4, 1.5,...
## $ Petal.Width  <dbl> 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1,...
## $ Species      <fctr> setosa, setosa, setosa, setosa, setosa, setosa, ...
```

*Viewing your data*

The base utilities `View()` function allows you to navigate your data within RStudio in a spread-sheet like format.You can sort or order your your rows on a particular variable, by hitting the up or down arrow on each column heading. You can also filter rows based on ranges for one or more variables. This functionality is great for building a mental-picture of your data, and for checking on the outputs of your code as you go about wrangling your data. 

*interactive vs. scripted work in RStudio*

The functions above are primarily used for working interactively, rather than in a script. Working interactively helps you to build a mental picture of your dataset as you wrangle. It is a good idea to run any code you write in scripts in the console as you progress, testing that it works as you go.

**Challenge 7a: interactive sorting and filtering (1-minute)**

> Run the following line in your console. 


```r
View(iris) # in the popup window sort, order and filter
```
> 1. In the pop-up window, try sorting your data on one variable
> 2. Experiment with filtering on one or more rows.


## A QA check-list and their remedies

Below are some questions (non-exhaustive list) to consider in the data cleaning and tidying phase, before proceding with your analysis questions.

- Check that column data-types are correct, e.g. if a column should contain numeric values, check that there are no non-numeric values
        - data parsing with `readr` can help against this. 
-  Do empty cells actually represent missing data, and not mistakes in data entry? Do they indicate that they are empty using the appropriate null values?
        - Use the `View` function to filter for NA values.
-  Check for consistency in unit of measurement, naming scheme (e.g., taxonomy, location), etc.
        - `View`, and statistical analyses to look for outliers, e.g. boxplots
- correct colnames, missing variables? number of rows, missing observations? 
        - `print`ing a `tbl` and `glimpse`, and `View`ing your data object are useful ways to check for these. 
- duplicate entries
        - call `dplyr::distinct()` on whole dataset, use the `print()`, `View()` and `glimpse()` functions

# References

[R for Data Science: Data Import with readr](http://r4ds.had.co.nz/data-import.html)

British Ecological Society (2014) A Guide to Data Management in Ecology and Evolution. (ed K. Harrison). British Ecological Society. [online]. Available from: www.britishecologicalsociety.org/publications/journals.

White, E., Baldridge, E., Brym, Z., Locey, K., McGlinn, D., Supp, S. (2013) Nine simple ways to make it easier to (re)use your data. IEE. 6, 1–10.
