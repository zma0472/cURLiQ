
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

static char *gpl = "\n\
Copyright (C) 2021 Matthew Alton\n\
This file is part of cURLiQ.\n\
cURLiQ is free software: you can redistribute it and/or modify\n\
it under the terms of the GNU General Public License as published by\n\
the Free Software Foundation, either version 3 of the License, or\n\
(at your option) any later version.\n\
cURLiQ is distributed in the hope that it will be useful,\n\
but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n\
GNU General Public License for more details.\n\
You should have received a copy of the GNU General Public License\n\
along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.\n\n";


void
copyleft(void)
{
 if ( isatty(STDIN_FILENO) ) {
     printf("%s", gpl);
 }

 return;
}
