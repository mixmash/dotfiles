#!/bin/sh

# user vars
export ME='x0'
export X_UID=10806
export PORT=60806
export HOSTNAME='thirteen'
export ARCH='arm' # arm, x86
# script vars
MYHOME="/home/$ME"
ASME="sudo -u $ME"
PKGARCH=$ARCH

# helper functions
_echo() {
  printf "\n╓───── %s \n╙────────────────────────────────────── ─ ─ \n" "$1";
}

get() {
	f="${3:-notesPlain}"
	op item get "$2" --account "$1" --fields "$f" --format json | jq -rM '.value'
}

getfile() {
	f="${4:-notesPlain}"
	op --account "$1" read "op://$2/$3/$f"
}

account() {
	domain="${3:-my}.1password.com"
	op account add \
		--address "$domain" \
		--email "$2" \
		--shorthand "$1"
}

# add github
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
	chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list >/dev/null

# add 1pw
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | tee /etc/apt/sources.list.d/1password.list >/dev/null
mkdir -p /etc/debsig/policies/AC2D62742012EA22/ &&
	curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 &&
	curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg


# install all the things \o/
_echo "installing packages"
apt update &&
DEBIAN_FRONTEND=noninteractive apt install -y \
	1password-cli \
	apparmor \
	apt-utils \
	autoconf \
	automake \
	awscli \
	bash \
	bash-completion \
	bc \
	bind9-host \
	bsdutils \
	build-essential \
	ca-certificates \
	clamav-base \
	cmake \
	cmatrix \
	coreutils \
	curl \
	dash \
	dbus \
	dbus-user-session \
	debianutils \
	diffutils \
	dnsutils \
	docker.io \
	doxygen \
	dpkg \
	e2fsprogs \
	eslint \
	ethtool \
	expect \
	fail2ban \
	findutils \
	fzf \
	g++ \
	gawk \
	gcc-10-base \
	gcc-9-base \
	gettext \
	gh \
	git \
	golang \
	golang-doc \
	golang-src \
	gpg \
	gpg-agent \
	gpgv \
	gzip \
	htop \
	iptables \
	iputils-ping \
	isc-dhcp-client \
	jq \
	keychain \
	kubernetes-client \
	libncurses5-dev \
	libprotobuf-dev \
	libssl-dev \
	libtool \
	libtool-bin \
	libutempter-dev \
	libx11-dev \
	libxfixes-dev \
	lsb-base \
	lua5.4 \
	luajit \
	luarocks \
	man-db \
	manpages \
	mawk \
	ncurses-base \
	ncurses-bin \
	ncurses-term \
	net-tools \
	netbase \
	ninja-build \
	nmap \
	ocproxy \
	openconnect \
	openssh-client \
	openssh-server \
	openssl \
	pciutils \
	perl \
	perl-base \
	pkg-config \
	protobuf-compiler \
	proxychains4 \
	psmisc \
	python3 \
	python3-boto \
	python3-pip \
	python3-venv \
	resolvconf \
	ripgrep \
	rkhunter \
	rsyslog \
	secure-delete \
	shellcheck \
	silversearcher-ag \
	socat \
	stow \
	sudo \
	tar \
	tcpdump \
	terraform \
	tmux/bullseye-backports \
	toilet \
	traceroute \
	tree \
	tzdata \
	unzip \
	util-linux \
	uuid-runtime \
	vim-tiny \
	vpnc \
	whiptail \
	whois \
	xsel \
	xvfb \
	xz-utils \
	zlib1g \
	zlib1g-dev \
	zsh \
	zsh-syntax-highlighting

_echo "setting up rust"
curl https://sh.rustup.rs -sSf | $ASME CARGO_HOME="$MYHOME/.local/lib/cargo" RUSTUP_HOME="$MYHOME/.local/lib/rustup" sh -s -- -y --default-toolchain stable --profile default &&
$ASME CARGO_HOME="$MYHOME/.local/lib/cargo" RUSTUP_HOME="$MYHOME/.local/lib/rustup" $MYHOME/.local/lib/cargo/bin/cargo install cargo-quickinstall &&
$ASME CARGO_HOME="$MYHOME/.local/lib/cargo" RUSTUP_HOME="$MYHOME/.local/lib/rustup" $MYHOME/.local/lib/cargo/bin/cargo quickinstall lolcat stylua

_echo "setting up starship"
if [[ "$ARCH" == "arm" ]]; then
	curl -sS https://starship.rs/install.sh | sh
else
	$ASME CARGO_HOME="$MYHOME/.local/lib/cargo" RUSTUP_HOME="$MYHOME/.local/lib/rustup" $MYHOME/.local/lib/cargo/bin/cargo quickinstall starship
fi


_echo "building neovim"
if [[ "$ARCH" == "arm" ]]; then
	$ASME git clone --depth=1 https://github.com/neovim/neovim.git -b stable $MYHOME/.local/src/neovim &&
		cd $MYHOME/.local/src/neovim &&
		make CMAKE_BUILD_TYPE=RelWithDebInfo &&
		make install
else
	apt install -y neovim/prebuilt-mpr
fi

# tmux
$ASME mkdir $MYHOME/.config/tmux/plugins &&
	$ASME git clone --depth=1 https://github.com/tmux-plugins/tpm $MYHOME/.config/tmux/plugins/tpm &&
	$ASME $MYHOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh &&
	cd $MYHOME/.config/tmux/plugins/tmux-thumbs &&
		expect -c "spawn ./tmux-thumbs-install.sh; send \"\r1\r\"; expect complete" 1>/dev/null
# nvim
$ASME mkdir $MYHOME/.local/nvim &&
  $ASME git clone --filter=blob:none --single-branch https://github.com/folke/lazy.nvim.git $MYHOME/.local/share/nvim/lazy
$ASME nvim --headless "+Lazy! sync" +qa
$ASME nvim --headless "+MasonInstallAll" +qa

_echo "setting up kubectx"
$ASME git clone --depth=1 https://github.com/ahmetb/kubectx.git $MYHOME/.local/src/kubectx &&
	mv $MYHOME/.local/src/kubectx/kubectx $MYHOME/.local/src/kubectx/kubens $MYHOME/.local/bin/ &&
	chmod +x $MYHOME/.local/bin/kubens $MYHOME/.local/bin/kubectx

_echo "setting up k9s"
$ASME curl -L "https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_${PKGARCH}.tar.gz" -o $MYHOME/.local/src/k9s.tar.gz &&
	tar xzf $MYHOME/.local/src/k9s.tar.gz -C $MYHOME/.local/bin/ k9s &&
	chmod +x $MYHOME/.local/bin/k9s &&
	rm $MYHOME/.local/src/k9s.tar.gz


$ASME npm i -g \
		neovim \
		sofancy

_echo "setting up python + pip"
$ASME pip3 -V
$ASME pip3 install --upgrade pip
$ASME pip3 install --no-warn-script-location \
	boto3 \
	cryptography \
	docutils \
	emoji-fzf \
	greynoise \
	https://github.com/PaulSec/API-dnsdumpster.com/archive/master.zip \
	json-spec \
	mycli \
	neovim \
	pgcli \
	six \
	urllib3 \
	wcwidth