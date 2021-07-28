
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

#ifndef _CURLIQ_H

#define _CURLIQ_H 1

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <readline/readline.h>
#include <ncurses.h>
#include <readline/history.h>

#define CURLIQ_VERSION_MAJOR 0
#define CURLIQ_VERSION_MINOR 0
#define CURLIQ_VERSION_PATCH 0

#define CURLIQ_HOME_DEFAULT "/opt/curliq"

extern char *curliq_home;

extern void env(void);
extern void copyleft(void);
extern void cli(void);
extern void args(int argc, char **argv);

#endif // !defined _CURLIQ_H
