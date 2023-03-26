# 
#  Copyright (C) 2022 Matthew Alton
# 
#  This file is part of cURLiQ.
# 
#  cURLiQ is free software: you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation, either version 3 of the License, or (at your option) any later
#  version.
#  
#  cURLiQ is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
#  details.
# 
#  You should have received a copy of the GNU General Public License along with
#  cURLiQ. If not, see <https://www.gnu.org/licenses/>.
# 
#  $Id: Makefile,v 1.1 2022/02/14 19:54:20 curliq Exp curliq $
# 

#CC=cc
CC=clang
CFLAGS=-g

HEADERS = curliq.h

OBJS = alter.o copying.o create.o daemon.o drop.o env.o help.o list.o main.o \
	pragma.o send.o util.o version.o watch.o

BINS = cqcli


all:  $(BINS)

cqcli: $(OBJS) $(HEADERS)
	$(CC) -o $@ $(OBJS)

links:
	rm -f ALTER CREATE DROP HELP LIST PRAGMA WATCH 2>&1
	ln cqcli ALTER 2>&1
	ln cqcli CREATE 2>&1
	ln cqcli DROP 2>&1
	ln cqcli HELP 2>&1
	ln cqcli LIST 2>&1
	ln cqcli PRAGMA 2>&1
	ln cqcli WATCH 2>&1

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

tags:
	ctags *.[ch]

clean:
	rm -f core tags $(OBJS) $(BINS)
	rm -f ALTER CREATE DROP HELP LIST PRAGMA WATCH

