
for filename in ./inputs/*.snek; do
    file=$(basename $filename .snek)
    cargo run -- ./inputs/$file.snek ./inputs/$file.s
    nasm -f elf64 ./inputs/$file.s -o ./inputs/$file.o
    ar rcs ./inputs/lib$file.a ./inputs/$file.o
    rustc -L ./inputs/ -lour_code:$file ./runtime/start.rs -o ./inputs/$file.run
    cat ./inputs/$file.snek
    ./inputs/$file.run
done

rm -f tests/*.a tests/*.s tests/*.run tests/*.o
