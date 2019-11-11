
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

#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <limits.h>

#include "curliq.h"

int
args(int argc, char **argv)
{
 int c = 0;
 char *endptr = NULL;

 DBG("args(argc=%d) called", argc);

 while ((c = getopt(argc, argv, "Dd:p:t:l:e:")) != -1) {
     if (NULL == optarg) {
         DBG("c=%c, optarg=(NULL)", c);
     } else {
         DBG("c=%c, optarg=%s", c, optarg);
     }
     switch (c) {
         case 'D': debug = 1; DBG("Set debug=%d", debug);
                   break;
         case 'd': delay = strtoul(optarg, &endptr, 0);
                   DBG("Set delay=%d", delay);
                   if (ULONG_MAX == delay) {
                       ERR("strtoul(\"%s\") returned ULONG_MAX", optarg);
                       DBG("return (%d)", -1);
                       return (-1);
                   } else if ( ('\0' !=  *optarg) &&
                               ('\0' ==  *endptr) ) {
                       if (delay < CPC_DELAY_MIN) {
                           ERR("CPC delay=%d < CPC_DELAY_MIN=%d",
                                                         delay, CPC_DELAY_MIN);
                           DBG("return (%d)", -1);
                           return (-1);
                       } else {
                           DBG("delay=%d OK", delay);
                           break;
                       }
                   } else {
                       ERR("delay=strtoul(\"%s\") FAIL", optarg);
                       DBG("return (%d)", -1);
                       return (-1);
                   }
         case 'p': pidpath = optarg; DBG("Set pidpath=\"%s\"", pidpath);
                   break;
         case 't': tstpath = optarg; DBG("Set tstpath=\"%s\"", tstpath);
                   break;
         case 'l': logpath = optarg; DBG("Set logpath=\"%s\"", logpath);
                   break;
         case 'e': errpath = optarg; DBG("Set errpath=\"%s\"", errpath);
                   break;
         default:  usage();
                   ERR("Invalid option=\"-%c\"", c);
                   DBG("return (%d)", -1);
                   return (-1);
     }
 }
 DBG("return (%d)", 0);
 return (0);
}

