# graalvm based dev toolbox

<pre>
                       grep                 readlink
addr2line              groff                realpath
alias                  grops                rebuild-images
appletviewer           grotty               red
ar                     groups               repoclosure
arch                   gsettings            repodiff
as                     gsoelim              repo-graph
awk                    gss-client           repomanage
base64                 gtar                 repoquery
basename               gtbl                 repo-rss
bash                   gtroff               reposync
bashbug                gu                   repotrack
bashbug-64             gunzip               reset
bg                     gzexe                rm
c++                    gzip                 rmdir
c89                    head                 rmic
c99                    hostid               rmid
ca-legacy              hsdb                 rmiregistry
captoinfo              iconv                rpcgen
cat                    id                   rpm
catchsegv              idlj                 rpm2cpio
cc                     idn                  rpmdb
cd                     igawk                rpmkeys
certutil               info                 rpmquery
c++filt                infocmp              rpmverify
chage                  infokey              runcon
chardetect             infotocap            rvi
chcon                  install              rview
chgrp                  jar                  schemagen
chmod                  jarsigner            sdiff
chown                  java                 sed
cksum                  javac                seq
clear                  javadoc              serialver
clhsdb                 javah                servertool
cmp                    javap                setup-nsssysinit
cmsutil                java-rmi.cgi         setup-nsssysinit.sh
comm                   jcmd                 sg
command                jconsole             sh
compile_et             jdb                  sha1sum
cp                     jdeps                sha224sum
cpio                   jhat                 sha256sum
cpp                    jinfo                sha384sum
crlutil                jjs                  sha512sum
csplit                 jmap                 show-changed-rco
curl                   jobs                 show-installed
curl-config            join                 shred
cut                    jps                  shuf
date                   jrunscript           signver
db_archive             js                   sim_client
db_checkpoint          jsadebugd            size
db_deadlock            jstack               sleep
db_dump                jstat                soelim
db_dump185             jstatd               sort
db_hotbackup           jvisualvm            sotruss
db_load                keytool              split
db_log_verify          krb5-config          sprof
db_printlog            lastlog              sqlite3
db_recover             ld                   ssltap
db_replicate           ld.bfd               stat
db_stat                ldd                  stdbuf
db_tuner               ld.gold              strings
db_upgrade             less                 strip
db_verify              lessecho             stty
dd                     lesskey              sum
debuginfo-install      lesspipe.sh          sync
df                     link                 tabs
dgawk                  lli                  tac
diff                   ln                   tail
diff3                  locale               tar
dir                    localedef            tbl
dircolors              logname              tee
dirname                ls                   test
du                     lua                  testgdbm
dwp                    luac                 tic
echo                   make                 timeout
ed                     makedb               tnameserv
egrep                  md5sum               toe
elfedit                mkdir                touch
env                    mkfifo               tput
eqn                    mknod                tr
ex                     mktemp               troff
expand                 modutil              true
expr                   mv                   truncate
extcheck               native2ascii         trust
f95                    native-image         tset
factor                 ncurses5-config      tsort
false                  ncursesw5-config     tty
fc                     needs-restarting     tzselect
fc-cache               neqn                 umask
fc-cache-64            newgidmap            unalias
fc-cat                 newgrp               uname
fc-conflist            newuidmap            unexpand
fc-list                nice                 uniq
fc-match               nl                   unlink
fc-pattern             nm                   unpack200
fc-query               node                 update-ca-trust
fc-scan                nohup                update-mime-database
fc-validate            npm                  urlgrabber
fg                     nproc                users
fgrep                  npx                  uuclient
file                   nroff                vdir
find                   nss-policy-check     verifytree
find-repos-of-install  numfmt               vi
fmt                    objcopy              view
fold                   objdump              wait
g++                    od                   watchgnupg
gapplication           oldfind              wc
gawk                   ol_yum_configure.sh  which
gcc                    openssl              who
gcc-ar                 orbd                 whoami
gcc-nm                 p11-kit              wsgen
gcc-ranlib             pack200              wsimport
gcov                   package-cleanup      x86_64-redhat-linux-c++
gdbus                  paste                x86_64-redhat-linux-g++
gencat                 pathchk              x86_64-redhat-linux-gcc
geqn                   pcre-config          xargs
getconf                pgawk                xjc
getent                 pic                  xmlcatalog
getopts                pinentry             xmllint
gfortran               pinentry-curses      xmlwf
gio                    pinky                yes
gio-querymodules-64    pk12util             yum
glib-compile-schemas   pkg-config           yum-builddep
gmake                  pldd                 yum-config-manager
gneqn                  policytool           yum-debug-dump
gnroff                 polyglot             yum-debug-restore
gpasswd                post-grohtml         yumdownloader
gpg                    pr                   yum-groups-manager
gpg2                   preconv              zcat
gpg-agent              pre-grohtml          zcmp
gpgconf                printenv             zdiff
gpg-connect-agent      printf               zegrep
gpg-error              ptx                  zfgrep
gpgparsemail           pwd                  zforce
gpgsplit               pydoc                zgrep
gpgv                   python               zless
gpgv2                  python2              zmore
gpg-zip                python2.7            znew
gpic                   ranlib               zsoelim
gprof                  read
graalpython            readelf
</pre>


