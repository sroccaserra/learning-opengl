SRC=src

.PHONY: run
run: hello
	./hello

hello: src/main.cpp
	gcc -o hello $(SRC)/glad.c $(SRC)/main.cpp -Iinclude -I ~/.local/include -lm `pkg-config --libs glfw3` `pkg-config --libs opengl`

.PHONY: clean
clean:
	rm hello

.PHONY: glad
glad:
	glad --generator c --no-loader --out-path glad_output
	cp glad_output/src/glad.c $(SRC)
	mkdir -p ~/.local/include/glad
	cp glad_output/include/glad/glad.h ~/.local/include/glad
	mkdir -p ~/.local/include/KHR
	cp glad_output/include/KHR/khrplatform.h ~/.local/include/KHR

.PHONY: deps
deps:
	apt install libglfw3-dev
	apt install python3-glad
