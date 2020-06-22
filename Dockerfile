# docker build -t my/lfs .
#
# htop() {
# 	docker run --rm -it \
# 		--pid host \
# 		--name htop \
# 		my/htop
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm base-devel python3 && yes | pacman -Scc --noconfirm | pacman -Rsn --noconfirm pacman | rm -rf /var/lib/pacman/sync/*


RUN groupadd -r lfs && useradd -r -s /bin/bash -g lfs lfs
RUN mkdir /tools && chown lfs:lfs /tools

WORKDIR /home/lfs
USER lfs

ENTRYPOINT [ "bash" ]
