# Dplyr: The basics
Elise Gould  
09/01/2017  



## What is 'dplyr', and why you should use it for data wrangling

Data wrangling is the messy process of cleaning, re-shaping and re-organising data from the raw format you imported into R into another format that allows for some analysis.

dplyr makes wrangling your data frames a breeze. dplyr is a metaphorical set of ‘pliers’ for wrangling your data frames, row- or column-wise subsetting, conduct group-wise operations on multiple subsets of data, or merge data frame and matching rows by value rather than position. 

Everything you can do in dplyr, you can do in base R. So why bother? dplyr is expressive, and verb-focused, rather than object-focused, meaning that common data manipulation problems take less code and less mental effort to write. This means it's easy for your collaborators (including your future-self) to read. This will become more apparent as you become more familiar with using dplyr on your own data. Moreover, much of dplyr’s work is implemented behind the scenes in C++ code, making wrangling larger data frames lightning-fast! 

## Dplyr, a "grammar" of data manipulation

### Learning our verbs and writing sentences:

- row-wise subsetting: `filter()` takes logical conditions as arguments
- column-wise subsetting: `select()` takes column names or tidyr functions to select matching columns

- Create new variables, change existing variables: `mutate()`
- summarise data with summary statistics: `summarise()`

- Reorder rows: `arrange()`
- Rename variables: `rename()`

### Dplyr verbs have a common syntax:

Each of the verbs above follow the same syntax:

- The first argument is a data-frame
- subsequent arguments describe what to do to that data frame, using the variable names (unquoted or 'bare'). Columns are referred to directly, without need to use the `$` operator.
- the function returns a new data frame
- input and output dataframes are *tidy* dataframes for all dplyr verbs (we will get to this in the [next module](./06_tidy_data.Rmd))

Importantly, dplyr functions don't have side-effects, this means that the your data wrangling won't update the object you are working with unless you use the assignment operator `<-` to overwrite that object, or write to a new object.

**Subsetting Observations (rows)**

Let's subset only the rows where Season is equal to 1. We use the `dplyr::filter()` function. 
- The first argument is the data frame we wish to filter through. 
- The second argument is a logical expression (two or more values separated by the [logical operators](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html): `==`, `!=`, `&`, `|`, etc., returning a logical, `TRUE` or `FALSE`). Try in console: `?Comparison` or `?base::logic`.


```r
dplyr::filter(.data = bat_dat, Season == 1)
```

```
## # A tibble: 94 × 83
##           Site Habitat Season Chgouldii Chmorio `CG/Mormlp` MormII
##          <chr>   <int>  <int>     <int>   <int>       <int>  <int>
## 1  Albert Park       1      1       151       0           6      0
## 2        Amber       1      1         3      10           0      0
## 3        Avoca       1      1         0       0           0      0
## 4        Banjo       1      1        52       3           0      0
## 5    Blackburn       1      1       117       1           7      1
## 6    Boardwalk       1      1         0       0           0      0
## 7      Bonview       1      1       120     158           2      0
## 8     Botanica       1      1       206      13           0      0
## 9     Braeside       1      1        28      38           1      0
## 10    Brighton       1      1       253      49          20      0
## # ... with 84 more rows, and 76 more variables: Mschocean <int>,
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

You can filter based on multiple variables. Let's get the sites from `Season 1`, and where there were more than 100 recordings of `Chgouldii`. How many sites are there where this was the case?


```r
dplyr::filter(.data = bat_dat, Season == 1, Chgouldii > 100)
```

```
## # A tibble: 25 × 83
##           Site Habitat Season Chgouldii Chmorio `CG/Mormlp` MormII
##          <chr>   <int>  <int>     <int>   <int>       <int>  <int>
## 1  Albert Park       1      1       151       0           6      0
## 2    Blackburn       1      1       117       1           7      1
## 3      Bonview       1      1       120     158           2      0
## 4     Botanica       1      1       206      13           0      0
## 5     Brighton       1      1       253      49          20      0
## 6     Bundoora       1      1       121      13           2      0
## 7   Canterbury       1      1       210      25           2      4
## 8    Elizabeth       1      1       534      26          14      0
## 9  Ferny Crrek       1      1       226      65           3      6
## 10  Jackropper       1      1       137       1           1      0
## # ... with 15 more rows, and 76 more variables: Mschocean <int>,
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

