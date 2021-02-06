mkdir /tmp/test-mpm/; rm -Rf /tmp/test-mpm/*
dd if=/dev/zero of=/tmp/test-mpm/file1 count=1 bs=300M
cd /tmp/test-mpm/; cp file1 file2; cp file1 file3
