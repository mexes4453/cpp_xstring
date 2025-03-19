
#=== COLORS ====
COL_Y = "\033[1;32m"
COL_G = "\033[1;33m"
COL_D = "\033[0m"

DIR_PROJECT = $(shell pwd)
DIR_SRC = $(DIR_PROJECT)/src
DIR_OBJ = $(DIR_PROJECT)/obj
DIR_DEP = $(DIR_PROJECT)/dep

SRCS_FILES_CPP:= xstring.cpp
SRCS_FILES_C:= #xpeng.c

OBJ_FILES:= $(SRCS_FILES_CPP:.cpp=.o) $(SRCS_FILES_C:.c=.o)
$(info $(OBJ_FILES))
OBJS := $(patsubst %, $(DIR_OBJ)/%, $(OBJ_FILES))
SRCS_C := $(patsubst %, $(DIR_SRC)/%, $(SRCS_FILES_C))
SRCS_CPP := $(patsubst %, $(DIR_SRC)/%, $(SRCS_FILES_CPP))
#$(info $(OBJ_FILES))
#$(info $(OBJS))


DEP_FILES:= $(OBJS:.o=.d)
DEPS := $(patsubst %, $(DIR_DEP)/%, $(OBJ_FILES))

MSG = 
REP = mexes

NAME = libxstring.a

AR = ar
CC = g++
GCC = gcc
STD = c++17
DEBUG = 
VALGRIND =
VAL =

# FLAGS
CFLAGS = -Werror -Wall -Wextra -g -std=$(STD) 
LIBFLAGS_STATIC = -lz -rcs
#CFLAGS += -D__thread__

DEPSFLAG =: -MM $($@:.o=.d)

# INCLUDE
INCLUDES = -I./ -I./inc 

#=== DEBUG ====
ifeq ($(DEBUG), 1)
	CFLAGS := $(CFLAGS) -g -D_DEBUG_=1
endif

ifeq ($(VALGRIND), 1)
	VAL = valgrind
endif
	

NAME : all
all : $(NAME) 
$(NAME) : $(OBJS) 
	@echo "\033[1;33mCompiling Executables: $(NAME) \033[0m"
	$(AR) $(LIBFLAGS_STATIC) $@ $^
	@echo; echo "\033[1;32mCompilation Successful. \033[0m"
	@echo; echo


-include $(DEPS)

# obj files output
$(DIR_OBJ)/%.o : $(DIR_SRC)/%.cpp
	@mkdir -p $(dir $@) 
	@mkdir -p $(DIR_DEP) 
	@echo
	@echo "\033[1;33mCompiling OBJ files \033[0m"
	$(CC) -c $^ $(CFLAGS) $(INCLUDES) -o $@
	$(CC) -MM $^ $(CFLAGS) -o $*.d
	@mv $*.d $(DIR_DEP)

# obj files output
$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	@mkdir -p $(dir $@) 
	@mkdir -p $(DIR_DEP) 
	@echo
	@echo "\033[1;33mCompiling OBJ files \033[0m"
	$(GCC) -c $^ $(CFLAGS) $(INCLUDES) -o $@
	$(GCC) -MM $^ $(CFLAGS) -o $*.d
	@mv $*.d $(DIR_DEP)
#	@mv *.d $(DIR_DEP)
	@echo




# remove all object files
fclean:
	rm -rf $(DIR_OBJ) $(DIR_DEP) *.map

# remove final target files
clean: fclean
	rm -rf $(NAME)

# recompile everything
re: clean all



# ========== TEST ====================
test:
	@echo
#	@echo $(COL_G)=== TEST === 1 = NO ARGS$(COL_D)
#	@$(VAL) ./$(NAME)
.PHONY : all fclean clean re push test
