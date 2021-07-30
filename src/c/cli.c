
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

#include "curliq.h"

// The trim function and comment was written by Adam Rosenfield and posted to
// stackoverflow.com where I copied it verbatim.  --  Matthew Alton

// Note: This function returns a pointer to a substring of the original string.
// If the given string was allocated dynamically, the caller must not overwrite
// that pointer with the returned value, since the original pointer must be
// deallocated using the same allocator with which it was allocated.  The
// return value must NOT be deallocated using free() etc.

static char *trim(char *str)
{
  char *end;

  // Trim leading space
  while(isspace((unsigned char)*str)) str++;

  if(*str == 0)  // All spaces?
    return str;

  // Trim trailing space
  end = str + strlen(str) - 1;
  while(end > str && isspace((unsigned char)*end)) end--;

  // Write new null terminator character
  end[1] = '\0';

  return str;
}

void
cli(void)
{
 char *command = NULL, *str = NULL;

 do {
     command = readline("QCL> ");
     if (NULL == command) {
         printf("\n\n"); break;
     }
     str = trim(command);
     if ( 0 < strlen(str) ) {
         add_history(str);
         lex(command);
     }
 } while(1);

 return;
}

