
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

void
copyleft(void)
{
 if ( !isatty(STDIN_FILENO) ) {
     return;
 }

 printf("\nCopyright (C) 2021 Matthew Alton\n");
 printf("This file is part of cURLiQ.\n");
 printf("cURLiQ is free software: you can redistribute it and/or modify\n");
 printf(
     "it under the terms of the GNU General Public License as published by\n");
 printf("the Free Software Foundation, either version 3 of the License, or\n");
 printf("(at your option) any later version.\n");
 printf("cURLiQ is distributed in the hope that it will be useful,\n");
 printf("but WITHOUT ANY WARRANTY; without even the implied warranty of\n");
 printf("MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n");
 printf("GNU General Public License for more details.\n");
 printf("You should have received a copy of the GNU General Public License\n");
 printf("along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.\n\n");

 return;
}
