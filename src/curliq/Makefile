
CC=gcc
CFLAGS=-g

HEADERS = log.h curliq.h
OBJS = args.o daemon.o env.o main.o usage.o version.o

BINS = curliq

all: $(BINS)

curliq: $(OBJS) $(HEADERS)
	$(CC) -o $@ $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<
clean:
	rm -f core *.o $(BINS)

