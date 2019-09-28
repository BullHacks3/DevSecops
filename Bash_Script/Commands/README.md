#### Commands Reference Linux ###

1. dd :- Utility for copying files or entire partitions at the bit level
	1.1 Used to clone or delete entire disks or partitions
	1.2 Can backup and restore the MBR(Master Boot Record)
	a. Example :-
	i) dd if=/dev/zero of=/tmp/swpex bs=1M count=50
         Creates a file named /tmp/swpex with 50 blocks of zeroes that are one megabyte in size
