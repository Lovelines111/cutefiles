#!bash
protontricks --command='wine reg add "HKEY_CURRENT_USER\\Software\\Wine\\Explorer" /v Desktop /t REG_SZ /d "Default" /f' 594650
protontricks --command='wine reg add "HKEY_CURRENT_USER\\Software\\Wine\\Explorer\\Desktops" /v Default /t REG_SZ /d "1024x768" /f' 594650
zsh -c eacoff
steam steam://rungameid/594650
