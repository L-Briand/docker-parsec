# See base-image/image
FROM ubuntu:jammy

# Install Parsec client
RUN <<EOF
apt -q update && apt install -qy wget
wget https://builds.parsec.app/package/parsec-linux.deb -O parsec-linux.deb
apt install -y --install-recommends ./parsec-linux.deb
rm parsec-linux.deb
apt remove -y wget
apt-get -qy autoremove
apt-get clean
rm -r /var/lib/apt/lists/*
EOF

# Setup pulseaudio
COPY pulse-config.conf /etc/pulse/client.conf

# add a parsec user
RUN <<EOF
groupadd --gid 1000 parsec
useradd --gid 1000 --uid 1000 -m parsec
usermod -aG video parsec
mkdir -p /home/parsec/.parsec
chown parsec:parsec /home/parsec/.parsec
EOF

# parsec config
USER parsec
COPY parsec-config.txt /home/parsec/.parsec/config.txt
ENTRYPOINT [ "/usr/bin/parsecd" ]
