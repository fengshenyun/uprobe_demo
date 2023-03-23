
uprobe:	
	go build -o uprobe main.go bpf_bpfel_x86.go

generate:
	go generate

bytecode:
	clang -O2 -Wall -D__TARGET_ARCH_x86 -target bpf -S -Iinclude/headers/ -c uprobe.bpf.c -o uprobe.bpf.s


