
/*
 * Copyright (C) 2019 Matthew Alton
 *
 * This file is part of cURLiQ.
 *
 * cURLiQ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cURLiQ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdint.h>

#include <readline/readline.h>
#include <readline/history.h>

#include "cqcli.h"

uint8_t interactive_session = 1;

int
command(int argc, char **argv)
{
 char *line = NULL, *prompt = NULL;

 if ( interactive_session ) {
     prompt = "QCL> "; copyright();
 }

 for (;;) {
     if ( NULL == (line = readline(prompt)) ) {
         if ( interactive_session ) {
             printf("\nEND SESSION\n\n");
         }
         break;
     } else if ( *line && interactive_session ) {
         add_history(line);
     }
 }

 exit(0);
}

