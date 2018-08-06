# Masternode Configuration -구성 - Windows 용 Wallet 안내서 버전 : 7, 8, 10.

요구 사항 :
1. 10,000 토큰 EXT (Exsolution) 토큰
2. Windows 용 Exsolution 월렛


이 가이드는 Exsolution 마스터 노드를 설정하기위한 것입니다. 인터넷에 연결되어 있고 고유 한 IP 주소 24/7이있는 Windows PC가 필요합니다.

# 1 단계 - Exsolution 포트폴리오 다운로드
공식 웹 사이트 (https://github.com/exsolution/ext-wallet/releases/)에서 Windows Exsolution 포트폴리오 다운로드
권장 포트폴리오 다운로드 : exsolution-1.1.0-win64-setup.exe

# 2 단계 - Exsolution 포트폴리오 설치
exsolution-1.1.0-win64-setup.exe 설치 파일을 실행하십시오. Exsolution 포트폴리오의 기본 설치 폴더는 C : \ Program Files \ Exsolution입니다. 다음을 클릭하여 설치를 계속하십시오. 설치가 완료되면 완료를 클릭하고 Exsolution 월렛을 시작하십시오. 데이터 및 wallet.dat가 저장되는 기본 디렉터리는 C : \ Users \ YOUR_USERNAME \ AppData \ Roaming \ Exsolution입니다.

# 3 단계 - Masternode의 공개 주소 만들기
마스터 노드에 대해 고유 한 수신 주소를 만들어야합니다. Wallet의 왼쪽 상단에있는 파일에서 Receiving Address ....를 선택하여 Wallet에 영수증 주소를 생성 할 수 있습니다. 새 주소를 선택하고 적절한 이름 (예 : MN1)을 입력 한 다음 확인을 클릭하여 새 수신 주소를 만듭니다.

![N|Solid](https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png) https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png)

![N|Solid](https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png) https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png)


# 4 단계 - Masternode에 대한 키 생성
Masternode에 고유 한 마스터 노드 키를 만들어야합니다. 이 키는 로컬 지갑에서 생성됩니다. 열쇠는 "담보물"이나 획득 한 동전에 대한 액세스를 허용하지 않으므로 보안상의 문제는 아니지만 최상의 방법은 비공개로 유지하는 것입니다.
Masternode 키를 생성하려면 Tools -> Debug Window -> Console을 선택하십시오.
디버그 콘솔에서 "masternode genkey"를 입력하여 고유 한 마스터 노드 키를 생성합니다. 나중에 사용할 수 있도록 이러한 세부 정보를 저장하십시오.

![N|Solid](https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png) https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png)

# 5 단계 - 10,000 EXT를 귀하의 마스터 노드 공용 주소로 전송하십시오.
masternode를 시작하려면 사용하려는 3 단계 (MN1)에서 생성 된대로 로컬 지갑의 마스터 노드 주소에 10,000 EXT를 보내야합니다. 트랜잭션은 정확히 10,000 EXT 여야합니다. 이 거래를 할 때 수수료를 고려해야합니다. 창 지갑에는 입금 된 총 금액이 표시되므로 조작하려는 MN1 Masternode 주소에서 단일 거래에서 정확히 10,000 EXT를 읽어야합니다.
 
 ![N|Solid](https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png) https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png)
 
# 6 단계 - 거래 및 출구 ID 저장
나중에 Masternode 공개 주소에서 만든 입금액의 거래 및 탈퇴 ID는 나중에 masternode 구성 파일에 추가해야합니다. 이 정보를 얻으려면이 시점에 도달하면 조금 더 쉬워 질 것입니다. 트랜잭션과 종료 ID를 얻으려면 도구 -> 디버그 창 -> 콘솔로 이동하십시오. 디버그 콘솔에서 "masternode output"은 출력과 트랜잭션 ID 및 출력을 표시합니다. 이탈이 없으면이 안내서의 5 단계를 잘못 읽었을 것입니다. 나중에 사용할 수 있도록 이러한 세부 정보를 저장하십시오.
 
 ![N|Solid](https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_.png) https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_4.png)
 
# 7 단계 - exsolution.conf 파일 편집
이제 Masternode를 구성 할 것입니다. 도구 -> 월렛 구성 파일 열기로 이동하십시오.
다음 구성 설정을 편집기에 붙여 넣습니다.
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

다음 텍스트를 바꿉니다.
[MASTERNODEPRIVKEY] : 4 단계에서 Windows를 설치하는 동안 생성 포트폴리오.
[EXTERNALIP] : 서버의 공용 IP 주소로 설정합니다.
[RPCUSER] :이 매개 변수를 사용자 지정 사용자 이름으로 설정합니다.
[RPCPASSWORD] :이 매개 변수를 강력한 암호로 설정하십시오.
```

참고 : 포트 21636이 방화벽에 의해 허가되었는지 확인하십시오.

# 8 단계 - masternode.conf 파일 편집
Tools -> Masternode configuration file 열기로 이동하십시오.
Masternode 구성 정보로 새 행 추가 :
```
YOUR-IP를 MasternodeName : 21,636 masternodeprivkey collateral_output_output_txid collateral_output_output_index
```
다음과 같이 표시되어야합니다.
```
MN1 127.0.0.0.2 : 21,636 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg의 2bcd3c84c84c84f87eaa86e4e56834c92927a07f9e18718718810b92b92e0d032424456a67a67c 0
```
그리고 masternode.conf 파일을 저장하십시오.

# 9 - 마지막 단계
포트폴리오를 다시 시작 포트폴리오에 탭 masternodes으로 이동하여 모든 시작을 클릭합니다. 약 30 분을 기다린 modeasternode의 상태를 업데이트하고 활성화됩니다.


# FAQ
- 내 masternode를 활성화 할 수 없습니다 :
모든 21636 포트가 방화벽에서 열려 있는지 확인하십시오.
https://www.windowscentral.com/how-open-port-windows-firewall를 윈도우 포트를 여는 방법

내 마스터 노드가 항상 활성화되어 있는지 확인하려면 어떻게해야합니까?
지갑의 masternode 탭을 확인할 수 있습니다.
확인이 완전히 실행중인 노드를 다시 시작하면 타이머와 보상을 재설정하기 때문에 사용자가 탭을 확인할 때 동기화 할 수 있습니다.
확인하는 가장 좋은 방법은 masternode의 전체 목록을보고 노드를 필터링하는 것입니다.
