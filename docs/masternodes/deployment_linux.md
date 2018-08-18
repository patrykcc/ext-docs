## Summary

This document is a guide to setup a `Exsolution` masternode on a `Debian/Ubuntu` server, created on `Scaleway`, and it assume you’re running Windows or Mac.
Requirements:

- A server running Linux
- A static IP address
- Basic `Linux` skills some errors could be encountered
- :warning: Be really careful with security, you MUST follow the security steps if you don’t want to loose anything

:dollar: The average monthly cost of the masternode is around `USD` 4 (on `Scaleway`)

## Prerequisites
### SSH configuration
- Windows
  - Download and install PuTTY for your platform
  - Run the PuTTYgen utility at `C:\Program Files\PuTTY\puttygen.exe`
  - At the bottom, in the `Type of key` to generate section, select `RSA`
  - Click the `Generate`
  - Move the mouse pointer around in the blank area of the `Key` section as prompted while the key is being generated
  - Once complete, add email address to the key comment field to help identify the key
  - Optional: enter a passphrase in the `Key` passphrase field. If the passphrase left blank, you will be able to use the private key for logging in without entering a passphrase. If you enter a passphrase, you will need both the private key and the passphrase each time you log in
  - Click `Save public key` and save the key somewhere safe on your computer
  - Click Save private key and save the key somewhere safe on your computer – it can be the same place as the public key. Remember to keep the private key secure. If you lose it, you won’t be able to log in to your server


- Mac / Linux
  - From the Terminal, run this command to create a key pair:
```bash
ssh-keygen
```

  - Press enter to save the keys in the default location `/Users/username/.ssh/id_rsa` (leave the name as `id_rsa` unless you need to rename it, for example, because you have other keys there)
  - Optional: enter a passphrase. If the passphrase left blank, you will be able to use the private key for logging in without entering a passphrase. If you enter a passphrase, you will need both the private key and the passphrase each time you log in
  - Now the private key, `id_rsa`, and the public key, `id_rsa.pub`, in the .ssh directory of your home directory are created. Remember to keep the private key secure

### Server creation

**Note:** this step is optional, if you already have a service provider, you can skip this step

Since a masternode require to be up 24/7, you could use an suggested easy to use `VPS` service https://www.scaleway.com/ (Vultr is also a good choice).

- Create your account
- On the top right corner, click on your `name` → `account` → `credentials`
  - Add the previously generated SSH public key
