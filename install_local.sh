mkdir -p "$HOME/.local/share/icons/hicolor/512x512/apps/"
mkdir -p "$HOME/.local/share/applications/"
mkdir -p "$HOME/.local/bin"

cp "desktop/parsec.png" "$HOME/.local/share/icons/hicolor/512x512/apps/"
cp "desktop/parsec.desktop" "$HOME/.local/share/applications/"

if [ -L "$HOME/.local/bin/parsec" ] ; then rm "$HOME/.local/bin/parsec" ; fi
ln -s "$(pwd)/parsec" "$HOME/.local/bin"