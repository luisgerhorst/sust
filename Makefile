.PHONY: all clean

all: test.log

clean:
	env -C ebpf/cgroup-skb-egress-ringbuf cargo clean
	make -C kernel/linux mrproper

test.log: Makefile test.sh
	./test.sh 2>&1 \
		| sed 's|$(PWD)|ANONYMOUS|g' \
		| sed 's|$(shell realpath --relative-to / $(PWD))|ANONYMOUS|g' \
		| sed 's|$(HOME)|ANONYMOUS|g' \
		| sed 's|$(shell realpath --relative-to / $(HOME))|ANONYMOUS|g' \
		| sed 's|$(shell hostname --long)|ANONYMOUS|g' \
		| sed 's|$(USER)|ANONYMOUS|g' \
		| sed 's|$(shell id -u)|ANONYMOUS|g' \
		| sed 's|$(NAME)|ANONYMOUS|g' \
		| sed 's|$(EMAIL)|ANONYMOUS|g' \
		| sed 's|$(shell hostname -s)|ANONYMOUS|g' \
		| tee $@
