local ret = tio.expect("Hit any key to stop autoboot", 5000)

if (ret ~= nil) then
	tio.write("\n")
	tio.expect("m =>")
	tio.write("setenv bootargs console=ttyGS0,115200 root=/dev/ram0 loglevel=7 uio_pdrv_genirq.of_id=generic-uio earlyprintk\n")
	tio.expect("m =>")
	tio.write("tftpboot 192.168.2.1:fit.itb\n")
	tio.expect("m =>")
	tio.write("bootm 64000000#lan9668_ung8290_0_at_lan966x\n")
else
	io.write("\r\n[tio] Don't found 'Hit any key to stop autoboot'\r\n")
end

