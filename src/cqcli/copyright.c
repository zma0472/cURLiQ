
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

#include "cqcli.h"

void
copyright(void)
{
 if ( isatty(STDIN_FILENO) ) {
     printf("\n  cURLiQ Command Line Interface v.%d.%d.%d\n",
                                               CURLIQ_VERSION_MAJOR,
                                               CURLIQ_VERSION_MINOR,
                                               CURLIQ_VERSION_PATCH);
     printf("  Copyright (C) 2019 Matthew Alton\n");
     printf("  License GPLv3+: GNU GPL version 3 or later ");
     printf("<http://gnu.org/licenses/gpl.html>\n");
     printf("  This is free software: ");
     printf("you are free to change and redistribute it.\n");
     printf("  There is NO WARRANTY, to the extent permitted by law.\n\n");
 }
 return;
}

