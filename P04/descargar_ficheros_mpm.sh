rm -Rf /tmp/test-mpm/descargas; mkdir -p /tmp/test-mpm/descargas
cd /tmp/test-mpm/descargas
wget http://$1/test-mpm/file1 &
wget http://$1/test-mpm/file2 &
wget http://$1/test-mpm/file3