Here are three other very useful filtering functions:

1. Remove duplicate rows with `dplyr::distinct()`

```r
distinct(bat_dat) #no optional args given, uses all variables
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

```r
distinct(bat_dat, Site) # give a variable as an argument, that var will determine uniqueness
```

```
## # A tibble: 94 × 1
##           Site
##          <chr>
## 1  Albert Park
## 2        Amber
## 3        Avoca
## 4        Banjo
## 5    Blackburn
## 6    Boardwalk
## 7      Bonview
## 8     Botanica
## 9     Braeside
## 10    Brighton
## # ... with 84 more rows
```
2. Select rows by position with `dplyr::slice()`

```r
slice(bat_dat, 23)
```

```
## # A tibble: 1 × 83
##       Site Habitat Season Chgouldii Chmorio `CG/Mormlp` MormII Mschocean
##      <chr>   <int>  <int>     <int>   <int>       <int>  <int>     <int>
## 1 Bundoora       1      1       121      13           2      0         0
## # ... with 75 more variables: Nyctspp <int>, Mmacropus <int>,
## #   `Nspp/Mmacr` <int>, Scotspp. <int>, Taustralis <int>,
## #   Vdarlingtoni <int>, Vregulus <int>, Vvulturnus <int>,
## #   Unidentified <int>, BatSpecies <int>, BatActivity <int>, Col <int>,
## #   Dip <int>, Eph <int>, Hem <int>, Lep <int>, Hym <int>, Tri <int>,
## #   Manto <int>, Psoc <int>, Orth <int>, Neur <int>, Derm <int>,
## #   Bla <int>, Iso <int>, Odo <int>, Plec <int>, Insectabundance <int>,
## #   TotalOrder <int>, Moon <int>, NatEx <int>, Bioregion <int>,
## #   Size <dbl>, SQQ <dbl>, `Water Depth` <dbl>, `Imp 5km` <dbl>,
## #   Imp2km <dbl>, Imp1km <dbl>, Imp500m <dbl>, NDVI2km <dbl>,
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

```r
slice(bat_dat, c(1:5, 11)) # More than one argument? concatenate
```

```
## # A tibble: 6 × 83
##          Site Habitat Season Chgouldii Chmorio `CG/Mormlp` MormII
##         <chr>   <int>  <int>     <int>   <int>       <int>  <int>
## 1 Albert Park       1      1       151       0           6      0
## 2 Albert Park       1      2        38       2           1      0
## 3       Amber       1      1         3      10           0      0
## 4       Amber       1      2         6       9           1      0
## 5       Avoca       1      1         0       0           0      0
## 6   Boardwalk       1      1         0       0           0      0
## # ... with 76 more variables: Mschocean <int>, Nyctspp <int>,
## #   Mmacropus <int>, `Nspp/Mmacr` <int>, Scotspp. <int>, Taustralis <int>,
## #   Vdarlingtoni <int>, Vregulus <int>, Vvulturnus <int>,
## #   Unidentified <int>, BatSpecies <int>, BatActivity <int>, Col <int>,
## #   Dip <int>, Eph <int>, Hem <int>, Lep <int>, Hym <int>, Tri <int>,
## #   Manto <int>, Psoc <int>, Orth <int>, Neur <int>, Derm <int>,
## #   Bla <int>, Iso <int>, Odo <int>, Plec <int>, Insectabundance <int>,
## #   TotalOrder <int>, Moon <int>, NatEx <int>, Bioregion <int>,
## #   Size <dbl>, SQQ <dbl>, `Water Depth` <dbl>, `Imp 5km` <dbl>,
## #   Imp2km <dbl>, Imp1km <dbl>, Imp500m <dbl>, NDVI2km <dbl>,
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

3. Get the top *n* entries with `dplyr::top_n()`
The second argument is *n*, and the third argument is the variable you wish to use for ordering.

```r
top_n(bat_dat, 1 , Mmacropus)
```

```
## # A tibble: 2 × 83
##       Site Habitat Season Chgouldii Chmorio `CG/Mormlp` MormII Mschocean
##      <chr>   <int>  <int>     <int>   <int>       <int>  <int>     <int>
## 1 Old Joes       1      1        43     130           0      0         0
## 2 Old Joes       1      2       254      88          18      0         0
## # ... with 75 more variables: Nyctspp <int>, Mmacropus <int>,
## #   `Nspp/Mmacr` <int>, Scotspp. <int>, Taustralis <int>,
## #   Vdarlingtoni <int>, Vregulus <int>, Vvulturnus <int>,
## #   Unidentified <int>, BatSpecies <int>, BatActivity <int>, Col <int>,
## #   Dip <int>, Eph <int>, Hem <int>, Lep <int>, Hym <int>, Tri <int>,
## #   Manto <int>, Psoc <int>, Orth <int>, Neur <int>, Derm <int>,
## #   Bla <int>, Iso <int>, Odo <int>, Plec <int>, Insectabundance <int>,
## #   TotalOrder <int>, Moon <int>, NatEx <int>, Bioregion <int>,
## #   Size <dbl>, SQQ <dbl>, `Water Depth` <dbl>, `Imp 5km` <dbl>,
## #   Imp2km <dbl>, Imp1km <dbl>, Imp500m <dbl>, NDVI2km <dbl>,
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

