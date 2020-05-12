# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

# compiler to use
CC = nasm

LINKER = ld

BUILD := build
CHAPTERS := ${addprefix ${BUILD}/,chapter7 chapter8}
FILES := chapter7/Project1 chapter7/Project2 chapter7/Project3 chapter7/Project4 chapter7/Project5 chapter7/Project6 chapter7/Project7 chapter7/Project8 chapter7/Project9 chapter8/Project1
SRCS := $(addprefix ${BUILD}/,$(addsuffix .asm,${FILES}))
GDBS := $(addprefix gdb/,${FILES})

.PHONY = all clean ${GDBS}

all: ${SRCS}

${BUILD}/%.asm: %.o
	@echo "Linking.."
	${LINKER} -g -m elf_x86_64 -o ${BUILD}/$* ${BUILD}/$*.o

%.o: %.asm
	@echo "Creating object.."
	${CC} -g -F dwarf -f elf64 -o ${BUILD}/$@ $<

${SRCS}: | ${CHAPTERS}

${CHAPTERS}:
	@echo "Creating build folder.."
	mkdir -p $@

# Run the Program
${FILES}:
	./build/$@

# Run gdb commands
${GDBS}:
	gdb <$@.txt ${BUILD}/$(subst gdb/,,$@)

clean:
	@echo "Cleaning up..."
	rm -rvf ${BUILD}/
