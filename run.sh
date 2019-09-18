qemu-system-aarch64 \
    -M virt,gic_version=3 -M virtualization=true -cpu cortex-a53 -smp 4 -M type=virt -m 4096M \
    -chardev socket,id=qemu-monitor,host=localhost,port=7777,server,nowait,telnet -mon qemu-monitor,mode=readline \
    -kernel bmpm.bin -nographic -no-reboot -s
