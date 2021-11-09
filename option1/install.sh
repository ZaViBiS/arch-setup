#/bin/sh
yes | sudo pacman -Suy; # Полное обновление системы

yes | sudo pacman -S xf86-video-intel wget git mpv; # видео драйвера для intel и не только

# Установка темы otis
git clone https://github.com/EliverLara/Otis.git;
sudo mv Otis /usr/share/themes/;
gsettings set org.gnome.desktop.interface gtk-theme "Otis";
# Установка темы Flat-Remix-Blue-Dark
git clone https://github.com/daniruiz/flat-remix.git;
sudo mv flat-remix/Flat-Remix-Blue-Dark /usr/share/themes/;
rm -rf flat-remix;
gsettings set org.gnome.desktop.wm.preferences theme "Flat-Remix-Blue-Dark";

# Установка значков
wget https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MzYyMDE4MDQiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImMwZTBjMmFhMzJlZmJlZTcwMDEzNGY2NThmMzU5YWEwYjc1YzNjYjYzYWViMDRmYTMxZjVlNzYwZjE3NGRlOTlmYjgxZDIzMTk0Mjk0M2RhNjViMTk3NjFjYjljZWZlZTRkZTE2NjgyNWM3Njg2MzI1ZGViMGQ4NmE4NzljNjQ1IiwidCI6MTYzNjQ5NTM4MSwic3RmcCI6IjE3YWRkY2UyNDM1ZmNhMTJjZWFmYzQxYzcwMTYwNjMwIiwic3RpcCI6IjQ2Ljk4LjE0Mi4zMiJ9.nA4TVPRL3oLPwpm4cvjP5AjM037cZCXGrxkZDiPGSss/Ayru.zip;
unzip Ayru;
mkdir /home/$USER/.icons;
mv  Ayru/ /home/$USER/.icons/;
gsettings set org.gnome.desktop.interface icon-theme "Ayru";   # set the icon t>
gsettings set org.gnome.desktop.interface cursor-theme "Ayru"; # or the cursor >
rm -rf Ayru.zip;

# Установка snap
git clone https://aur.archlinux.org/snapd.git;
cd snapd;
yes | makepkg -sicr;
sudo systemctl enable --now snapd.socket;
sudo ln -s /var/lib/snapd/snap /snap;
cd ..;rm -rf snapd;

# Установка программ через snap
sudo snap install code --classic;   # visual studio code
sudo snap install telegram-desktop; # telegram

# gnome tweaks
yes | sudo pacman -S gnome-tweaks;

# Установка zsh
yes | sudo pacman -S zsh;
# yes | sudo pacman -S wget; # это нужно для установки oh my zsh
# Установка шрифта для корректного отаброжения символов
git clone https://aur.archlinux.org/font-symbola.git;
cd font-symbola;
yes | makepkg -sicr;
cd ..;rm -rf font-symbola;

#Установка oh-my-zsh и настройка терминала
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)";
chsh -s /bin/zsh;

# установка google chrome
git clone https://aur.archlinux.org/google-chrome.git;
cd google-chrome;
yes | makepkg -sicr; # Сборка и установка google chrome
cd ..;rm -rf google-chrome;

# Установка gotop
git clone https://aur.archlinux.org/gotop.git;
cd gotop;
yes | makepkg -sicr;
cd ..;rm -rf gotop;
