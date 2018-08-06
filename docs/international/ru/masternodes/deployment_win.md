# Masternode Configuration - Конфигурация - Руководство для кошельков для Windows Версия: 7, 8, 10.
требования:
1. 10 000 токенов EXT (Exsolution) Tokens
2. Кошелек Exsolution для Windows


Это руководство предназначено для настройки маневровой системы Exsolution. Вам понадобится компьютер с ОС Windows с подключением к Интернету и уникальный IP-адрес 24/7.

# Шаг 1 - Загрузите порт Exsolution
Загрузите портфолио Windows Exsolution с нашего официального сайта: https://github.com/exsolution/ext-wallet/releases/
Рекомендуемый портфолио скачать: exsolution-1.1.0-win64-setup.exe

# Шаг 2 - установите порт Exsolution
Запустите файл установки exsolution-1.1.0-win64-setup.exe. Папка установки по умолчанию для портфолио Exsolution - C: \ Program Files \ Exsolution. Нажмите «Далее», чтобы продолжить установку. Когда установка будет завершена, нажмите «Готово» и запустите экземпляр Exsolution. Каталог по умолчанию, в котором будут храниться ваши данные и wallet.dat, - C: \ Users \ YOUR_USERNAME \ AppData \ Roaming \ Exsolution

# Шаг 3 - Создайте общедоступный адрес для вашего Masternode
Вы должны создать уникальный адрес получателя для вашего мазнета. Адрес чека можно создать в кошельке, выбрав «Получить адрес ...» из файла, расположенного в верхнем левом углу кошелька. Выберите «Новый адрес», введите соответствующее имя (например, MN1) и нажмите «ОК», чтобы создать новый адрес получателя.

![N|Solid](https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png) https://thumb.ibb.co/iu4DWK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_1.png)

![N|Solid](https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png) https://thumb.ibb.co/bZRSrK/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_2.png)


# Шаг 4 - сгенерируйте ключ к Masternode
Вы должны создать уникальный мастонный ключ для вашего Masternode. Этот ключ создается локальным кошельком. Ключ не позволяет получить доступ к «залогу» или полученным монетам, поэтому это не проблема безопасности, но наилучшей практикой является сохранение ее конфиденциальности.
Для генерации ключей Masternode выберите Инструменты -> Окно отладки -> Консоль.
В консоли отладки введите "masternode genkey" для генерации уникального ключа масштаба. Сохраните эти данные для последующего использования.

![N|Solid](https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png) https://thumb.ibb.co/bBNBJz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_3.png)

# Шаг 5 - Перенести 10 000 EXT на ваш общий адрес в мастере.
Чтобы разрешить запуск вашего маска, вы должны отправить 10 000 EXT на адрес мастона локального кошелька, который был сгенерирован на шаге 3 (MN1), который вы намереваетесь использовать. Транзакция должна быть ровно 10 000 EXT. Когда вы совершаете эту транзакцию, обязательно учитывайте плату. Кошелек окна покажет вам общую сумму депозита, поэтому убедитесь, что он считывает ровно 10 000 EXT в одной транзакции на адресе MN1 Masternode, который вы собираетесь использовать.
 
 ![N|Solid](https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png) https://thumb.ibb.co/gTVyyz/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_5.png)
 
# Шаг 6 - Сохранить идентификатор транзакции и выхода
Идентификатор транзакции и выхода из депозита, который вы сделали в вашем общедоступном адресе Masternode, необходимо будет добавить в конфигурационный файл masternode позже. Поиск этой информации теперь сделает вещи немного легче, когда мы достигнем этой точки. Чтобы получить идентификатор транзакции и выхода, откройте «Инструменты» - «Окно отладки» -> «Консоль». В консоли отладки напишите «Output masternode», на котором отображаются выходы и идентификатор транзакции и вывод. Если выхода нет, вы, вероятно, неправильно поняли шаг 5 этого руководства. Сохраните эти данные для последующего использования.
 
 ![N|Solid](https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_.png) https://thumb.ibb.co/gFOwke/EXT_EXSOLUTION_MASTERNODE_PROOF_OF_STAKE_POS_SECURE_4.png)
# Шаг 7 - Отредактируйте файл exsolution.conf
Теперь мы настроим Masternode. Откройте Инструменты -> Файл конфигурации открытого кошелька.
Вставьте следующие параметры конфигурации в редактор:
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
[MASTERNODEPRIVKEY]: создается при настройке Windows Wallet на шаге 4.
[EXTERNALIP]: установите этот параметр на общедоступный IP-адрес ваших серверов.
[RPCUSER]: установите этот параметр для пользовательского имени пользователя.
[RPCPASSWORD]: установите этот параметр для надежного пароля.
```

ПРИМЕЧАНИЕ. Убедитесь, что порт 21636 разрешен вашим брандмауэром.

# Шаг 8 - Отредактируйте файл masternode.conf
Откройте «Инструменты» -> «Открыть файл конфигурации Masternode».
Добавление новой строки с информацией о конфигурации Masternode:
```
MasternodeName YOUR-IP: 21636 masternodeprivkey collateral_output_output_txid collateral_output_output_index
```
Он должен выглядеть так:
```
MN1 127.0.0.0.2: 21636 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg 2bcd3c84c84c84f87eaa86e4e56834c92927a07f9e18718718810b92b92e0d032424456a67a67c 0
```
И сохраните файл masternode.conf.

# 9 - заключительные шаги
Перезагрузите кошелек, перейдите на вкладку masternodes на кошелек и нажмите «Начать все». Подождите около 30 минут, и состояние режима mode обновится и станет активным.


# FAQ
- Невозможно активировать мой масштаб:
Убедитесь, что все 21636 портов открыты в вашем брандмауэре:
Как открыть порты Windows: https://www.windowscentral.com/how-open-port-windows-firewall

- Как я могу проверить, что мой масштаб всегда включен?
Вы можете проверить вкладку masternode в своем кошельке.
Убедитесь, что вы полностью синхронизированы, когда вы проверяете вкладку, потому что перезапуск работающего узла приведет к сбросу таймера и вознаграждений.
Лучший способ проверить - просмотреть полный список масштадов и фильтровать свой узел.
