# Alt Linux Sisyphus
> Настройки системы после установки по материалам https://plafon.gitbook.io/alt-zero
1. Yandex ставить из пакета `epmi yandex-browser-preinstall`
1. Папки пользователя на английском:   
   1.1. Исправить наименования в файле `~/.config/user-dirs.dirs`   
   1.2. Перезайти в систему
1. Nvidia драйвера `sudo epm play switch-to-nvidia`
1. Утилита управления и разгона видеокарты Nvidia `epmi gwe`
1. Установить менеджер расширений Gnome `epmi gnome-extension-manager`
   1. Мои расширения:
      - AppIndicator and Kstatus
      - Vitals
      - Just Perfection
      - Dash2dock
      - Status Area Horizontal Spacing
1. Управление устройствами Logitech `epmi solaar`
   1. Установить расширение Gnome Solaar
   1. Настройка автозапуска:
      1. Скопировать solaar.desktop в папку автозапуска: `cp /usr/share/applications/solaar.desktop ~/.config/autostart/`
      1. Открыть скопированный файл и скорректировать параметры запуска: `Exec=solaar -w hide -b solaar`     
