# Environment Variables
export ARCHFLAGS="-arch x86_64"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

# Sources
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# System update
function up() {
  sudo apt update -yqq
  sudo apt dist-upgrade -yqq
  sudo apt autoremove -yqq
}
