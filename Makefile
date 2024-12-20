# ███    ███  █████  ██   ██ ███████ ███████ ██ ██      ███████ 
# ████  ████ ██   ██ ██  ██  ██      ██      ██ ██      ██      
# ██ ████ ██ ███████ █████   █████   █████   ██ ██      █████   
# ██  ██  ██ ██   ██ ██  ██  ██      ██      ██ ██      ██      
# ██      ██ ██   ██ ██   ██ ███████ ██      ██ ███████ ███████

NAME        = test
LIB_NAME    = libasm.a
PRINT_NAME  = Build
PRINT_PREFIX= \033[1m\033[38;5;240m[\033[0m\033[38;5;250m$(PRINT_NAME)\033[1m\033[38;5;240m] \033[38;5;105m~\033[0m

LIB_DIR = inc
LIB = $(LIB_DIR)/$(LIB_NAME)

SRC_DIR     = srcs
ASM_SRC     = ft_strlen.s \
             ft_strcmp.s \
             ft_strcpy.s \
             ft_write.s \
			 ft_read.s \
			 ft_strdup.s \

C_SRC       = main.c
ASM_SRC     := $(addprefix $(SRC_DIR)/, $(ASM_SRC))
C_SRC       := $(addprefix $(SRC_DIR)/, $(C_SRC))
OBJ_DIR     = obj

ASM_COMPILER = nasm
ASM_FLAGS   = -f elf64
CC          = gcc
LINKER      = gcc

# Common Flags
CFLAGS      = -Wall -Wextra -Werror -g3 -I$(LIB_DIR) -fsanitize=address
LINK_FLAGS  = -o $(NAME) -fsanitize=address

# Object files
ASM_OBJ     = $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(ASM_SRC))
C_OBJ       = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(C_SRC))
OBJS        = $(ASM_OBJ) $(C_OBJ)

all: $(NAME)

$(NAME): $(OBJ_DIR) $(LIB) $(OBJS)
	@printf "$(PRINT_PREFIX)\033[0;38;5;226m Linking \033[0m["
	@for i in $(shell seq 1 10); do \
		sleep 0.1; \
		printf "\033[38;5;40m▲▼"; \
	done
	@printf "\033[38;5;40m] \033[0m\n"
	@$(LINKER) $(LINK_FLAGS) $(OBJS) $(LIB)
	@echo "$(PRINT_PREFIX)\033[0;32m Done \033[0;32m\n"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

# Compile assembly source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@$(ASM_COMPILER) $(ASM_FLAGS) -o $@ $<

# Compile C source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@

# Create static library (libasm.a)
$(LIB): $(ASM_OBJ)
	@ar rcs $(LIB) $(ASM_OBJ)
	@echo "$(PRINT_PREFIX)\033[0;38;5;226m Static Library $(LIB_NAME) created\033[0m"

# Clean up object files and the static library
clean:
	@echo "$(PRINT_PREFIX)\033[0;38;5;226m Cleaning \033[0m\n"
	@rm -rf $(OBJ_DIR)
	@echo "$(PRINT_PREFIX)\033[0;32m Done \033[0;32m\n"

# Clean everything (including the static library)
fclean: clean
	@rm -f $(NAME) $(LIB)

# Rebuild everything
re: fclean all

# Run the program
run: all clean
	./$(NAME)

.PHONY: all clean fclean re run
