# Masternode Configuration - Wallet Guide pour Windows Version : 7, 8, 10.

Exigences :
1.	10 000 jetons EXT (Exsolution) Tokens
2.	Porte-monnaie Exsolution pour Windows


Ce guide est destiné à la mise en place d'un masternode Exsolution. Vous aurez besoin d'un PC Windows avec une connexion Internet et une adresse IP unique 24h/24 et 7j/7.

# Étape 1 - Télécharger le portefeuille Exsolution
Téléchargez le portefeuille Windows Exsolution sur notre site officiel : https://github.com/exsolution/ext-wallet/releases/
Téléchargement de portefeuille recommandé : exsolution-1.1.0-win64-setup.exe

# Étape 2 - Installer le portefeuille Exsolution
Executer le fichier d'installation exsolution-1.1.0-win64-setup.exe. Le dossier d'installation par défaut pour le portefeuille Exsolution est C:\Program Files\Exsolution. Cliquez sur Suivant pour continuer l'installation. Une fois l'installation terminée, cliquez sur Terminé et démarrez le portefeuille Exsolution. Le répertoire par défaut dans lequel vos données et wallet.dat seront stockées est C:\Users\YOUR_USERNAME\AppData\Roaming\Exsolution

# Étape 3 - Créer une adresse publique pour votre Masternode
Vous devez créer une adresse de réception unique pour votre masternode. Une adresse de réception peut être créée dans le portefeuille en sélectionnant Adresse de réception.... à partir du fichier situé en haut à gauche du portefeuille. Sélectionnez Nouvelle adresse, entrez un nom approprié (par exemple MN1) et cliquez sur OK pour créer une nouvelle adresse de réception.

![N|Solid](https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png)

![N|Solid](https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png)


# Étape 4 - Générer la clé du Masternode
Vous devez créer une clé masternode unique pour votre Masternode. Cette clé est générée par le portefeuille local. La clé ne permet pas l'accès aux "collateral" ou aux pièces gagnées, de sorte qu'il ne s'agit pas d'un problème de sécurité, mais la meilleure pratique est de le garder privé.
Pour générer des clés de Masternode, sélectionnez Outils -> Fenêtre de débogage -> Console.
Dans la console de débogage, tapez "masternode genkey" afin de générer une clé masternode unique. Enregistrez ces détails pour une utilisation ultérieure.

![N|Solid](https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png)

# Étape 5 - Transférer 10 000 EXT à votre adresse publique masternode.
Pour permettre à votre masternode de démarrer, vous devez envoyer 10 000 EXT à l'adresse masternode de votre portefeuille local, comme cela a été généré à l'étape 3 (MN1) que vous avez l'intention d'exploiter. La transaction doit être exactement 10 000 EXT. Lorsque vous effectuez cette transaction, assurez-vous de tenir compte des frais. Le porte-monnaie de fenêtre vous montrera le montant total déposé, alors assurez-vous qu'il lit exactement 10 000 EXT en une seule transaction à l'adresse MN1 Masternode que vous avez l'intention d'exploiter.

 ![N|Solid](https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png)

# Étape 6 - Enregistrer la transaction et l'ID de sortie
L'ID de transaction et de sortie du dépôt que vous avez effectué dans votre adresse publique Masternode devra être ajouté au fichier de configuration masternode plus tard. Le fait d'aller chercher cette information maintenant rendra les choses un peu plus faciles lorsque nous atteindrons ce stade. Pour obtenir l'ID de transaction et de sortie, allez dans Outils -> Fenêtre de débogage -> Console. Dans la console de débogage, écrire "masternode output" affiche les sorties et l'ID de transaction et de sortie. S'il n'y a pas de sortie, vous avez probablement mal lu l'étape 5 de ce guide. Enregistrez ces détails pour une utilisation ultérieure.

 ![N|Solid](https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_.png)
 # Étape 7 - Modifier le fichier exsolution.conf
Nous allons maintenant configurer le Masternode. Allez dans Outils -> Ouvrir le fichier de configuration du portefeuille.
Collez les paramètres de configuration suivants dans l'éditeur :
```
masternode=1
masternodeprivkey=[MASTERNODEPRIVKEY].
externalip=[EXTERNALIP][EXTERNALIP].
port=21527
rpcuser=[RPCUSER][RPCUSER].
rpcpassword=[RPCPASSWORD][RPCPASSWORD].
rpcport=21636
rpcallowip=127.0.0.0.0.1
daemon=1
serveur=1
Staking=0
listenonion=0
Remplacer le texte suivant :
[MASTERNODEPRIVKEY] : Générée lors de la configuration du portefeuille Windows à l'étape 4.
[EXTERNALIP] : Définissez ce paramètre sur l'adresse IP publique de vos serveurs.
[RPCUSER] : Définissez ce paramètre sur un nom d'utilisateur personnalisé.
[RPCPASSWORD] : Réglez ce paramètre sur un mot de passe FORT.
```

REMARQUE : Assurez-vous que le port 21636 est autorisé par votre pare-feu.

# Étape 8 - Modifier le fichier masternode.conf
Allez dans Outils -> Ouvrir le fichier de configuration Masternode.
Ajout d'une nouvelle ligne avec les informations de configuration Masternode :
```
MasternodeName YOUR-IP:21636 masternodeprivkey collateral_output_output_txid collateral_output_output_index
```
Il devrait ressembler à ceci :
```
MN1 127.0.0.0.2:21636 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg 2bcd3c84c84c84f87eaa86e4e56834c92927a07f9e18718718810b92b92e0d032424456a67a67c 0
```
Et enregistrez le fichier masternode.conf.

# 9 - étapes finales
Redémarrez le portefeuille, allez dans l'onglet masternodes sur le portefeuille et cliquez sur Démarrer tout. Attendez environ 30 minutes et l'état du modeasternode se mettra à jour et deviendra actif.


# FAQ
- Impossible d'activer mon masternode :
Vérifiez que tous les ports 21636 sont ouverts dans votre pare-feu :
Comment ouvrir les ports Windows : https://www.windowscentral.com/how-open-port-windows-firewall

- Comment puis-je vérifier que mon masternode est toujours activé ?
Vous pouvez vérifier l'onglet masternode dans votre portefeuille.
Assurez-vous d'être entièrement synchronisé lorsque vous vérifiez l'onglet, car le redémarrage d'un nœud en cours d'exécution réinitialisera la minuterie et les récompenses.
La meilleure façon de vérifier est de regarder la liste complète de masternode et de filtrer votre noeud.
