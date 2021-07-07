
#!/bin/bash

# updates the rust nightly channel

set -ex

update_toolchain() {
    local tf=$(mktemp)
    rustup update nightly 2>&1 | tee $tf

    if cat $tf | grep -q 'nightly.*unchanged'; then
        rm $tf
        exit 0
    fi

    rm $tf
}

rebuild_packages() {
    # Cargo Plugins
    cargo install \
    cargo-audit \
    cargo-bloat \
    cargo-cache \
    cargo-check \
    cargo-clone \
    cargo-deny \
    cargo-edit \
    cargo-expand \
    cargo-geiger \
    cargo-license \
    cargo-modules \
    cargo-outdated \
    cargo-watch \
    cargo-update

    # Utils and clones of common tools
    cargo install \
    bat           `# pretty cat` \
    choose        `# cut and (sometimes) awk` \
    cw            `# wc clone` \
    exa           `# fancy ls` \
    fd-find       `# modern find` \
    git-delta     `# diff clone` \
    procs         `# ps clone` \
    rargs		  `# xargs and awk type tool` \
    ripgrep       `# modern grep, rg` \
    rm-improved   `# modern grep, rip` \
    runiq         `# uniq clone` \
    sd            `# sed clone` \
    tokei         `# Fast Line Count` \
    xcp           `# cp clone`

    # Directory and Disk Usage Stats
    cargo install \
    du-dust       `# du clone` \
    dutree        `# du clone`

    # Additional Tools
    cargo install \
    bandwhich       `# bandwidth monitor` \
    battop          `# Battery Top` \
    broot           `# interactive tree` \
    genact          `# activity generator` \
    grex            `# regex builder` \
    hyperfine       `# Benchmarking` \
    mdbook          `# write books in MD` \
    mdcat           `# cat for markdown` \
    miniserve       `# Mini HTTP server` \
    pastel          `# Get color info in your terminal` \
    starship        `# shell prompt` \
    strace-analyzer `# strace commands and view the log: strace-analyzer strace_log` \
    tealdeer        `# man clone, command is tldr` \
    toast           `# Build using Docker` \
    topgrade        `# upgrade everything` \
    ttdl            `# todo list` \
    xcompress       `# Compression utility`

    # Data handling
    cargo install \
    jql           `# json handling` \
    xsv           `# csv handling`

    tldr --update
}

main() {
    update_toolchain
    rebuild_packages
}

main
