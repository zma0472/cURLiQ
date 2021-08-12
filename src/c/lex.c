
//
//  Copyright (C) 2021 Matthew Alton
//
//  This file is part of cURLiQ.
//
//  cURLiQ is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  cURLiQ is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
//

#include <stdio.h>
#include <ctype.h>

#include "curliq.h"

#define LL_START     0
#define LL_CMD       1
#define LL_FLOAT     2
#define LL_TOKEN     3
#define LL_STRING    4
#define LL_QUOTE     5
#define LL_COMMENT   6
#define LL_INTEGER   7


void
lex(char *command)
{
 char *c = NULL, *start = NULL;
 unsigned int ll_state = LL_START;

 for (c = command; NULL != c; c++) {
     if ( LL_START == ll_state ) {
         if (isspace(*c)) {
             continue;
         } else if ( ('_' == *c ) || ( isalpha(*c) ) ) {
             ll_state = LL_TOKEN;
             start = c;
         } else if ( '\'' == *c ) {
             ll_state = LL_STRING;
             start = c;
         } else if ( '#' == *c ) {
             ll_state = LL_COMMENT;
         } else if ( (isdigit(*c)) || ('-' == *c ) ) {
             ll_state = LL_INTEGER;
             start = c;
         }
     } else if ( LL_TOKEN == ll_state ) {
         if ( ('_' == *c) || isalnum(*c) ) {
             continue;
         } else if ( isspace(*c) ) {
             ll_state = LL_START;
         } 
     }
 }

 return;
}

