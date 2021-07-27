
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

static char *usage = "\n  Usage:  curliq [-h] [-d directory]\n\n";

void
args(int argc, char **argv)
{
 int ch = -1;

 while ((ch = getopt(argc, argv, "hd:")) != -1) {
     switch (ch) {
         case 'h':   printf("%s", usage); exit(0);
                     break;

         case 'd':   curliq_home = optarg;
                     break;

         default :   printf("%s", usage); exit(2);
                     break;
     }
 }

 return;
}
