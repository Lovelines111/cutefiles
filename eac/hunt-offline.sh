#!bash
protontricks --command='wine reg add "HKEY_CURRENT_USER\\Software\\Wine\\Explorer" /v Desktop /t REG_SZ /d "Default" /f' 594650
protontricks --command='wine reg add "HKEY_CURRENT_USER\\Software\\Wine\\Explorer\\Desktops" /v Default /t REG_SZ /d "1920x1080" /f' 594650
zsh -ic eacoff
steam steam://rungameid/594650

