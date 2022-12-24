exec = a22
src = $(wildcard src/*.c)
obj = $(src:.c=.o)
flags = -g -Wall -lm -ldl -fPIC -rdynamic

$(exec): $(obj)
	gcc $(obj) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install:
	sudo cp a22 /usr/bin/a22

clean:
	rm a22 
	rm src/*.o