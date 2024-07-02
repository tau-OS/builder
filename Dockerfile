FROM registry.fedoraproject.org/fedora-minimal:40

RUN dnf5 up -y
RUN dnf5 install -y nodejs docker xorg-x11-server-Xvfb lorax wget ostree ostree-devel rpm-ostree git hfsplus-tools flatpak flatpak-builder dbus dbus-daemon rpmdevtools make mock selinux-policy python3-pip jq @development-tools gcc cairo-devel python3-devel python3-aiohttp python3-tenacity python3-gobject 'pkgconfig(gobject-introspection-1.0)' 'pkgconfig(cairo-gobject)' clang-devel
RUN dnf5 install -y --repofrompath 'terra,https://repos.fyralabs.com/terra40' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra40/key.asc' terra-release
RUN dnf5 -y install melody vala-lint-nightly libhelium-devel

RUN dnf5 clean all

RUN pip3 install --no-cache-dir yq

RUN curl https://raw.githubusercontent.com/flatpak/flat-manager/master/flat-manager-client -o /usr/bin/flat-manager-client
RUN chmod +x /usr/bin/flat-manager-client
