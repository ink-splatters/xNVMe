with import <nixpkgs> {} ;
mkShell.override { stdenv = llvmPackages_latest.stdenv ; } {
    name="xnvme";

    nativeBuildInputs = with darwin.apple_sdk.frameworks;[
	clang
	meson
	ninja
	python3
	gnumake
	gitMinimal
	ctags
	CoreFoundation
	IOKit
	pkg-config
	cmake
	spdk
#	libvfn
    ];

    CFLAGS="-mcpu=apple-m1 -O3";
    CXXFLAGS="-mcpu=apple-m1 -O3";

    hardeningDisable=["all"];
}
