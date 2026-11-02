.PHONY: build release

build: 
	cargo build

release:
	RUSTFLAGS="-C codegen-units=1 -C code-model=kernel" cargo build --release --verbose
	strip target/release/simeis-server