# BASE IMAGE: https://hub.docker.com/r/oracle/graalvm-ce/dockerfile
```bash
# LICENSE UPL 1.0
#
# Copyright (c) 2015 Oracle and/or its affiliates. All rights reserved.
#

FROM oraclelinux:7-slim

# Note: If you are behind a web proxy, set the build variables for the build:
#       E.g.:  docker build --build-arg "https_proxy=..." --build-arg "http_proxy=..." --build-arg "no_proxy=..." ...

ARG GRAAL_VERSION=1.0.0-rc16
ENV LANG=en_US.UTF-8

ENV GRAALVM_PKG=https://github.com/oracle/graal/releases/download/vm-$GRAAL_VERSION/graalvm-ce-$GRAAL_VERSION-linux-amd64.tar.gz \
    JAVA_HOME=/opt/graalvm-ce-$GRAAL_VERSION/ \
    PATH=$PATH:/opt/rh/llvm-toolset-7/root/usr/bin \
    LD_LIBRARY_PATH=/opt/rh/llvm-toolset-7/root/usr/lib64 \
    MANPATH=/opt/rh/llvm-toolset-7/root/usr/share/man \
    PKG_CONFIG_PATH=/opt/rh/llvm-toolset-7/root/usr/lib64/pkgconfig \
    PYTHONPATH=/opt/rh/llvm-toolset-7/root/usr/lib/python2.7/site-packages \
    X_SCLS=llvm-toolset-7

RUN yum update -y oraclelinux-release-el7 \
    && yum install -y oraclelinux-developer-release-el7 oracle-softwarecollection-release-el7 \
    && yum-config-manager --enable ol7_developer \
    && yum-config-manager --enable ol7_developer_EPEL \
    && yum-config-manager --enable ol7_optional_latest \
    && yum-config-manager --enable ol7_software_collections \
    && yum install -y bzip2-devel ed gcc gcc-c++ gcc-gfortran gzip file fontconfig less libcurl-devel make openssl openssl-devel readline-devel tar vi which xz-devel zlib-devel \
    && yum install -y glibc-static libcxx libcxx-devel llvm-toolset-7 zlib-static \
    && rm -rf /var/cache/yum

RUN fc-cache -f -v

ADD gu-wrapper.sh /usr/local/bin/gu

RUN set -eux \
    && curl --fail --silent --location --retry 3 ${GRAALVM_PKG} \
    | gunzip | tar x -C /opt/ \

    # Set alternative links
    && mkdir -p "/usr/java" \
    && ln -sfT "$JAVA_HOME" /usr/java/default \
    && ln -sfT "$JAVA_HOME" /usr/java/latest \
    && for bin in "$JAVA_HOME/bin/"*; do \
        base="$(basename "$bin")"; \
        [ ! -e "/usr/bin/$base" ]; \
        alternatives --install "/usr/bin/$base" "$base" "$bin" 20000; \
    done \

    && chmod +x /usr/local/bin/gu

CMD java -version
```