**Subsetting Variables (Columns)**

Let's get only the following columns with `dplyr::select()`: `Site`, `Habitat`, `Season`, `Chgouldii`


```r
dplyr::select(bat_dat, Site, Habitat, Season, Chgouldii)
```

```
## # A tibble: 188 × 4
##           Site Habitat Season Chgouldii
##          <chr>   <int>  <int>     <int>
## 1  Albert Park       1      1       151
## 2  Albert Park       1      2        38
## 3        Amber       1      1         3
## 4        Amber       1      2         6
## 5        Avoca       1      1         0
## 6        Avoca       1      2        13
## 7        Banjo       1      1        52
## 8        Banjo       1      2        17
## 9    Blackburn       1      1       117
## 10   Blackburn       1      2         0
## # ... with 178 more rows
```
We can also tell R that we wish it to drop some variables from our data:

```r
dplyr::select(bat_dat, -Humidity)
```

```
## # A tibble: 188 × 82
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
## # ... with 178 more rows, and 75 more variables: Mschocean <int>,
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
## #   TotalRoost <int>, Distance1sttree <dbl>, Temp <dbl>
```

As well as using the bare column names to select a variable. We can also use a suite of helper functions to match column names. This is useful when we have many variables we wish to subset by, but want to minimise typing. For the full suite of helper functions, type `?select` in the console. Some important ones are:

- `contains()`
- `ends_with()`
- `starts_with()`
- `matches()`


```r
select(bat_dat, starts_with("dist")) # not case sensitive unless we tell R so
```

```
## # A tibble: 188 × 5
##    Distriver Distwetland Distwater Distbushland Distance1sttree
##        <dbl>       <dbl>     <dbl>        <dbl>           <dbl>
## 1   2411.968     1931.92   1931.92      2546.05            15.0
## 2   2411.968     1931.92   1931.92      2546.05            15.0
## 3   1846.673       48.64     48.64      2135.00             0.5
## 4   1846.673       48.64     48.64      2135.00             0.5
## 5  12985.551     1143.16   1143.16      1532.92             1.0
## 6  12985.551     1143.16   1143.16      1532.92             1.0
## 7  23095.009      568.71    568.71      5416.28             1.0
## 8  23095.009      568.71    568.71      5416.28             1.0
## 9   7816.414     2615.07   2615.07       855.73             2.0
## 10  7816.414     2615.07   2615.07       855.73             2.0
## # ... with 178 more rows
```

**Alter existing or create new variables with `mutate()`**
After the first data frame argument, `mutate()` takes one or more name-value pairs.
Which is simply the name of a new or existing variable, followed by an `=` and some expression making computations from existing variables.

- Add new variables:
Let's compute the sum of the counts for `Taustralis` and `Vdarlingtoni` species (call `View` for easy )

```r
dplyr::mutate(bat_dat, Taust_Vdarl = Taustralis + Vdarlingtoni)
```

