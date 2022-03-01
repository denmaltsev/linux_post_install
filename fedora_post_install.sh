#!/bin/bash

# По материалам видео: https://www.youtube.com/watch?v=eHCrFVWZl1E&list=PLHLPqSsXqjvVmWE63h09fHQmIrOxryBnO&index=1
# Установка диагностических утилит
sudo dnf -y install neofetch inxi neofetch htop

# Проверка драйверов видеокарты
neofetch; inxi -G; inxi -A; stat /

# обновляем систему
sudo dnf update

# устанавливаем проприетарные драйвера nvidia
sudo dnf -y install akmod-nvidia

# подключение репозитория flatpack
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# установить пакеты "Расширение" и "Доп. настройки" и выполнить настройки 

# установить утилиту контроля видеокарты от nwidia
sudo dnf install gwe
