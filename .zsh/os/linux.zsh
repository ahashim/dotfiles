# Environment Variables
export ARCHFLAGS="-arch x86_64"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"


# PATH
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"
export INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"

# System update
function up() {
  sudo apt update -yqq
  sudo apt dist-upgrade -yqq
  sudo apt autoremove -yqq
}
