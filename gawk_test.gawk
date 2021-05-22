BEGIN{ print	"\t\t\t systeminfo \t\t\t"
		FS=":"
       print	"\tUserID\t\t\t\tShell Type"}
     {print "\t" $1"\t\t\t\t"$6}