```
## # A tibble: 188 × 84
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
## # ... with 178 more rows, and 77 more variables: Mschocean <int>,
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
## #   TotalRoost <int>, Distance1sttree <dbl>, Temp <dbl>, Humidity <dbl>,
## #   Taust_Vdarl <int>
```
- Change existing ones:

To alter an existing variable we use the name of that variable in the name-value pair argument to `mutate()`, and then provide some computation to that variable on the right.

Imagine there was an error at some point during data collation and a decimal place was shifted, let's pretend it was for the variable `House500`. 



```r
mutate(bat_dat, House500 = House500 / 10)
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

**Make new variables summarised from existing variables**

Like mutate `summarise()` also uses name-value pairs of expressions. On the left-hand side is the name of the summary variable you wish to create, on the right hand side of the `=` is an expression that uses a summary function.

Sumary functions take a vector of values and return a single value, such as `mean()` or `sum()`. This can be represented visually by:
![summary_function](../assets/dplyr_summary_function.png)
Let's take the mean number of Chgouldii observations in 

```r
summarise(bat_dat, mean_Chgouldii = mean(Chgouldii))
```

```
## # A tibble: 1 × 1
##   mean_Chgouldii
##            <dbl>
## 1       60.03191
```
Observe how 188 observations have now been reduced to 1 value. Because the resultant vector is shorter than the input vector, this means we can no longer have a nice, square data frame, consequently, all other variables have been dropped.

Some key window functions include:

- `first()`
- `last()`
- `min()`
- `max()`
- statistical functions, like `median()`, `sd()`, `var()`. 

**Renaming variables**

`dplyr::rename()` takes a comma-separated list of unquoted expressions. On the left-hand side of the expression, you provide the new name of the variable, on the right hand side the current column name.


```r
rename(bat_dat, Cg = Chgouldii, Cm = Chmorio)
```

```
## # A tibble: 188 × 83
##           Site Habitat Season    Cg    Cm `CG/Mormlp` MormII Mschocean
##          <chr>   <int>  <int> <int> <int>       <int>  <int>     <int>
## 1  Albert Park       1      1   151     0           6      0         0
## 2  Albert Park       1      2    38     2           1      0         1
## 3        Amber       1      1     3    10           0      0         0
## 4        Amber       1      2     6     9           1      0         0
## 5        Avoca       1      1     0     0           0      0         0
## 6        Avoca       1      2    13    72           1      0         0
## 7        Banjo       1      1    52     3           0      0         0
## 8        Banjo       1      2    17     0           1      0         0
## 9    Blackburn       1      1   117     1           7      1         0
## 10   Blackburn       1      2     0     1           0      0         0
## # ... with 178 more rows, and 75 more variables: Nyctspp <int>,
## #   Mmacropus <int>, `Nspp/Mmacr` <int>, Scotspp. <int>, Taustralis <int>,
## #   Vdarlingtoni <int>, Vregulus <int>, Vvulturnus <int>,
## #   Unidentified <int>, BatSpecies <int>, BatActivity <int>, Col <int>,
## #   Dip <int>, Eph <int>, Hem <int>, Lep <int>, Hym <int>, Tri <int>,
## #   Manto <int>, Psoc <int>, Orth <int>, Neur <int>, Derm <int>,
## #   Bla <int>, Iso <int>, Odo <int>, Plec <int>, Insectabundance <int>,
## #   TotalOrder <int>, Moon <int>, NatEx <int>, Bioregion <int>,
## #   Size <dbl>, SQQ <dbl>, `Water Depth` <dbl>, `Imp 5km` <dbl>,
## #   Imp2km <dbl>, Imp1km <dbl>, Imp500m <dbl>, NDVI2km <dbl>,
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

# Writing sentences, joining verbs with pipes `%>%`

So far we've been dealing with individual functions or 'verbs', but what if we want to write sentences so-to-speak? Often we want to combine actions for example, you might want to select and filter at the same time.

let's look at how we would achieve selecting the first five variables in `bat_dat` and then filtering for more than 50 bat observations for both `Chgouldii` and `Chmorio`:

```r
filter(select(bat_dat, 1:5), Chgouldii > 50, Chmorio > 50)
```

