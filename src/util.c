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
#include <string.h>
#include <ctype.h>

#include "curliq.h"

char CURLIQ_error[4096];

int
CURLIQ_valid_object_type(const char *type)
{
 int val = -1;

 if ( (0 == strcmp(type, "QUEUE"))         ||
      (0 == strcmp(type, "QUEUE_GROUP"))   ||
      (0 == strcmp(type, "BOX"))           ||
      (0 == strcmp(type, "TARGET"))        ||
      (0 == strcmp(type, "TARGET_GROUP"))  ||
      (0 == strcmp(type, "TRIGGER"))       ||
      (0 == strcmp(type, "TRIGGER_GROUP")) ) {
     val = 0;
 } else {
     (void)strcpy(CURLIQ_error, "Invalid object type");
 }

 return val;
}

int
CURLIQ_valid_object_name(const char *name)
{
 const char *c = NULL;
 int val = -1;

 if ( strlen(name) > CURLIQ_MAX_OBJECT_NAME_LEN ) {
     (void)strcpy(CURLIQ_error, "Invalid object name length.");
 } else {
     if ( isupper(*name) ) {
         for ( c = name; '\0' != *c; c++ ) {
             if ( (isupper(*c)) || ('_' == *c) || (isdigit(*c)) ) {
                 continue;
             } else {
                 (void)strcpy(CURLIQ_error, "Invalid object name.");
                 break;
             }
         }
         val = 0;
     }
 }

 return val;
}

