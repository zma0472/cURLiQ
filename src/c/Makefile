# 
#  Copyright (C) 2021 Matthew Alton
# 
#  This file is part of cURLiQ.
# 
#  cURLiQ is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
# 
#  cURLiQ is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with cURLiQ.  If not, see <http://www.gnu.org/licenses/>.
#

CC       = cc
#CFLAGS   = -g -ansi -Wall
CFLAGS   = -g
#CPPFLAGS = -DDMALLOC
#INCLUDES = -I/opt/include

#LIBS     = -lcurses
#LIBS     = -lcurses -lefence
#LIBINCS  = -L/opt/lib
#LIBINCS  =
#LDFLAGS  =

OBJS     = main.o copyleft.o env.o args.o

HEADERS  = curliq.h

all: curliq

curliq: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LIBINCS) $(LDFLAGS)

$(OBJS): $(HEADERS)

.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(INCLUDES) $<

tags:
	ctags *.[ch]

clean:
	rm -f *.o curliq tags core core.*

