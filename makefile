#
# makefile for application preconsole's program
#
#

.SUFFIXES:.o
.SUFFIXES:.c
.SUFFIXES:.cpp

.c.o:
	$(GCC) -c $< $(CFLAG) $(INCDIR)  

.cpp.o:
	$(GPLUS) -c $< $(CFLAG) $(INCDIR)  


SYBASEDIR=
INCDIRS=
LIBDIRS=
CFLAGS=
SYBLIBS=
SYSLIBS=-pthread -leXosip2 -losip2  -losipparser2 -lresolv

LIBS=$(PROJECTLIBS) $(SYBLIBS) $(SYSLIBS) 

GCC    	= gcc 
GPLUS  	= g++ 

INCDIR=$(INCDIRS)
LIBDIR=$(LIBDIRS)
CFLAG=$(CFLAGS)

PROJECTLIBS=

all:uac uas

uac: uac.o
	@echo Compiling the program $@
	$(GPLUS) $(INCDIRS) -o uac uac.o $(LIBDIR) $(LIBS)
	@echo "---$@ compiling done."
#	@mv $@ $(WORK_DIR)/bin
	@rm uac.o

uas: uas.o
	@echo Compiling the program $@
	$(GPLUS) $(INCDIRS) -o uas uas.o $(LIBDIR) $(LIBS)
	@echo "---$@ compiling done."
#	@mv $@ $(WORK_DIR)/bin
	@rm uas.o
