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
// $Id: main.c,v 1.1 2022/02/14 19:54:20 curliq Exp curliq $
//

#include <stdio.h>
#include <string.h>
#include <libgen.h>

#include "curliq.h"

int
main(int argc, char **argv)
{
 int val = 2;

 (void)CURLIQ_environment();

 if ( 3 == argc ) {
     if ( 0 == strcmp("CREATE", basename(argv[0])) ) {
         if ( 0 == CURLIQ_create_object(argv[1], argv[2]) ) {
             val = 0;
         } else {
             printf("%s\n", CURLIQ_error);
         }
     }
 }

 return val;
}

