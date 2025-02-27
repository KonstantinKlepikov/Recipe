![Python 2.7](https://img.shields.io/badge/python-2.7-blue.svg) 
![License](https://img.shields.io/badge/license-GPLv3-blue.svg) 
 
RECIPE 
======================================================================== 
 
This project presents an AutoML framework for automatically evolving machine learning pipelines based on the definition of grammars. 
If you use this project in your work, please reference the following paper: 
 
RECIPE: A Grammar-based Framework for Automatically Evolving Classification Pipelines, Alex G. C. de Sá, Walter José G. S. Pinto, Luiz Otavio V. B. Oliveira,  Gisele L. Pappa, EuroGP'17  
 
Note that this project uses/extends the [libgges library](https://github.com/grantdick/libgges)  to implement the Grammar Based GP. 
 

 
Installation 
------------ 
 
This project can be installed in any platform supported by GCC and python 2.7.  
A Makefile is included to build the base library and application. A call to: 
  make 
should compile the project without any problems, and the resulting binaries should appear in the bin directory. 
 
More detailed information can be found at : [Installation](https://laic-ufmg.github.io/Recipe/docs/installation/) 
 
Documentation 
------------- 
 
Documentation for the project can be found in the following link: 
 
[RecipeDoc](https://laic-ufmg.github.io/Recipe/docs/) 

Usage
-----

See link bellow for usage information:

[RecipeUsage](https://laic-ufmg.github.io/Recipe/docs/usage/)
 
License 
------- 
 
See [LICENSE](LICENSE) file. 
 
Support 
------- 
 
Any questions or comments should be directed to Walter José 
(walterjgsp@dcc.ufmg.br) or Alex de Sá (alexgcsa@dcc.ufmg.br) 
Major changes

* Makefile
* Some methods call
* All the grammar
* The loadmethod function
