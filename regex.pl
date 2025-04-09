s~%global\s+goipath\s+(.*)/(.*)~%global goihead \2\n%global goipath \1/%{goihead}\n%define debug_package %{nil}~g;
s~(Version:)\s*([^0-9\.]*)([0-9\.]*)([^\s]*)\s*~\1  \3\n%define oldver \2\3\4\n~g;
s~(^%gometa.*)~%{?!tag:%{?!commit:%global tag v%{oldver}}}\n\1\n~g;
s~%gocheck~~g;
s~%{_bindir}/wireguard-go~%{_bindir}/*~g;
s~%gobuild -o %{gobuilddir}/bin/wireguard-go %{goipath}~mkdir examples~g;
s~(%build.*)~\1\nrm version.go~g;
s~Source:.*~%define stag %{?tag}%{?!tag:%commit}\nSource: https://%{goipath}/archive/%{stag}/%{goihead}-%{stag}.tar.gz~g;