```
## # A tibble: 5 × 5
##          Site Habitat Season Chgouldii Chmorio
##         <chr>   <int>  <int>     <int>   <int>
## 1     Bonview       1      1       120     158
## 2 Ferny Crrek       1      1       226      65
## 3 Ferny Crrek       1      2        92     125
## 4     Landcox       1      2       182      74
## 5    Old Joes       1      2       254      88
```

It's not very easy on the eye to read through these nested functions. Two sequential functions are difficult enough, imagine chaining more than 2? You could assign the first operation to a temporary object, but as your project matures your workspace can become cluttered with objects, which can be an issue if you have large amounts of data.

And now with pipes:


```r
select(bat_dat, 1:5) %>%
        filter(Chgouldii > 50, Chmorio > 50)
```

```
## # A tibble: 5 × 5
##          Site Habitat Season Chgouldii Chmorio
##         <chr>   <int>  <int>     <int>   <int>
## 1     Bonview       1      1       120     158
## 2 Ferny Crrek       1      1       226      65
## 3 Ferny Crrek       1      2        92     125
## 4     Landcox       1      2       182      74
## 5    Old Joes       1      2       254      88
```

> How to read the code: say 'then' when you encounter the pipe at the end of each line.

**So what is the pipe?**

The pipe simply passes an object on the left hand side as the first argument of a function on the right hand side. You can use them on any class of object within R, your object doesn't necessarily have to be a data frame. If you wish to pass the object on the left hand side as an argument other than the first. 

We type a `.` in place of the object within the function on the right hand side:

```
x %>% f(y) is the same as f(x,y)
y %>% f(x, ., z) is the same as f(x, y, z)
```

**Why you should convert to using pipes?**

- More readable code is easier to pick up for future-you and collaborators (no nested-functions): You dont have to read your functions from the inside out, so you can observe the sequence of operations more clearly and with little effort.
- It is therefore easier to pin-point sources of errors! You can debug line-by-line, running each line at a time until you isolate the command that breaks the chain
- Your code is easier to type, flowing from one function to the next, just as your train of thought does 
- You won't miss a closing bracket when you type your code with pipes
- You are less likely to create intermediate objects, so its easier to keep track of which object is the appropriate object to be working with

### Grouped operations: Split, apply, combine operations

The ability to combine the above functionality to perform grouped operations is the real source of power in dplyr. The `dplyr::group_by()` function groups data into rows with the same value of a given variable, such that we can perform some summary or mutate computation for each group. 

The `dplyr::group_by()` function takes one or more unquoted column names as its arguments.

We can represent these two instances visually:
![grouped operations with `summarise()` and `mutate()`](../assets/dplyr_grouped_operations.png)

With ecological data, you will find that you often want to group by some combination of sampling unit, or other site-based environmental co-variate. You will almost always perform grouped operations on variables that are categorical variables, such as on factors, integer or character vectors, rather than on variables that are continuous, like numeric ones.

At each site, get the number of Chgouldii observations (interested in looking at effect of season)

Does the mean number of Chgouldii observations change from one season to the next?


```r
bat_dat %>%
        select(1:4) %>%
        group_by(Season) %>%
        summarise(mean_Cg = mean(Chgouldii))
```

```
## # A tibble: 2 × 2
##   Season  mean_Cg
##    <int>    <dbl>
## 1      1 75.28723
## 2      2 44.77660
```

Let's `group_by()` both `Season` and `Bioregion` this time. 

The grouping occurs sequentially, grouping within groups, beginning from the first variable supplied on the left hand side, working towards the right.

We can supply more than one expression to our summarise function, often when we compute the mean, we also want to compute the standard error of the mean:

```r
# Define a standard error function called se:
se <- function(x) {
        sqrt(var(x, na.rm = TRUE) / length(na.omit(x)))
}

# Apply the function to the Chgouldii column
bat_dat %>%
        select(1:4, Bioregion) %>%
        group_by(Bioregion, Season) %>%
        summarise(mean_Cg = mean(Chgouldii),
                  se_Cg = se(Chgouldii))
```

