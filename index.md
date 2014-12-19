---
title       : Titanic Survival Explorer
subtitle    : Course Project 
author      :  A. Ph. Clement
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/nvd3]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

The sinking of the RMS Titanic is one of the most infamous shipwrecks in history. 

This application allows you to visualize the survival rate vs a set of biological and socio-economic categorical variables.

The dataset is from the <a href="https://www.kaggle.com/c/titanic-gettingStarted/data" target='_blank'>Titanic Kaggle competition</a>

--- .class #id 

## Categorical variables

You can select two different categorical variables among the following:

- Sex
- Passenger Class
- Age
- Number of Siblings/Spouses Aboard
- Number of Parents/Children Aboard
- Passenger Fare

--- .class #id 

## Example 1

Survival rate vs Sex and Passenger Class variables. 


<div id = 'sample1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawsample1()
    });
    function drawsample1(){  
      var opts = {
 "dom": "sample1",
"width":    600,
"height":    400,
"x": "Sex",
"y": "ratio",
"group": "Pclass",
"type": "multiBarChart",
"id": "sample1" 
},
        data = [
 {
 "Sex": "female",
"Pclass": "1",
"total": 91,
"len": 94,
"ratio": 0.968085106383 
},
{
 "Sex": "female",
"Pclass": "2",
"total": 70,
"len": 76,
"ratio": 0.9210526315789 
},
{
 "Sex": "female",
"Pclass": "3",
"total": 72,
"len": 144,
"ratio":            0.5 
},
{
 "Sex": "male",
"Pclass": "1",
"total": 45,
"len": 122,
"ratio": 0.3688524590164 
},
{
 "Sex": "male",
"Pclass": "2",
"total": 17,
"len": 108,
"ratio": 0.1574074074074 
},
{
 "Sex": "male",
"Pclass": "3",
"total": 47,
"len": 347,
"ratio": 0.135446685879 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

--- .class #id 

## Example 2

Survival rate vs Sex and Passenger Fare variables. 


<div id = 'sample2' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawsample2()
    });
    function drawsample2(){  
      var opts = {
 "dom": "sample2",
"width":    600,
"height":    400,
"x": "Sex",
"y": "ratio",
"group": "FareSlice",
"type": "multiBarChart",
"id": "sample2" 
},
        data = [
 {
 "Sex": "female",
"FareSlice": "[ 0.00,  7.88)",
"total": 26,
"len": 38,
"ratio": 0.6842105263158 
},
{
 "Sex": "female",
"FareSlice": "[ 7.88, 10.52)",
"total": 19,
"len": 36,
"ratio": 0.5277777777778 
},
{
 "Sex": "female",
"FareSlice": "[10.52, 22.02)",
"total": 54,
"len": 77,
"ratio": 0.7012987012987 
},
{
 "Sex": "female",
"FareSlice": "[22.02, 40.12)",
"total": 48,
"len": 70,
"ratio": 0.6857142857143 
},
{
 "Sex": "female",
"FareSlice": "[40.12,512.33]",
"total": 86,
"len": 93,
"ratio": 0.9247311827957 
},
{
 "Sex": "male",
"FareSlice": "[ 0.00,  7.88)",
"total": 13,
"len": 141,
"ratio": 0.09219858156028 
},
{
 "Sex": "male",
"FareSlice": "[ 7.88, 10.52)",
"total": 18,
"len": 148,
"ratio": 0.1216216216216 
},
{
 "Sex": "male",
"FareSlice": "[10.52, 22.02)",
"total": 19,
"len": 95,
"ratio":            0.2 
},
{
 "Sex": "male",
"FareSlice": "[22.02, 40.12)",
"total": 32,
"len": 110,
"ratio": 0.2909090909091 
},
{
 "Sex": "male",
"FareSlice": "[40.12,512.33]",
"total": 27,
"len": 83,
"ratio": 0.3253012048193 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>
