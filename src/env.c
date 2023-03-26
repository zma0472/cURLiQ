//
// Copyright (C) 2022 Matthew Alton
//
// This file is part of cURLiQ.
//
// cURLiQ is free software: you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
// 
// cURLiQ is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// cURLiQ. If not, see <https://www.gnu.org/licenses/>.
//
// $Id: env.c,v 1.1 2022/02/14 19:54:20 curliq Exp curliq $
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "curliq.h"

char *CURLIQ_home = CURLIQ_DEFAULT_HOME ;
int CURLIQ_debug = CURLIQ_DEFAULT_DEBUG ;

int
CURLIQ_environment(void)
{
 char *home = NULL, *debug = NULL;
 int val = 0;

 if ( NULL != (home = getenv("CURLIQ_HOME")) ) {
     if ( '/' == *home ) {
         CURLIQ_home = home;
     } else {
         val = 2;
     }
 }

 if ( NULL != (debug = getenv("CURLIQ_DEBUG")) ) {
     if ( 0 == strcmp(debug, "0") ) {
         CURLIQ_debug = 0;
     } else if ( 0 == strcmp(debug, "1") ) {
         CURLIQ_debug = 1;
     } else {
         val = 2;
     }
 }

 return val;
}

