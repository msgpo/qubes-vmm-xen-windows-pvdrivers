Name:	    qubes-core-dom0-pvdrivers-win7	
Version:	0.1
Release:	1
Summary:	PV Drivers for Vista and Windows 7 VMs
Group:		Qubes
License:    GPL

%define _builddir %(pwd)

%description
PV Drivers for Vista and Windows 7 VMs.

%install
mkdir -p $RPM_BUILD_ROOT/usr/lib/qubes/
cp winpvdrivers.iso $RPM_BUILD_ROOT/usr/lib/qubes/

%files
/usr/lib/qubes/winpvdrivers.iso



%changelog
