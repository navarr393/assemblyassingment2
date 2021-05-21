// # Author name: David Navarro
// # Program title: Quadratic Formula
// # Course number: CPSC 240-01

//****************************************************************************************************************************
//Program name: "Quadratic Formula".  This program demonstrates the input of three float numbers and creates a quadratic     *
//formula, then calculates the roots.
//This file will show the roots of the formula entered, depending if the formula has one, two, or zero roots.                                                                                       *
//Copyright (C) 2021 David Navarro.                                                                                          *
//                                                                                                                           *
//This file is part of the software program "Quadratic Formula".                                                             *
//Quadratic formula is free software: you can redistribute it and/or modify it under the terms of the GNU General            *
//Public License                                                                                                             *
//version 3 as published by the Free Software Foundation.                                                                    *
//Quadratic formula is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied    *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************
//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//Author name: David Navarro
//Author email: navarrod253@csu.fullerton.edu
//
//Program information
//  Program name: Quadratic Formula
//  Programming languages: One module in C, two modules in c++, and one module in X86
//  Date program began: Feb-20-2021
//  Date of last update: Feb-28-2021
//  Date of reorganization of comments: Feb-28-2021
//  Files in this program: second_degree.c, quadratic.asm, isfloat.cpp, quadlibrary.cpp, run.sh
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//This file
//   File name: quadlibrary.cpp
//   Language: C++
//   Max page width: 54 columns
//   Assemble: gcc -c -Wall -m64 -no-pie -o quadlibrary.o quadlibrary.cpp -std=c++17
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iomanip>

extern "C" void show_no_root() {
    std::cout << std::setprecision(12) << "This function has no roots\n";
}
extern "C" void show_one_root(double root) {
    std::cout << std::setprecision(12) << "The root is: " << root <<"\n";
}
extern "C" void show_two_root(double root1, double root2) {
    std::cout << std::setprecision(12) << "The roots are: " << root1 << " and " << root2 << "\n";
}
