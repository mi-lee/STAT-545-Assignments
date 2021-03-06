HW11: Shiny
==========================

## Accessing the app

The app has been deployed to shinyapps.io. The link is **[here!](https://mmlee.shinyapps.io/gapminder)**

## Some features I added

* Drop down menu for X and Y axis in choosing variables
* Tabs to separate graphs, tables, and an about page
* Using [bootstrap.css](https://github.com/mi-lee/stat545-data-analysis-r/blob/master/HW11/gapminder/www/bootstrap.css) for nicer-looking format
* Plotting data points for multiple countries, through different colour schemes 
* Informative (reactive) title to describe the graph


## Summary of files

* [ui.r](https://github.com/mi-lee/stat545-data-analysis-r/blob/master/HW11/gapminder/ui.R),
* [server.r](https://github.com/mi-lee/stat545-data-analysis-r/blob/master/HW11/gapminder/server.R), 
* [bootstrap.css](https://github.com/mi-lee/stat545-data-analysis-r/blob/master/HW11/gapminder/www/bootstrap.css), 
* [shinyapps folder](https://github.com/mi-lee/stat545-data-analysis-r/tree/master/HW11/gapminder/shinyapps/mmlee), 
* and the [data](https://github.com/mi-lee/stat545-data-analysis-r/blob/master/HW11/gapminder/gapminderDataFiveYear.txt). 

## Reflections

* The hardest was getting my bearings in understanding the terminology for Shiny; however, I got the hang of it faster than anticipated once I started creating my own features.

* What I didn't anticipate: Shiny is slow, and on my (very old) laptop, running and deploying the app took a lot of time - enough time for tea and coffee runs...

* Shiny's strengths: You can make a web application so easily, and without knowledge of Javascript! I am really thrilled with this module in particular as I have a lot of ideas for future probjects. 

* I got stuck on the multiple country selection, and was able to figure it out thanks to [Omar's](https://github.com/STAT545-UBC/zz_omar_alomeir-coursework/blob/master/Homework11/Shiny-apps/Gapminder-app/ui.R) well-documented code. Thank you Omar!

### Unsolved issues

* I am certain there is someone who knows how to do this, but after a long time I still couldn't figure it out:
	+ What is the best way to use a variable such as `input$x_var` and use it within the context of ggplot, such as `ggplot(aes(x=input$x_var, y=input$y_var))`?  This will return a message like `input cannot be found`.
	+ I tried all sorts of tricks such as `as.character`, `eval(parse(text = var))`, etc... 
	
* A more general question related to the above problem: When creating custom functions and a desired input is the column name (e.g. variable), how can you convert that string into calling the data? For example something very simple such as

```
fun <- function(data, var) {
	data$var
}
```

This returns `NULL`. I saw that Hadley Wickham's functions will use `.variables` and `.variables <- as.quoted(.variables)`, but I can't seem to get it to work... I would *very* much appreciate some guidance!
 

Enjoy!

![hansrosling](http://lh6.ggpht.com/_H14qvQBzS-Y/TSU1RmdCHNI/AAAAAAAALpE/oHD8MWY_-5Y/hans_rosling_bbc.jpg)
