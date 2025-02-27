AR:=ar
CC:=gcc
SRCDIR:=src
DEMDIR:=main
OBJDIR:=build
INCDIR:=include
BINDIR:=bin
EVODIR:=evolution
INDDIR:=individuals
MAPDIR:=fit_map
RESDIR:=results
LIBDIR:=$(BINDIR)

INCS:=$(wildcard $(SRCDIR)/*.h)
OBJS:=$(subst $(SRCDIR)/,$(OBJDIR)/,$(patsubst %.c,%.o,$(wildcard $(SRCDIR)/*.c)))
DEMO_OBJS=$(OBJDIR)/mt19937ar.o $(OBJDIR)/parameters.o $(OBJDIR)/readline.o

CFLAGS:=-std=gnu99 -Wall -pedantic -march=native -O2 -g
IFLAGS:=-I$(INCDIR) -I/usr/include/python2.7
LFLAGS:=-L$(LIBDIR) -lgges -lm  -lpython2.7

INC:=$(SRCDIR)/gges.h $(SRCDIR)/grammar.h $(SRCDIR)/cfggp.h $(SRCDIR)/ge.h \
	$(SRCDIR)/derivation.h $(SRCDIR)/individual.h $(SRCDIR)/mapping.h

LIB:=$(LIBDIR)/libgges.a
BIN:=$(BINDIR)/automaticML

all: $(LIB) $(BIN)

lib: $(LIB)

$(LIBDIR)/libgges.a: $(OBJS) $(INCS)
	@echo Creating library $@ from $^
	@mkdir -p $(BINDIR)
	@$(AR) -r $@ $(OBJS)
	@echo Copying headers to $(INCDIR)
	@mkdir -p $(INCDIR)
	@cp $(INC) $(INCDIR)

$(BINDIR)/automaticML: $(DEMO_OBJS) $(OBJDIR)/automaticML.o $(LIB)
	@echo Linking $@ from $^
	@$(CC) $(CFLAGS) $^ -o $@ $(LFLAGS)

$(OBJDIR)/%.o : $(SRCDIR)/%.c $(INCS)
	@echo Compiling $< into $@
	@mkdir -p $(OBJDIR)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

$(OBJDIR)/%.o : $(DEMDIR)/%.c $(wildcard $(DEMDIR)/*.h) $(INC)
	@echo Compiling $< into $@
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJDIR) $(RESDIR) $(INDDIR) $(MAPDIR) $(EVODIR) $(BINDIR)/automaticML log.txt

nuke: clean
	@rm -rf $(INCDIR) $(BINDIR) $(LIBDIR)

strip: all
	@echo Running strip on $(BIN)
	@strip $(BIN)
