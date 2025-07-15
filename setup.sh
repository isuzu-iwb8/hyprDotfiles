sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm \
	sddm kitty zsh ttf-hack-nerd ttf-jetbrains-mono-nerd rofi swaybg waybar \
	+ grim slurp nwg-dock-hyprland swaync plymouth \
	networkmanager bluez bluez-utils blueman \
	brightnessctl pipewire wireplumber pavucontrol pamixer \
	fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5 \
dolphin nautilus unrar \
htop btop nvtop \
neovim nano ranger ueberzug fzf ark \
firefox vlc

#splash theme
sudo mkdir /usr/share/plymouth/themes/prts
sudo cp -rf animated-boot.script prts.plymouth img /usr/share/plymouth/themes/prts/
sudo plymouth-set-default-theme prts
mkinitcpio -P

#sddm theme
sudo pacman -S sddm qt6 qt6-svg qt6-virtualkeyboard qt6-multimedia qt6-multimedia-ffmpeg
sudo cp -rf ./etc/sddm.conf /etc/sddm.
sudo cp -r ./sddm-astronaut-theme/Fonts/* /usr/share/fonts/conf
sudo cp -rf ./sddm-astronaut-theme /usr/share/sddm/themes/


# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
cp ./.zshrc $HOME

#swaync theme "im lazy puttin it to ~/.config"
sudo cp ./etc/xdg/swaync /etc/xdg

#dot-folder at ~/
cp -r ./.config $HOME
cp -r ./.local $HOME

cd $HOME

mkdir Pictures 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S --noconfirm swaylock-effects cava
yay -S --noconfirm microsoft-edge-stable-bin code-git docker

#ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable sddm
sudo systemctl enable docker

sudo pacman -S os-prober
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Installation complete. The system will now reboot."
sudo reboot
#
