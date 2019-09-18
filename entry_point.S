.global entry_point

entry_point:
    ldr x0, =0xcafebabe // load 0xcafebabe to x0
    b .                 // infinity loop