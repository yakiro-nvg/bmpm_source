ENTRY(entry_point)

SECTIONS {
    . = 0x40200000;

    .text : {
        *(.text*)
    }
}