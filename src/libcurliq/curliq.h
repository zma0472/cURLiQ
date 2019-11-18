
/*  Copyright (C) 2007,2019 by Matthew Alton  */

/*
 *  This file is part of cURLiQ.
 *
 *  cURLiQ is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  cURLiQ is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#if !defined(_CURLIQ_H)

#include <sys/types.h>

#include "log.h"

/*
 *  Default global settings.
 */

#if !defined(CURLIQ_DEFAULT_DEBUG)
#define CURLIQ_DEFAULT_DEBUG 0
#endif  /*  !defined(CURLIQ_DEFAULT_DEBUG) */

#define CURLIQ_VERSION_MAJOR 0
#define CURLIQ_VERSION_MINOR 0
#define CURLIQ_VERSION_PATCH 0

/*  Global variables.  */

extern char *syster_release;
extern char *copyleft;

extern char *pidpath;
extern char *logpath;
extern char *errpath;
extern char *dbgpath;

/*  Function declarations.  */

extern int   args(int argc, char **argv);
extern int   env(void);
extern int   background(void);
extern void  version(void);
extern void  usage(void);
extern int   signals(void);
extern int   streams(void);
extern int   signals(void);

#endif  /*  !defined(_CURLIQ_H)  */
