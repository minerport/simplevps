// SimpleBank masternode tutorial using "NODEMASTER" scrypt \\\

// all Credit goes to https://github.com/masternodes \\\

// Thanks to him for the great work \\\
____________________________________________________________
____________________________________________________________


Requires :

- one Ubuntu 16.04 or 18.04 vps

- Simple Qt wallet on local machine (Windows, OSX or Ubuntu Desktop)

- Mobaterm or Putty + sftp client




____________________________________________________________
____________________________________________________________


1 . Open QT wallet and create a new receiving address


1.1 . Send exactly 2000 SPLB on this address, in one time. Now wait for 15 confirmation.


1.2 . Open debug console and type the following commands
```
masternode genkey
masternode outputs
```
- Edit your masternode.conf file and copy/paste
```
mn1 <<ip:port>> <<masternode genkey result>> <<masternode outputs tx>> <<masternode outputs index>>
```
example : mn1 80.56.75.45:34445 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg 2bcd3c84c84f87eaa86e4e56834c92927a07f9e18718810b92e0d0324456a67c 0

Save changes

- Now go to settings and activate masternodes tab and advanced coin management


Quit & Restart QT wallet   


____________________________________________________________
____________________________________________________________


2 . Open remote SSH entry with terminal (mobaxterm or putty) and connect to VPS


2.1 . commands (copy paste in terminal)


```bash
sudo su // you need to be connected as root to run the script
git clone https://github.com/Simplebankdev/simplevps
cd simplevps
chmod +x * -R
./simple_install.sh
```


- It will ask for "masternode genkey" result. 

example : 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg
It will ask you to check if VPS IP is correct.


scrypt will proceed until end (approximately 15 minutes).


Note :

=>  All configuration files are in: /etc/masternodes

=>  All Data directories are in: /var/lib/masternodes


____________________________________________________________
____________________________________________________________

3 . Start masternode


Go back to QT wallet on local machine, and go to masternode tabs, you should see your masternode.

Select it and click start alias.

Message should appear saying : "masternode succesfully started".


____________________________________________________________
____________________________________________________________
