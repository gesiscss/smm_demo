
[![Binder](https://notebooks.gesis.org/binder/badge_logo.svg)](https://notebooks.gesis.org/binder/v2/gh/gesiscss/smm_demo/master)

# smm_demo
Examples to complement of the SMM Monitor

# Install R jupyter notebooks

1. Install R. Use an up to date resource like this: https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-18-04

2. Install libcurl library:

```
sudo apt install libcurl4-openssl-dev, libzmq3-dev
```

3. Open an R console

4. Install the following packages:

```
install.packages(c('rzmq','repr','IRkernel','IRdisplay'),
                 repos = c('http://irkernel.github.io/', 
                           getOption('repos')), 
                 type = 'source')
```

5. Install the kernel with

```
# user = FALSE will install it at a system level
IRkernel::installspec(user = TRUE)
```

6. Install other dependencies:

```
install.packages("httr")
install.packages("jsonlite")
install.packages("ggplot2")
install.packages('RJSplot')
install.packages('dplyr')
```

Source: http://www.storybench.org/install-r-jupyter-notebook/
Troubleshooting: https://github.com/ramnathv/rCharts/issues/718
