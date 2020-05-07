# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

# compiler to use
CC = nasm

LINKER = ld

BUILD := build
FILES := chapter7/Project1 chapter7/Project2 chapter7/Project3 chapter7/Project4 chapter7/Project5 chapter7/Project6 chapter7/Project7
SRCS := $(addprefix ${BUILD}/,$(addsuffix .asm,${FILES}))
BINS := Project1 Project2 Project3 Project4 # This needs to change
GDBS := $(addprefix gdb/,${FILES})

.PHONY = all clean ${GDBS}

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
