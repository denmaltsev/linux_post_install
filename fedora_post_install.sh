#!/bin/bash

# настройки git
git config --global user.email "denmaltsev@gmail.com"
git config --global user.name "Denis Maltsev"

# По материалам видео: https://www.youtube.com/watch?v=eHCrFVWZl1E&list=PLHLPqSsXqjvVmWE63h09fHQmIrOxryBnO&index=1
# Установка диагностических утилит
sudo dnf -y install neofetch inxi neofetch htop

# Double commander
sudo dnf copr enable vondruch/doublecmd
sudo dnf install doublecmd-gtk

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

# установка видео кодеков @see: https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
# 1. добавление репозиториев
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# 2. устанавливаем мультимедиа кодеки
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# монтирование HDD 
sudo -s
mkdir /mtn/data
chmod 777 /mnt/data

echo "# Secondary Hard Drive" >> /etc/fstab
echo "/dev/sdb /mnt/data ext4 defaults,noatime 0 2" >> /etc/fstab


# установка докера
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

# включение возможности управления докером простым пользователем
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
newgrp docker

# проверка работы докера
docker run hello-world

