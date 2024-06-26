set -e

while true; do
  echo "Which device do you want to rebuild?"
  echo "1. laptop"
  echo "2. home_ploki"
  read -p $'\e[1;32mEnter your choice(number): \e[0m' -r device

  case $device in
  1)
    sudo nixos-rebuild switch --flake .#laptop
    break
    ;;
  2)
    home-manager switch --flake .#ploki
    break
    ;;
  *)
    echo "Invalid choice, please try again."
    ;;
  esac
done
