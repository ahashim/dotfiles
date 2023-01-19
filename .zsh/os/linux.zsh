# Environment Variables
export ARCHFLAGS="-arch x86_64"

# System update
function up() {
  sudo apt update -yqq
  sudo apt dist-upgrade -yqq
  sudo apt autoremove -yqq
}
