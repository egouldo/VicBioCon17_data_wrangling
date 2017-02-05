# Chapter 7: transform & visualise
Elise Gould  
03/02/2017  




# Ggplot2

Ggplot is based on a 'grammar of graphics', the idea that you can build every graph from the same few components:

- a data set
- a set of **geoms** (visual markers representing data points)
- And a coordinate system, a method of arranging points in space

To display data values, variables in the dataset are mapped to aesthetic properties of the specified **geom**, such as size, colour and x, y locations. This creates an empty plot. Let's try with the iris data:


```r
library(ggplot2)
ggplot(data = iris, aes(x = Species, y = Petal.Width))
```

![](08_transform_visualise_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

We add layers to the plot using the `+`sign:

```r
ggplot(data = iris, aes(x = Species, y = Petal.Width)) +
        geom_point(aes(colour = Species)) +
        theme_bw()
```

![](08_transform_visualise_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

# Challenge, create a ggplot:






# Final Challenge (easy): Create a Plot with ggplot2

Walk through the following steps to create a ggplot in your Rmarkdown

1. create a new chunk, call it `plot`, and give it the option `echo = FALSE`
2.  Using the richness_by_season data, establish an empty plot providing the following aesthetics:

- x: Habitat
- y: mean_richness
- fill: Season
3. Add the following layers with the plus sign to create a bar plot with error bars:
```
geom_bar(stat = "identity", position = position_dodge())

geom_errorbar(aes(ymin = mean_richness - se_richness, 
                  ymax = mean_richness + se_richness), 
                  width = 0.1,
                  position = position_dodge(0.9))
```



# Resources:

[Ggplot2 cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/12/ggplot2-cheatsheet-2.0.pdf)
