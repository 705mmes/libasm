# Variables
NAME = test
ASM_SRC = example.s
ASM_OBJ = example.o

# Compiler and flags
ASM_COMPILER = nasm
ASM_FLAGS = -f macho64

# Linking
LINKER = ld
LINK_FLAGS = -macos_version_min 10.7.0 -e _start -lSystem -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -o $(NAME)

# Rules
all: $(NAME)

$(NAME): $(ASM_OBJ)
	$(LINKER) $(LINK_FLAGS) $(ASM_OBJ)

$(ASM_OBJ): $(ASM_SRC)
	$(ASM_COMPILER) $(ASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

clean:
	rm -f $(ASM_OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