![](https://d2mxuefqeaa7sj.cloudfront.net/s_D32ECB2C1093FC4CB97BF553CACA6A996B41D14ACE45F9884A5F8B962D3F15E4_1514546497811_Screen+Shot+2017-12-29+at+12.19.39.png)

- Go to the `Server` tab
  - Click `Create server`
  - Name your server to easily identify it
  - Choose the location for your server
  - In `Server range` select `Starter` range
    - Go to `X86` section
    - A good choice for masternode is `VC1S` (2 vcpu, 2 Gb RAM, 200Mb traffic) instance
![](https://d2mxuefqeaa7sj.cloudfront.net/s_D32ECB2C1093FC4CB97BF553CACA6A996B41D14ACE45F9884A5F8B962D3F15E4_1514546709886_Screen+Shot+2017-12-29+at+12.10.10.png)

  - Select the OS to use, in this documentation `Debian Jessie` will be used
![](https://d2mxuefqeaa7sj.cloudfront.net/s_D32ECB2C1093FC4CB97BF553CACA6A996B41D14ACE45F9884A5F8B962D3F15E4_1514547168270_Screen+Shot+2017-12-29+at+12.09.47.png)


  - Optional: Add `tags` to filter your servers
  - Finally click `Create server` at the right bottom corner

## Server setup

Login to the server as `root` by using `PuTTY` (Windows) or `Terminal` (Mac / Linux)

### Change root password
- In the terminal, run:
    ```bash
    passwd
    ```

- Choose a very strong password (suggest 32 characters with numbers and special characters like `$` or `#`) and keep it in a safe place

### Add the connection user
- Create the user (replace `my_user` by the name you want, for exemple, you can use a usual nickname):
    ```bash
    adduser <my_user>
    ```

- You’ll be asked for setting up a password for the user. It’s a good way to use the same policy as the `root` password (many characters and keep it in safe place)
- The created users will need permissions to be granted as `root`, so it must be added to the `sudoers`. To do it so:
    ```bash
    usermod -aG sudo <my_user>
    ```

- Switch to the new user:
    ```bash
    su - <my_user>
    ```

- Create the `.ssh` directory:
    ```bash
    mkdir ~/.ssh
    chmod 0700 ~/.ssh
    touch ~/.ssh/authorized_keys
    chmod 0600 ~/.ssh/authorized_keys
    ```

- Paste the previously created `SSH` public key to the following file:
  - On your local machine:
    ```bash
    cat ~/.ssh/id_rsa.pub                       ← Copy the output of this command
    ```
  - On the remote server:
    ```bash
    vi ~/.ssh/authorized_keys               ← Paste here with your favorite editor
    ```

- Ensure the key pasted begin by `ssh-rsa`  end by the e-mail address you’ve set
- Logout from the server and try to connect to with the new user
- You should be able to connect to without typing the user password (if you’ve setup a `passphrase` during `SSH` key creation, you will be asked for)
- Ensure that you are able to become `root` from the new user:
    ```bash
    sudo -i
    whoami
    ```

- The result should be `root`, if not, you have to get back to the begin of the `Add connection user` step
- :warning: If you don’t take care of this, you can be unable to connect to your server

### Securing SSH server
- - Connect to your server then become `root`
- Edit `/etc/ssh/sshd_config` with your favorite editor
- Find the line that specifies PasswordAuthentication, uncomment it by deleting the # at the start of the line, then change its value to "no". It should end up looking like this:
    ```bash
    PasswordAuthentication no
    ```

- Find, uncomment and change these values as well:
    ```bash
    PermitRootLogin no
    PubkeyAuthentication yes
    ChallengeResponseAuthentication no
    ```

- Save your changes and restart `SSH` server:
    ```bash
    sudo /etc/init.d/ssh restart
    ```

- Open a new terminal then verify your changes (Can’t connect as root and ability to connect as user)
- Install `fail2ban` to avoid bruteforce stupid attacks
    ```bash
    sudo apt-get install fail2ban
    ```

## Prepare the local wallet
* Get back on your local machine, where you store the collaterals
* Generate a new receiving address and give it a label (eg: _Masternode1_)
* Send exactly `10,000 EXT` to this address **in one transaction** (It's important to have a single transaction)
* Generate a new masternode private key from the debug console, save this for later
  * In the debug console run: 
   ```
	 masternode genkey
	 ``` 
	 
## Setup the environment
* In order to execute the Masternode, you'll need to setup the working environment
* To install the tools run:
```
apt-get -y update
apt-get -y upgrade
apt-get -y install vim wget curl unzip
```
* Install EXT client:
```
wget https://github.com/exsolution/ext-wallet/releases/download/v1.1.0.0/exsolution-1.1.0-linux64.tar.gz
tar -xvf exsolution-1.1.0-linux64.tar.gz
rm exsolution-1.1.0-linux64.tar.gz
sudo mv ./exsolution-1.1.0/bin/exsolution* /usr/local/bin
exsolutiond
```
* Edit the configuration file:
```
vi ~/.exsolution/exsolution.conf
```
* Paste the following:
```
rpcallowip=127.0.0.1
rpcuser=<RANDOM-USERNAME>
rpcpassword=<LONG-RANDOM-PASSWORD>
rpcport=4401
staking=0
server=1
listen=1
port=21636
masternode=1
masternodeaddr=<VPS-IP-ADDRESS>:21636
masternodeprivkey=<KEY_PREVIOUSLY_GENERATED>
```

## Local wallet setup
* Go to the debug console and retrieve the `TX hash` and `Index` for your `10,000 EXT` transfer
* In the debug console run the command(an output will be displayed for each eligible transaction in your wallet):
```
masternode outputs
```
* Open the `masternode.conf` file and place the following at the very bottom of the file
  * You can access the configuration file by going to menu `Tools -> Open Masternode
Configuration File`
  * You must use this **EXACT** format when pasting your masternode information
`<ALIAS> <IP>:21636 <GENKEY-FROM-STEP-1> <TX-HASH> <TX-INDEX>`
* Your file should look like this, for multiple nodes, make multiple lines:
![](https://i.imgur.com/0TSP75g.png)
* Once done, save and close.
* Next you must restart your wallet in order to load the changes we made in the
configuration file
  * Restart the wallet
  * Wait until you are fully sync’d again
* Go to the masternode tab
  * Now you should see your masternode listed on the “My Masternodes” tab and are
ready to start the node
* Make sure your wallet is unlocked
* Select the masternode you would like to start
  * Press `start alias`
  * You should see that your node has been successfully started
  * Sometimes this step fails by clicking on `start alias`, if so, you have to do it by running the following in the Debug console:
  ```
	masternode start-alias <ALIAS>
	```
* Once you have a successful start, you may close out of the VPS screen
* Give your node 15-30 minutes before the timer starts increasing
* After enough time, you should see your status go to ‘Enabled’

That’s it, your node is now up and running! Enjoy!

## FAQs
#### Are my coins safe?
> This guide is for running a cold wallet VPS, that means your coins are never stored on the
> VPS and are always safe inside your desktop wallet. If at any time you are breached, there is
> nothing to be taken from your server and you could simply destroy your server and remake
> a new one. The effort to get into your server would not be worth the reward. Worst case
> scenario? You miss out on a few rewards until you realize something is wrong.

#### How can I check that my VPS masternode is still activated?
> You may check the masternode tab in your wallet
>
> Be careful to make sure you are fully sync’d when checking the tab as restarting a
> node that is running will reset the timer and the rewards
>
> The best way to check is to look at the full masternode list and filter your node out
> You may check by running the following command on your VPS while in the bin folder
```
./exsolution-cli masternode status
```

#### It only took 24 hours for my last reward but now it’s been 26 hours, what’s going on?
> Rewards do have a luck factor; some payments may be shorter or longer than the current
> average payout time. As more masternodes join the network, the time will increase. 
