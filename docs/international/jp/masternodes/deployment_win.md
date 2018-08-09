# Masternode Configuration - 設定 - Windows用ウォレットガイドバージョン：7,8,10。
要件：
1. 10,000トークンEXT（Exsolution）トークン
2. Windows用Exsolutionウォレット


このガイドは、Exsolutionのmasternodeを設定するためのものです。あなたは、インターネット接続と一意のIPアドレス24/7のWindows PCが必要です。

# ステップ1 - Exsolutionポートフォリオをダウンロードする
公式ウェブサイト（https://github.com/exsolution/ext-wallet/releases/）からWindows Exsolutionポートフォリオをダウンロードしてください。
推奨ポートフォリオダウンロード：exsolution-1.1.0-win64-setup.exe

# ステップ2 - Exsolutionポートフォリオをインストールする
exsolution-1.1.0-win64-setup.exeインストールファイルを実行します。 Exsolutionポートフォリオの既定のインストールフォルダはC：\ Program Files \ Exsolutionです。 [次へ]をクリックしてインストールを続行します。インストールが完了したら、[完了]をクリックしてExsolution Walletを起動します。データとwallet.datが保存される既定のディレクトリはC：\ Users \ YOUR_USERNAME \ AppData \ Roaming \ Exsolutionです。

# ステップ3 - あなたのMasternodeのパブリックアドレスを作成する
あなたのmasternodeに固有の受信アドレスを作成する必要があります。 Walletの左上にあるファイルからReceiving Address ....を選択すると、ウォレットに領収書アドレスを作成できます。 [新しいアドレス]を選択し、適切な名前（たとえばMN1）を入力し、[OK]をクリックして新しい受信アドレスを作成します。

![N|Solid](https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png)

![N|Solid](https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png)


# ステップ4 - Masternodeへのキーを生成する
あなたは、あなたのMasternodeのための一意のマスターキーを作成する必要があります。 このキーはローカルウォレットによって生成されます。 キーは「担保」や獲得したコインへのアクセスを許可しないため、これはセキュリティの問題ではありませんが、秘密にすることがベストプラクティスです。
Masternodeキーを生成するには、Tools - > Debug Window - > Consoleを選択します。
デバッグコンソールで、「masternode genkey」と入力して、固有のマスターキーを生成します。 後で使用できるようにこれらの詳細を保存します。

![N|Solid](https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png)

# ステップ5 - あなたのmasternodeパブリックアドレスに10,000 EXTを転送します。
masternodeを開始できるようにするには、使用するステップ3（MN1）で生成されたローカルウォレットのmasternodeアドレスに10,000 EXTを送信する必要があります。 トランザクションは正確に10,000 EXTでなければなりません。 この取引をするときは、必ず手数料を考慮してください。 窓口には入金総額が表示されますので、ご使用になる予定のMN1 Masternodeアドレスで、1回の取引で正確に10,000口座を読み取るようにしてください。

 ![N|Solid](https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png)

# ステップ6 - トランザクションを保存して終了ID
あなたのMasternode公開アドレスで行った預金のトランザクションと出口IDは、後でmasternode設定ファイルに追加する必要があります。 今この情報を求めることは、この点に達すると少し楽になります。 トランザクションと終了IDを取得するには、ツール - >デバッグウィンドウ - >コンソールを選択します。 デバッグコンソールでは、 "masternode output"と出力とトランザクションIDと出力が表示されます。 出口がない場合は、このガイドの第5ステップを誤読している可能性があります。 後で使用できるようにこれらの詳細を保存します。

 ![N|Solid](https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_.png)

# ステップ7 - exsolution.confファイルを編集する
これでMasternodeを設定します。 [ツール] - > [ウォレット設定ファイルを開く]を選択します。
次の構成設定をエディタに貼り付けます。
```
masternode=1
masternodeprivkey=[MASTERNODEPRIVKEY]
externalip=[EXTERNALIP]
port=21527
rpcuser=[RPCUSER]
rpcpassword=[RPCPASSWORD]
rpcport=21636
rpcallowip=127.0.0.1
daemon=1
server=1
staking=0
listenonion=0
次のテキストを置き換えます。
[MASTERNODEPRIVKEY]：ステップ4で、Windowsのセットアップ時に発電ポートフォリオ。
[EXTERNALIP]：このパラメーターをサーバーのパブリックIPアドレスに設定します。
[RPCUSER]：このパラメータをカスタムユーザー名に設定します。
[RPCPASSWORD]：このパラメータを強力なパスワードに設定します。
```

注：ポート21636がファイアウォールによって許可されていることを確認してください。

# ステップ8 - masternode.confファイルを編集する
[Tools] - > [Open Masternode configuration file]を選択します。
Masternode構成情報で新しい行を追加する
```
YOUR-IPをMasternodeName：21636 masternodeprivkey collateral_output_output_txid collateral_output_output_index
```
これは次のようになります。
```
MN1 127.0.0.0.2：21636 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xgの2bcd3c84c84c84f87eaa86e4e56834c92927a07f9e18718718810b92b92e0d032424456a67a67c 0
```
masternode.confファイルを保存します。

# ステップ 9 - 最終ステップ
、ポートフォリオを再起動して、ポートフォリオ上のタブmasternodesに移動し、すべての開始]をクリックします。約30分待ってから、モードモードの状態が更新され、アクティブになります。


＃よくある質問
- 私のmasternodeを起動できません：
ファイアウォールですべての21636ポートが開いていることを確認します。
Windowsのポートを開く方法https://www.windowscentral.com/how-open-port-windows-firewall

- 私のマスターノードが常に有効になっていることを確認するにはどうすればよいですか？
財布のmasternodeタブを確認することができます。
あなたはタブを確認したときに、実行中のノードを再起動すると、タイマーと報酬がリセットされますので、完全に同期していることを確認します。
チェックする最良の方法は、マスター・ノードの完全なリストを見て、あなたのノードをフィルタリングすることです。

