
.PHONY: debug release

debug:
	cargo build

release:
	RUSTFLAGS="-C codegen-units=1 -C code-model=kernel" cargo build --release --verbose