```
## Source: local data frame [10 x 4]
## Groups: Bioregion [?]
## 
##    Bioregion Season   mean_Cg     se_Cg
##        <int>  <int>     <dbl>     <dbl>
## 1          1      1  91.52273 18.352851
## 2          1      2  56.95455 10.592687
## 3          2      1  64.84615 17.822791
## 4          2      2  34.38462 12.833020
## 5          3      1 149.00000        NA
## 6          3      2  35.00000        NA
## 7          4      1  55.93939 16.809986
## 8          4      2  32.57576  6.481622
## 9         NA      1  70.66667 65.197989
## 10        NA      2  48.66667 45.699502
```

*Using window functions with `mutate()`*
Just as `summarise()` uses window functions, `mutate()` uses window functions, which are functions that take a vector of values, and return another vector of values, with the output vector being the same length as the input vector. They are most useful when performing operations on groups of data.

Some useful window functions include:
- `between()` Are values between a and b?
- `min_rank()` Ranks with ties
- `ntile()` bins vectors into buckets
- `cumsum()` Cumulative sum
- `cummean()` Cumulative mean

For the full list of window functions, check out the Data Manipulation with dplyr and tidyr Cheatsheet:
`Help > Cheatsheets > Data Manipulation with dplyr, tidyr`
![From the data wrangling cheatsheet](../assets/dplyr_window_function.png)
As a trivial example, let's bin the `Chgouldii` obsrevations into 5 equally sized bins:


```r
bat_dat %>%
        select(1:4) %>%
        group_by(Season) %>%
        mutate(bin_Cg = ntile(Chgouldii,n = 5)) %>%
        arrange(Season, bin_Cg)
```

```
## Source: local data frame [188 x 5]
## Groups: Season [2]
## 
##         Site Habitat Season Chgouldii bin_Cg
##        <chr>   <int>  <int>     <int>  <int>
## 1      Amber       1      1         3      1
## 2      Avoca       1      1         0      1
## 3  Boardwalk       1      1         0      1
## 4     Cherry       1      1         0      1
## 5  Edithvale       1      1         4      1
## 6      Epsom       1      1         0      1
## 7    Landcox       1      1         0      1
## 8  Shankland       1      1         0      1
## 9    Tim Nev       1      1         2      1
## 10 Truganina       1      1         0      1
## # ... with 178 more rows
```

#Challenge 8: Type coercing (5-minutes)

When we imported our bat data earlier, we explicitly coerced some columns to factors but not all of the categorical variables that needed to be converted.

1. Within your script `01_tidy_data.R`, convert the following columns to factors using the `mutate()` function:
```
Moon
NatEx
Bioregion  
```
Hint: you can coerce integer variables to factor using `as.factor()` from base R.
Tip: You can experiment in the console as you go to see if your code works
Tip: In RStudio, with the cursor inside your mutate function, you can hit 'tab' to bring up a list of variables within your data frame (purple tags), use the arrow keys to find the variable you are looking for and hit enter to paste the variable name into your code. You can type the first one or two letters of the variable name to narrow down the list before hitting tab.

2. Don't forget that dplyr functions don't have side effects, so you need to assign this to the `bat_dat` variable inside your script.
3. Save your script, commit, push to GitHub.
4. Source your script to update `bat_dat` in your workspace

#Challenge 9: Fixing errors, replacing values (5-minute)

Your colleague has spotted a typo in one of the `Site` names. It should be `"Ferny Creek"` not `"Ferny Crrek"`.
1. Fix this mistake using `mutate()` and `replace()` (though you could use an `ifelse()` statement if you are confident)
Hint, provide the following arguments to replace in this order:
- The unquoted variable name you wish to replace values within
-  A logical expression of what to look for with the column name on the RHS, and the incorrect value as a character string on the RHS
-  A character string value containing the replacement site name.

2. instead of re-assigning this to the `bat_dat` object separately, chain it onto your code from the previous challenge using the `%>%` operator.
3. Save, commit, push to GitHub
4. Source your script to update `bat_dat` in your workspace

# References and Resources

Dplyr and tidyr vignettes: type into R's console: `browseVignettes(package = c("dplyr", "tidyr"))`

[Data Manipulation with dplyr, tidyr cheatsheet](), I have a copy printed out at my desk.
