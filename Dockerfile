FROM fedora:38

RUN dnf install -y nodejs docker lorax wget ostree ostree-devel rpm-ostree git hfsplus-tools flatpak flatpak-builder dbus dbus-daemon rpmdevtools make mock selinux-policy python3-pip jq @development-tools gcc cairo-devel python3-devel python3-aiohttp python3-tenacity python3-gobject 'pkgconfig(gobject-introspection-1.0)' 'pkgconfig(cairo-gobject)' 'dnf-command(config-manager)'
RUN dnf config-manager --add-repo='https://raw.githubusercontent.com/terrapkg/subatomic-repos/main/terra38.repo'
RUN dnf -y install melody vala-lint-nightly

RUN dnf clean all
RUN rm -rf /var/cache/yum

RUN pip3 install --no-cache-dir ostree-push yq
