# "Data Wrangling for Ecologists": Course Materials to accompany the workshop Victorian Biodiversity Conference (2017)


[https://vicbiocon17.dryfta.com/en/](https://vicbiocon17.dryfta.com/en/)

Code here is copyright of Elise Gould, 2017. 

Data copyright (2016):
Tanja Maria Straka (1,2), Pia Eloise Lentini (2), Linda Faye Lumsden (3), Brendan Anthony Wintle2 & Rodney van der Ree (1,2)

1. Australian Research Centre for Urban Ecology, Royal Botanic Gardens Victoria, c/o School of BioSciences, University of Melbourne, Melbourne, VIC, Australia
2. School of BioSciences, University of Melbourne, Melbourne, VIC, Australia
3. Department of Environment, Land, Water and Planning, Arthur Rylah Institute for Environmental Research, 123 Brown Street, Heidelberg, VIC 3084, Australia

[paper doi: 10.1002/ece3.2224](doi: 10.1002/ece3.2224)

# About the structure of this repository, where to find what you need

1. Welcome to the README, you are here.

2. [Getting started: setting up your software on your computer](https://github.com/egouldo/VicBioCon17_data_wrangling/tree/master/getting_started)

3. [data: all the data files you will need for working through challenges and running through provided examples](https://github.com/egouldo/VicBioCon17_data_wrangling/tree/master/data)

4. [Course content modules](https://github.com/egouldo/VicBioCon17_data_wrangling/tree/master/modules)

5. assets - you won't need this -- just for rendering the images to appear on the web in github.

6. Also not needed but preserved her for my backup. These R scripts generated some of the dataset inside the `./data/` folder. Open them up if you would like to take a look at  real-world examples of data-wrangling.

7. ANSWERS to the challenges may be found in this repository: [https://github.com/egouldo/VicBioCon17_participant_repo](https://github.com/egouldo/VicBioCon17_participant_repo). After completing all the challenges, your repository should mirror that repository.



## Workshop Overview:


### Workshop format and pace

The pace of the workshop will be somewhat influenced by the mix of existing skillsets and experience of the other participants. That being said, all workshop materials will be made available on GitHub afterwards, just in case we don't make it through all the modules on the day or should you wish to review any content in more depth.

The plan is to alternate between running through theory / content, using a traditional lecture set-up, and working through a series of challenge problems on your own computer. There will also be on-screen examples, to which you can follow along as we go. Each of the challenge tasks will build on the previous one, demonstrating how to step through the data-analysis life-cycle, using a real-world data-set. The examples and challenges will teach you how to implement commonly used data-manipulations in ecology using `dplyr` and `tidyr` functions, as well as best-practice workflows for managing your data. Each challenge will be reviewed as a group before moving onto the next module.

It is expected that everybody will have a GitHub account set up and their RStudio software linked to git and GitHub prior to the workshop. Please see step 2 in the list of pre-workshop tasks above. The idea is to have one or two R scripts as well as an RMarkdown document that individuals work on progressively on their own laptops. Each time any changes are made on the local project, these changes will be committed to git, and the changes pushed to GitHub.

### What we will and won't be covering on the day

I have had a number of enquiries about the content of the workshop. As per the workshop description on the VicBioCon17 website, we will be using packages from Hadley Wickham's tidyverse suite (e.g. ggplot2, dplyr, and tidyr) to teach data manipulation and visualisations. We *will not* be going through advanced programming skills such as loop-constructs, parallel-processing and debugging. Nor we will we be running through how to use git in the command line. Links to other resources teaching more advanced R skills will be provided throughout the workshop materials in the relevant module.

Although not teaching some advanced programming skills, the focus of the workshop will be on identifying common data wrangling or tasks in ecology / conservation, and showing you the `dplyr`/`tidyr` functions to overcome these problems. `dplyr` and `tidyr` often eliminate the need for performing looped operations, and are amenable to their own form of line-by-line debugging through the use of pipes (these things: `%>%`). They are relatively easy to learn how to implement, and will certainly make your code more efficient: both in terms of computational time (it runs in C++ in the background) and in terms of the time needed to write this code (it’s easier conceptually to write for several reasons, and takes less lines to achieve the same task in base R). 

The other primary aim of the workshop will be on teaching good workflows, and frameworks for thinking about the data-analysis life-cycle and theory of tidy data. It is intended that you will walk away with a solid foundation for creating a reproducible and portable analyses in RStudio, that will minimise headaches and mistakes for both future-you and your collaborators, supervisors, etc.

We will strictly be using the git interface in Rstudio for version control. The specific git/GitHub topics we will be covering are: 
-	setting up a new project in RStudio and linking this to a GitHub repository
-	Adding documents, folders, and committing changes to the local git repository
-	Pushing these changes to the repository on GitHub
-       We will not be focussing on advanced git/GitHub concepts such as collaborating with others on a git repository or managing merge conflicts
