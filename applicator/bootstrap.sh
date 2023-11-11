#!/bin/sh
set -x
set -e

mktmpdir() {
	mktemp -d ${TMPDIR:-/tmp}/${1:-tmp}.XXXXXXXXXX
}
TMPDIR=$(mktmpdir agshoes) || exit 1

# dnf update -y
dnf install oracle-epel-release-el8
dnf config-manager --set-enabled ol8_developer_EPEL
# oracle-epel-release-el8


dnf install -y -v \
	git \
	tmux \
	mosh

firewall-cmd \
	--permanent \
	--zone=public \
	--add-service=mosh
firewall-cmd --reload

if [ -x /usr/src/github.com/josephholsten/agshoes ]; then
	if [ ! -x /usr/src/github.com/josephholsten/agshoes/.git ]; then
		echo "/usr/src/github.com/josephholsten/agshoes doesn't seem to be a sane repo. Check it out"
		exit 1
	fi
else
	mkdir -p /usr/src/github.com/josephholsten
	git clone https://github.com/josephholsten/agshoes.git /usr/src/github.com/josephholsten/agshoes/
fi

wget -O - https://linux.dropbox.com/packages/dropbox.py > dropbox.py
chmod +x dropbox.py
# wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" > "${TMPDIR}/dropbox-x86_64.tgz"a
# tar vxzf "${TMPDIR}/dropbox-x86_64.tgz"


if ! grep fs.inotify.max_user_watches=100000 /etc/sysctl.conf; then
	echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf
	sysctl -p	
fi
