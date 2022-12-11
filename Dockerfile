FROM archlinux:latest

RUN echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy archlinux-keyring && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Su --noconfirm && \
    pacman -S --noconfirm vim xorg adobe-source-han-sans-cn-fonts git fakeroot binutils nss libxss gtk3 alsa-lib pulseaudio fcitx5-gtk && \
    pacman -Scc --noconfirm

ARG USER_ID
RUN env && useradd -m user -u ${USER_ID}

USER user
RUN cd && \
    git clone https://aur.archlinux.org/qqmusic-bin.git && \
    cd qqmusic-bin && \
    makepkg

USER root
RUN pacman --noconfirm -U /home/user/qqmusic-bin/qqmusic-bin-*.pkg.tar.zst

USER user
RUN rm -rf ~/qqmusic-bin
