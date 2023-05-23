

for file in ./inputs/*.snek; do
    cargo run -- $file.snek inputs/$file.s
    nasm -f elf64 ./inputs/$file.s -o ./inputs/$file.o
    ar rcs ./inputs/lib$file.a ./inputs/$file.o
    rustc -L ./inputs/ -lour_code:$file ./runtime/start.rs -o ./inputs/$file.run
    cat ./inputs/$file.s
    ./inputs/$file.run

