# ███    ███  █████  ██   ██ ███████ ███████ ██ ██      ███████ 
# ████  ████ ██   ██ ██  ██  ██      ██      ██ ██      ██      
# ██ ████ ██ ███████ █████   █████   █████   ██ ██      █████   
# ██  ██  ██ ██   ██ ██  ██  ██      ██      ██ ██      ██      
# ██      ██ ██   ██ ██   ██ ███████ ██      ██ ███████ ███████

NAME        = test
PRINT_NAME  = Build
PRINT_PREFIX= \033[1m\033[38;5;240m[\033[0m\033[38;5;250m$(PRINT_NAME)\033[1m\033[38;5;240m] \033[38;5;105m~\033[0m

SRC_DIR     = 	srcs
ASM_SRC     = 	ft_strlen.s \
				ft_strcmp.s \
				ft_strcpy.s \

C_SRC       = main.c
ASM_SRC     := $(addprefix $(SRC_DIR)/, $(ASM_SRC))
C_SRC       := $(addprefix $(SRC_DIR)/, $(C_SRC))
OBJ_DIR     = obj


ASM_COMPILER = nasm
ASM_FLAGS   = -f elf64
CC          = gcc
LINKER      = gcc


# Common Flags
CFLAGS      = -Wall -Wextra -Werror -fsanitize=address -g3
LINK_FLAGS  = -o $(NAME) -fsanitize=address

# Object files
ASM_OBJ     = $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(ASM_SRC))
C_OBJ       = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(C_SRC))
OBJS        = $(ASM_OBJ) $(C_OBJ)

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS)
	@printf "$(PRINT_PREFIX)\033[0;38;5;226m Linking \033[0m["
	@for i in $(shell seq 1 10); do \
		sleep 0.1; \
		printf "\033[38;5;40m▲▼"; \
	done
	@printf "\033[38;5;40m] \033[0m\n"
	@$(LINKER) $(LINK_FLAGS) $(OBJS)
	@echo "$(PRINT_PREFIX)\033[0;32m Done \033[0;32m\n"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@$(ASM_COMPILER) $(ASM_FLAGS) -o $@ $<

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "$(PRINT_PREFIX)\033[0;38;5;226m Cleaning \033[0m\n"
	@rm -rf $(OBJ_DIR)
	@echo "$(PRINT_PREFIX)\033[0;32m Done \033[0;32m\n"

fclean: clean
	@rm -f $(NAME)

re: fclean all

run: all clean
	./$(NAME)

.PHONY: all clean fclean re run
