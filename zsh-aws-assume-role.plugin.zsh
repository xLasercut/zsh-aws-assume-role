assume-role-upgrade() {
  echo "Downloading assume-role binary"
  curl -L -o "$HOME/.local/bin/__assume_role" "https://github.com/xLasercut/aws-assume-role/releases/latest/download/assume-role-linux"
  chmod +x "$HOME/.local/bin/__assume_role"
}



if ! command -v __assume_role &>/dev/null; then
  assume-role-upgrade
fi


alias assume-role='function(){ eval $(__assume_role $@); }'

