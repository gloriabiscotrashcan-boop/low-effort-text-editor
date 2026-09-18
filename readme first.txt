For linux executables:
since it's cross-compiled under windows, and windows filesystem 
doesn't have executable flags, do this in linux :

1.Grant Executable Permission:Linux Terminal.
Open a terminal on your Linux machine, navigate to the folder containing your compiled binary, and run:

chmod +x notepad(lnx)

Use ls -l to see if the file permissions include x (e.g., -rwxr-xr-x).

2.Run the Application:Linux Terminal.
Execute the program from the terminal by typing:

./notepad(lnx)

