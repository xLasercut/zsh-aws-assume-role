assume-role-upgrade() {
  local latest_release

  echo "Fetching latest release for: xLasercut/aws-assume-role"

  latest_release=$(curl -s "https://api.github.com/repos/xLasercut/aws-assume-role/releases/latest" | jq -r .tag_name)

  echo "Latest release is: ${latest_release}"

  echo "Downloading assume-role binary"
  curl -L -o "$HOME/.local/bin/__assume_role" "https://github.com/xLasercut/aws-assume-role/releases/download/${latest_release}/assume-role-linux"
  chmod +x "$HOME/.local/bin/__assume_role"
}



if ! command -v __assume_role &>/dev/null; then
  assume-role-upgrade
fi


alias assume-role='function(){ eval $(__assume_role $@); }'

