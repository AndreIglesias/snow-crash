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

## From root user
```bash
for i in {0..14}; do usr=$(printf "flag%0.2d\n" $i); echo -n "$usr: "; su $usr -c "/bin/getflag"; done
flag00: Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias
flag01: Check flag.Here is your token : f2av5il02puano7naaf6adaaf
flag02: Check flag.Here is your token : kooda2puivaav1idi4f57q8iq
flag03: Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
flag04: Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap
flag05: Check flag.Here is your token : viuaaale9huek52boumoomioc
flag06: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub
flag07: Check flag.Here is your token : fiumuikeil55xe9cu4dood66h
flag08: Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f
flag09: Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z
flag10: Check flag.Here is your token : feulo4b72j7edeahuete3no7c
flag11: Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s
flag12: Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr
flag13: Check flag.Here is your token : 2A31L79asukciNyi8uppkEuSx
flag14: Check flag.Here is your token : 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
```