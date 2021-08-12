
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
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "libcurliq.h"

char *
cq_canonify(char **command)
{
 char *tok = NULL, *new = NULL, *cmd = NULL, *end = NULL, *c = NULL;
 enum { START=0, STRING=1, QUOTE=2 } state = START;

 if ( NULL == (new = strdup(*command)) ) {
     return (char *)NULL;
 }

 if ( NULL == (cmd = calloc(1, strlen(*command)+1)) ) {
     free(new); return (char *)NULL;
 }

 for ( end = new; '\0' != *end; end++ ) {
     (void)0;
 }

 while ( (tok = strsep(&new, " \t")) != NULL ) {
     for ( c = tok; '\0' != *c; c++ ) {
         if ( '\'' == *c ) {
             if ( START == state ) {
                 state = STRING;
             } else if ( STRING == state ) {
                 state = QUOTE;
             } else if ( QUOTE == state ) {
                 state = STRING;
             }
         } else {
             *c = toupper(*c);
         }
     }
     if ( 0 != strlen(tok) ) {
         strcat(cmd, tok); strcat(cmd, " ");
     }
 }

 printf("%s  %d\n", cmd, strlen(cmd));

 free(new);

 return (cmd);
}

int
main(void)
{
 char *foo = "  create		 queue foo_q  ";

 (void)cq_canonify(&foo);

 return (0);
}
