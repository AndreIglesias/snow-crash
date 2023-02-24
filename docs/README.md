# SnowCrash

```
	   _____                      _____               _     
	  / ____|                    / ____|             | |    
	 | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
	  \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
	  ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
	 |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
```
## Install resources' dependencies
This script will install every dependency needed to test the resources, it will optionally also create a .env file to store the IP address to not have to type it every time you connect with the `connect.sh` scrpt. 
```bash
./install.sh
```
##### env file
```bash
IP=X.X.X.X
```

## ssh connection
To connect through ssh to a level, run the connect.sh script with the *level number* and *ip address* as parameters.
### Examples
```bash
./connect.sh 02 localhost
./connect.sh 9 10.0.X.X
./connect.sh 3 # With the env file set
```
## Extract a flag level
To extract a flag from a levelXX, run the *flagXX.sh* script in the `levelXX/resources/` directory. It will generate a *flagXX.pwd* file that is the flag's user password to obtain the next password level.
```bash
./flagXX.sh 10.0.X.X
```
