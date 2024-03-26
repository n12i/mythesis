CC=	cc
CFLAGS=	-xtarget=ultra

SRCS=	shori.c
OBJS=	shori.o
LIBS=	

all: shori
shori: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f *.o shori core *~

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
