
/*
 * Copyright (C) 2011,2012,2019 Matthew Alton
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

void
usage(void)
{
 printf("\n  Usage:\n"
        "    curliq [-h | --help]     Print usage message and exit.\n"
        "    curliq [-v | --version]  Print cURLiQ version and exit. \n\n"
        "    curliq [-c pathname | --config=pathname]\n"
        "           [-D          | --debug]\n"
        "           [-d          | --dbname=dbname]\n"
        "           [-h hostname | --host=hostname]\n"
        "           [-L filename | --log-file=filename]\n"
        "           [-p port     | --port=port]\n"
        "           [-U username | --username=username]\n\n");
 return;
}

