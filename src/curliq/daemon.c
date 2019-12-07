

/*  Copyright (C) 2019 by Matthew Alton  */

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

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "log.h"

int
streams(void)
{
 long  fdmax = sysconf(_SC_OPEN_MAX), i = -1;

 DBGV("Closing %d file descriptors excluding %d, %d, %d",
                            fdmax, STDIN_FILENO, STDOUT_FILENO, STDERR_FILENO);
 for (i = 0; i < fdmax; i++) {
     if ( (STDIN_FILENO  != i)  &&
          (STDOUT_FILENO != i)  &&
          (STDERR_FILENO != i) ) {
         (void)close(i);
     }
 }
 if (NULL == freopen("/dev/null", "r", stdin)) {
     ERR("freopen(path=/dev/null, mode=r, stream=stdin) FAIL"); return (-1);
 } else {
     DBG("freopen(path=/dev/null, mode=r, stream=stdin) OK");
 }
 if (NULL == freopen(logpath, "a", stdout)) {
     ERRV("freopen(path=%s, mode=a, stream=stdout) FAIL", logpath);
     return (-1);
 } else {
     DBGV("freopen(path=%s, mode=a, stream=stdout) OK", logpath);
 }
 if (NULL == freopen(errpath, "a", stderr)) {
     ERRV("freopen(path=%s, mode=a, stream=stderr) FAIL", errpath);
     return (-1);
 } else {
     DBGV("freopen(path=%s, mode=a, stream=stderr) OK", errpath);
 }
 DBG("return(0)"); return (0);
}

int
background(void)
{
 pid_t pid   = -1;

 DBG("background() called");

 DBG("First fork() ...");
 if ((pid = fork()) < (pid_t)0) {
     ERR("fork() FAIL"); return (-1);
 }
 if (0 != pid) {
     DBG("_exit(0)"); _exit(0);
 }
 if (setsid() < (pid_t)0) {
     ERR("setsid() FAIL"); return (-1);
 }
 DBG("Second fork() ...");
 if ((pid = fork()) < (pid_t)0) {
     ERR("fork() FAIL"); return (-1);
 }
 if (0 != pid) {
     DBG("_exit(%d)", 0);
     _exit(0);
 }
 if (chdir("/") < 0) {
     ERR("chdir(path=/) FAIL"); return (-1);
 }
 DBG("chdir(/) OK");
 DBG("umask(022)"); (void)umask(022);
 DBG("return(0)"); return (0);
}

