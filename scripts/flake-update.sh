function trap_ctrlc {
  echo "Ctrl-C caught...exiting."
  exit 1
}
trap "trap_ctrlc" 2

nix flake update
