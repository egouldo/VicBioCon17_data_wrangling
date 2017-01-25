# "Data Wrangling for Ecologists": Course Materials to accompany the workshop Victorian Biodiversity Conference (2017)

[https://vicbiocon17.dryfta.com/en/](https://vicbiocon17.dryfta.com/en/)

Code here is copyright of Elise Gould, 2017. Please note these materials are still in active development.

Data copyright Tanja Straka, 2016, paper doi: [doi: 10.1002/ece3.2224](doi: 10.1002/ece3.2224)

- ADD LINK TO THIS REPOSOTIRY: WHERE TO FIND IT SO PARTICIPANTS CAN View the docs on their computer and follow instructions.

## Bat Data Analysis Questions to explore:

- whats the most common species?
        - number of sites observed at 
        - mean richness
- respnse variables to explore:
        - diversity / richness
        - abundance / activity
        - relative abundance (percentage of recorded calls of each species, figure 3 in Tanja's paper)
- what "story" can we tell? what suite of questions can we put together to tell an interesting data analysis story / frame as detective work.

## Code Points to learn:

- data wrangling model
- Dplyr verbs
- Data tidying - replacing values, e.g. spelling mistakes
- species lookup tables
- Different types of plots:
        - one response var + discrete predictor var
        - one response var + continuous predictor var
        
        
### Todos:

- Aptitude / confidence survey for participants (decide where to pitch and cutoff content)
- Instructions for installing R / Rstudio and all materials
- Wifi password?
- schedule (survey / email)


## OVERVIEW:




the pace of the workshop will be somewhat influenced by the mix of existing skillsets and experience of the other participants. That being said, I will be making all of the materials available on a github repository in time for the workshop. This will be available to participants afterwards, just in case we don’t make it through all the modules on the day.

The plan is to mix theory/content and examples via a traditional lecturing set-up and then set some tasks / challenges to be completed by individuals on their own computer. We will switch back and forth between these two modes. People can also follow the on-board examples as we go, trying them out in RStudio. Each task will build on the previous one, demonstrating how to step-through the data analysis life-cycle, as well as how to implement best-practice workflows to achieve good data analysis that builds complexity and knowledge of some dataset. Each challenge will then be reviewed as a group before moving onto the next module.

It is expected that everybody will have a github account set up and their RStudio software linked to git and github prior to the workshop (these details along with instructions will be sent out next week). The idea is to have one or two R scripts as well as an RMarkdown document that individuals work on progressively on their own laptops. Each time any changes are made on the local project, these changes will be committed to git, and the changes pushed to github.

We won’t use git / github via the command line, if you want this sort of detailed information, other workshops or existing resources will be more beneficial.
We will strictly be using the git interface in Rstudio for version control. The specific git/github topics we will be covering are: 
-	setting up a new project in RStudio and linking this to a github repository
-	Adding documents, folders, and committing changes to the local git repository
-	Pushing these changes to the repository on github
-	We will not be focussing on advanced git/github concepts such as collaborating with others on a git repository or managing merge conflicts

In terms of better programming, we will not be focussing on advanced programming skills such as writing loop constructs, or parallel programming, etc. The focus of the workshop will be on identifying common data wrangling or tasks in ecology / conservation, and showing you the dplyr/tidyr functions to overcome these problems. Dplyr/tidyr is relatively easy to learn, but will certainly make your code more efficient both in terms of computational time (it runs in C++ in the background) and in terms of the time needed to write this code (it’s easier conceptually to write for several reasons, and takes less lines to achieve the same task in base R). The other primary aim of the workshop will be on teaching good workflows, and frameworks for thinking about the data-analysis life-cycle and theory of tidy data. 

The information we will be teaching is certainly not new or novel, and much of it is synthesised from many blog posts and existing open-source resources. The content is mostly the culmination of many hours of work to bring all of these concepts and materials together. So in that sense, you could certainly access all of these knowledge on the web, but attending the workshop could be a good way of accessing this information without having to look for it yourself.


-	In terms of teaching better programming we will be focusing on identifying common data wrangling problems or tasks, and showing you the dplyr functions to overcome these problems.
-	Much of the focus is on developing good workflows, and teaching tools and skills to implement them
-	Teaching frameworks for thinking about the data analysis life-cycle, and a theory of tidy data.
-	Time-saving tips to using RStudio. Simple but effective and time-saving for you in the long-run.
