cheat() {
  curl https://cheat.sh/$1
}

hsim() {
  sh ~/code/courses/nand2tetris/tools/HardwareSimulator.sh $1
}

# college vpn
wgup() {
  wg-quick up wg0
}

wgdown() {
  wg-quick down wg0
}

# get myself to stop using vi, use vim or nvim instead
vi() {
  echo "NO"
  return 1
}
