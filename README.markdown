# Css-Tut

## Intro

My attempt at learning CSS3.
Following FreeCodeCamp's CSS Tutorial - Zero to Hero (Complete Course) on youtube.

## Usage

* Load the system
```
(progn 
	  (ql:quickload :css-tut)
	  (use-package :css-tut))
```

* Start the webserver
`(css-tut:httpd-up :port <80>)`

`:PORT` is optional and defaults to 80

## Installation

System mostly depends on `:ASERVE`, `:WEBACTIONS` & `:LASS`. 
