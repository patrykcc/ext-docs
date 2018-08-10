# Wallet upgrade - Linux

**Warning! If you are running Masternode, you must ensure having updated your wallet and masternode to at least version `1.2.0.0`. If not, rewards after block 50 000 will be lost.**

## Summary
This document is a guide to upgrade a **Exsolution** masternode on a Debian/Ubuntu server, created on Scaleway, and it assume you’re running Windows or Mac.

## Requirements:
* A Linux server already running **Masternode**
* Some basic Linux skills


(If You didn’t started Your first Masternode, please refer to the [Masternode setup guide](./masternodes/deployment_linux/))

# Upgrade process

## Local wallet upgrade
To be able to run masternode `v.1.2.0.0`, You must update Your local wallet.

1. Close Your Linux/Windows wallet and wait until it gracefully shutdown
2. Download new wallet for Your system from [Github](https://github.com/exsolution/ext-wallet/releases)
  - Windows: run setup or extract zip file and replace old **Exsolution-qt.exe** with new one
  - Linux: extract and replace wallet binary
  - Mac: open dmg and replace wallet application

## Masternode upgrade

Login to the server by using PuTTY (Windows) or Terminal (Mac / Linux)

**Note: **If you have created Your Masternode using manual mentioned earlier, then you must become **root**

To check if You’re root, type:
```
whoami
```


If You’re not root type and confirm with Your password
```
sudo -i
```


**Optionally:** You can do some linux updates:
```
apt-get -y update
apt-get -y upgrade
```

* Stop Your masternode:
```
exsolution-cli stop
```
* Get new masternode wallet version:
```
wget https://github.com/exsolution/ext-wallet/releases/download/v1.2.0.0/exsolution-1.2.0-linux64.tar.gz
```
* Unpack wallet file
```
tar -xvf exsolution-1.2.0-linux64.tar.gz
```
* Delete downloaded file:
```
rm exsolution-1.2.0-linux64.tar.gz
```
* Move new version to working dir:
```
sudo mv ./exsolution-1.2.0/bin/exsolution* /usr/local/bin
```
* Start masternode:
```
exsolutiond
```
* Run Your local wallet, unlock it and start _Masternode alias_

* To check Masternode status:
```
/usr/local/bin/exsolution-cli masternode status
```

Note: You can download all versions here: https://github.com/exsolution/ext-wallet/releases
