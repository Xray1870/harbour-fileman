%define appname harbour-fileman-root
Name: %{appname}
Summary: Fileman with root privileges
Version: 1.1
Release: 1
Group: System/Tools
License: GPLv3
Vendor: ichthyosaurus
Packager: ichthyosaurus
Source0: %{name}-%{version}.tar.xz
Provides:      application(%{appname}.desktop)
Requires:      harbour-fileman

%description
Run Fileman with super user privileges.

%prep
%setup -q -n %{name}-%{version}

%build
gcc start-root-helper.c -o start-root
chmod 4755 start-root

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/%appname

for d in "86x86" "108x108" "128x128" "172x172"; do
    mkdir -p "%{buildroot}/usr/share/icons/hicolor/$d/apps"
    cp "icons/$d/"*.png "%{buildroot}/usr/share/icons/hicolor/$d/apps"
done

cp %appname.desktop %{buildroot}/usr/share/applications/
cp start-root start-root-helper.c %{buildroot}/usr/share/%appname/

%files
%attr(0644, root, root) "/usr/share/applications/%appname.desktop"
%attr(0644, root, root) "/usr/share/icons/hicolor/86x86/apps/%appname.png"
%attr(0644, root, root) "/usr/share/icons/hicolor/108x108/apps/%appname.png"
%attr(0644, root, root) "/usr/share/icons/hicolor/128x128/apps/%appname.png"
%attr(0644, root, root) "/usr/share/icons/hicolor/172x172/apps/%appname.png"
%attr(4755, root, root) "/usr/share/%appname/start-root"
%attr(0644, root, root) "/usr/share/%appname/start-root-helper.c"
