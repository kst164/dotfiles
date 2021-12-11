cheat() {
  curl https://cheat.sh/$1
}

hsim() {
  sh ~/code/courses/nand2tetris/tools/HardwareSimulator.sh $1
}

wgup() {
  wg-quick up wg0
}

wgdown() {
  wg-quick down wg0
}
