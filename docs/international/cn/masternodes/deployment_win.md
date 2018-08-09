# Masternode 配置 - 适用于Windows版的电子钱包指南：7,8,10。
要求：
1. 10,000个令牌EXT（Exsolution）令牌
2.适用于Windows的Exsolution钱包

本指南旨在设置Exsolution masternode。您将需要一台具有Internet连接和唯一IP地址24/7的Windows PC。

# 要求1 - 下载Exsolution产品组合
从我们的官方网站下载Windows Exsolution产品组合：https：//github.com/exsolution/ext-wallet/releases/
推荐的产品组合下载：exsolution-1.1.0-win64-setup.exe

# 要求2 - 安装Exsolution Portfolio
运行exsolution-1.1.0-win64-setup.exe安装文件。 Exsolution产品组合的默认安装文件夹是C：\ Program Files \ Exsolution。单击“下一步”继续安装。安装完成后，单击“完成”并启动Exsolution钱包。您的数据和wallet.dat将存储的默认目录是C：\ Users \ YOUR_USERNAME \ AppData \ Roaming \ Exsolution

# 要求3 - 为您的Masternode创建一个公共地址
您必须为您的masternode创建一个唯一的接收地址。通过从钱包左上角的文件中选择接收地址....，可以在钱包中创建收据地址。选择“新地址”，输入适当的名称（例如MN1），然后单击“确定”以创建新的接收地址。

![N|Solid](https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png)

![N|Solid](https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png)


# 步骤4 - 生成Masternode的密钥
您必须为您的Masternode创建一个唯一的masternode键。 此密钥由本地钱包生成。 密钥不允许访问“抵押品”或赚取的硬币，因此这不是安全问题，但最佳做法是将其保密。
要生成Masternode键，请选择工具 - >调试窗口 - >控制台。
在调试控制台中，键入“masternode genkey”以生成唯一的masternode密钥。 保存这些详细信息以供日后使用

![N|Solid](https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png)

# 步骤5 - 将10,000 EXT转移到您的masternode公共地址。
要允许您的masternode启动，您必须将10,000 EXT发送到您本地钱包的masternode地址，如您打算利用的步骤3（MN1）中生成的那样。 交易必须是10,000 EXT。 进行此交易时，请务必考虑收费。 窗口钱包将显示存入的总金额，因此请确保它在您打算操作的MN1 Masternode地址的单个事务中准确读取10,000 EXT。

 ![N|Solid](https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png)

# 步骤6 - 保存事务和退出ID
您在Masternode公共地址中进行的存款的交易和退出ID将需要稍后添加到masternode配置文件中。 现在寻求这些信息将使我们达到这一点时更容易一些。 要获取事务和退出ID，请转到“工具” - >“调试窗口” - >“控制台”。 在调试控制台中，写入“Masternode Output”将显示输出和事务ID以及输出。 如果没有退出，您可能误读了本指南的第5步。 保存这些详细信息以供日后使用


 ![N|Solid](https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_.png)

 # 步骤7 - 编辑exsolution.conf文件
我们现在将配置Masternode。转到工具 - >打开钱包配置文件。
将以下配置设置粘贴到编辑器中：
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
替换以下文本：
[MASTERNODEPRIVKEY]：Windows安装在第4步中生成的组合。
[EXTERNALIP]：将此参数设置为服务器的公共IP地址。
[RPCUSER]：将此参数设置为自定义用户名。
[RPCPASSWORD]：将此参数设置为强密码。
```

注意：确保端口21636已获得防火墙的授权。

# 步骤8 - 编辑文件masternode.conf
转到工具 - >打开Masternode配置文件。
使用Masternode配置信息添加新行：
```
MasternodeName YOUR-IP：21636 masternodeprivkey collateral_output_output_txid collateral_output_output_index
```
它应该如下所示：
```
MN1 127.0.0.0.2：21636 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg 2bcd3c84c84c84f87eaa86e4e56834c92927a07f9e18718718810b92b92e0d032424456a67a67c 0
```
并保存文件masternode.conf。

＃9 - 最后的步骤
重新启动的投资组合，对投资组合的标签masternodes并单击开始所有。等待大约30分钟，modeasternode的状态将更新并变为活动状态。


#FAQ
- 无法激活我的masternode：
验证防火墙中是否已打开所有21636端口：
如何打开Windows移植https://www.windowscentral.com/how-open-port-windows-firewall

- 如何检查我的masternode是否始终启用？
您可以查看钱包中的masternode选项卡。
确保当您检查的标签，因为重新启动正在运行的节点将复位定时器和回报完全同步。
检查的最好办法是看masternode的完整列表和筛选节点。

