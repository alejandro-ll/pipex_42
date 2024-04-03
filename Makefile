#SETUP
NAME		=	pipex
CC			=	gcc
FLAGS		=	-Wall -Wextra -Werror
RM			=	rm -rf
AR			=	ar crs

#FILES AND PATH
HEADER_SRCS	=	pipex.h
HEADER_DIR	=	principal/
HEADER		=	$(addprefix $(HEADER_DIR), $(HEADER_SRCS))

OBJS_DIR	=	objs/

MPATH_SRCS	=	pipex.c			\
				make_childs.c	\
				error.c			\
				process_free.c
MPATH_DIR	=	principal/
MPATH		=	$(addprefix $(MPATH_DIR), $(MPATH_SRCS))
OBJ_M		=	$(addprefix $(OBJS_DIR), $(MPATH_SRCS:.c=.o))

FUNC_SRCS	=	ft_strncmp.c	\
				ft_strdup.c		\
				ft_split.c		\
				ft_strjoin.c	\
				ft_strlen.c
FUNC_DIR	=	functions/
FUNC		=	$(addprefix $(FUNC_DIR), $(FUNC_SRCS))
OBJ_F		=	$(addprefix $(OBJS_DIR), $(FUNC_SRCS:.c=.o))

#COMMANDS
$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

$(OBJS_DIR)%.o: $(MPATH_DIR)%.c $(HEADER) Makefile | $(OBJS_DIR)
	$(CC) $(FLAGS) -c $< -o $@

$(OBJS_DIR)%.o: $(FUNC_DIR)%.c $(HEADER) Makefile | $(OBJS_DIR)
	$(CC) $(FLAGS) -c $< -o $@

$(NAME): $(OBJ_F) $(OBJ_M)
	$(AR) $(NAME) $(OBJ_F) $(OBJ_M)

all: $(NAME)

clean:
	$(RM) $(OBJ_M) $(OBJ_F)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re

#COLORS
RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
DEFAULT = \033[0m