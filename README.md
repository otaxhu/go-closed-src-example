# Closed source library example in Go (Golang)

There is 2 branches, the `main` branch where is all of the code available in this repository, and a `closed` branch where is the actual example on how to link a Go object file with the main application

To run this example, you need to run at least once the [`install_std.sh`](/install_std.sh) script file, this script compiles all of the Go's std library to Go's object files to the `$GOROOT/pkg/$GOOS_$GOARCH` path. If `$GOROOT` is outside of `$HOME`, you may need to run it with root priviliges

After running [`install_std.sh`](/install_std.sh), run [build.sh](/build.sh)

## `closed` branch
This branch doesn't contain the directory [`closed_src`](/github.com/otaxhu/closed_src/closed_src) and it's just meant to run [`build.sh`](/build.sh). This branch contains Go's object files to link against the main application

Both branch's `build.sh` generates `build/main` executable
