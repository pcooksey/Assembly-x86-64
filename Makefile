# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

# compiler to use
CC = nasm

LINKER = ld

BUILD := build
SRCS := $(addprefix ${BUILD}/,chapter7/Project1.asm chapter7/Project2.asm)
BINS := Project1 Project2
GDBS := $(addprefix gdb/,chapter7/Project1 chapter7/Project2)

.PHONY = all clean gdb/${GDBS}

all: ${SRCS}

${BUILD}/%.asm: %.o
	@echo "Linking.."
	${LINKER} -g -m elf_x86_64 -o ${BUILD}/$(*F) ${BUILD}/$(*F).o

%.o: %.asm
	@echo "Creating object.."
	${CC} -g -F dwarf -f elf64 -o ${BUILD}/$(*F).o $<

${SRCS}: | ${BUILD}

${BUILD}:
	@echo "Creating build folder.."
	mkdir -p build

# Run the Program
${BINS}:
	./build/$@

# Run gdb commands
${GDBS}:
	gdb <$@.txt ${BUILD}/$(@F)

clean:
	@echo "Cleaning up..."
	rm -rvf ${BUILD}/
