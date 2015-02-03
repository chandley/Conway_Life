
# Conway_Life

[![Test Coverage](https://codeclimate.com/github/chandley/Conway_Life/badges/coverage.svg)](https://codeclimate.com/github/chandley/Conway_Life)
[![Code Climate](https://codeclimate.com/github/chandley/Conway_Life/badges/gpa.svg)](https://codeclimate.com/github/chandley/Conway_Life)

## Summary

A simple implementation of Conway's classic game of life

### Problem

In a grid of square cells, each cell interacts with its eight neighbours. At each step in time, the following transitions occur:

* Any live cell with fewer than two live neighbours dies, as if caused by under-population.
* Any live cell with two or three live neighbours lives on to the next generation.
* Any live cell with more than three live neighbours dies, as if by overcrowding.
* Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

### Languages/Platforms/Tools

| Languages | Technologies  | Testing Frameworks| Misc
| :-------------------------------------------- |:--------------|:-----------|:----|
| Ruby      |               | none            |               |
|           |               |                   |               |
|           |               |                   |  
|           |               |

### Solution

* Cell knows if it is alive or dead, and which are neighbouring cells
* Board populates cells and neighbours, calculates next generation, handles display
* Game sets board size, handles generations

### Setup
```
ruby life.rb
```
### Tests

### Images
```
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|0|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|0|0|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|0|0|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
-------------------------------
```
### To do

* Methods are too long
* Should have separate generation, display class

### Learning points

* Ruby array methods
* Control flow


