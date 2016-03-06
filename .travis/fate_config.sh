if [ "$TRAVIS_OS_NAME" = linux ]; then
  if echo "$CC" | grep -q clang; then
    slot=x86_64-linux-gnu-clang-3.4-travis
  else
    slot=x86_64-linux-gnu-gcc-4.6-travis
  fi
elif [ "$TRAVIS_OS_NAME" = osx ]; then
  slot=x86_64-darwin-clang-apple-6.1-travis
fi
repo=$(pwd)                              # the source repository
branch=master                            # the branch to test
samples=ffmpeg-samples                   # path to samples directory
workdir=$HOME/fate-work                  # directory in which to do all the work
mkdir -p $workdir
fate_recv="ssh -i $HOME/ffmpeg-travis/ssh_key -T fate@fate.ffmpeg.org"  # command to submit report
comment='Travis CI'                      # optional description
build_only=     # set to "yes" for a compile-only instance that skips tests

# the following are optional and map to configure options
arch=
cpu=
cross_prefix=
as=
cc=$CC
ld=
target_os=
sysroot=
target_exec=
target_path=
target_samples=
extra_cflags=
extra_ldflags=
extra_libs=
extra_conf=     # extra configure options not covered above

#make=          # name of GNU make if not 'make'
makeopts=       # extra options passed to 'make'
#tar=           # command to create a tar archive from its arguments on stdout,
                # defaults to 'tar c'
