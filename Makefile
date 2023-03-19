.PHONY: run
run: hello
	./hello

hello: main.cpp
	gcc -o hello glad.c main.cpp -I ~/.local/include -lm `pkg-config --libs glfw3` `pkg-config --libs opengl`

.PHONY: clean
clean:
	rm hello

.PHONY: glad
glad:
	glad --generator c --no-loader --out-path output
	cp output/src/glad.c .
	mkdir -p ~/.local/include/glad
	cp output/include/glad/glad.h ~/.local/include/glad
	mkdir -p ~/.local/include/KHR
	cp output/include/KHR/khrplatform.h ~/.local/include/KHR

.PHONY: deps
deps:
	apt install libglfw3-dev
	apt install python3-glad
