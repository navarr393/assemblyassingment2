// # Author name: David Navarro
// # Program title: Quadratic Formula
// # Course number: CPSC 240-01

//****************************************************************************************************************************
//Program name: "Quadratic Formula".  This program demonstrates the input of three float numbers and creates a quadratic     *
//formula, then calculates the roots                                                                                        *
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
//   File name: second_degree.c
//   Language: C.
//   Max page width: 54 columns
//   Assemble: gcc -c -Wall -m64 -no-pie -o Second_degree.o Second_degree.c -std=c11


#include <stdio.h>
#include <stdint.h>

extern double Quadratic(); //name in asm label (ex. global start)

int main()
{
   double result_code = 1.0;
    
 printf("Welcome to Root Calculator\nProgrammed by David Navarro, Professional Programmer.\n");
    result_code = Quadratic();
 printf("The main driver received this number %0.12lf and will keep it.\n", result_code);
 printf("Now 0 will be returned to the operating system. Have a nice day. Bye.\n");
 return 0;
}