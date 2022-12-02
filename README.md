## base station
1. https://github.com/jancelin/pi-gen_RTKbase/releases/tag/BaseGNSS-RPi-2.3.4
2. Download RTKBaseGNSS_2_3_4.zip
3. Flashing
   ```bash
    ssh basegnss@192.168.50.35
    mdp: basegnss!
   ```
4. https://github.com/Stefal/rtkbase
  ```bash
  $ cd ~
  $ wget https://raw.githubusercontent.com/Stefal/rtkbase/master/tools/install.sh -O install.sh
  $ chmod +x install.sh
  $ sudo ./install.sh --all
  ```
![install](images/install_result.png)
6. http://192.168.50.35
* password: admin
![webpage_setting](images/webpage_setting.png)
   
## LTE Router
* http://192.168.50.1/home.asp
* model: IRP-400W
* 암호: 상단에 부착됨

## permission error
* /dev/ttyUSB0
* udevadm info -a -n <현재 잡힌 포트 (ex. /dev/ttyACM0)>
* https://coding-robot.tistory.com/9

## mapviz
```bash
roslaunh mapviz mapviz.launch
```
* 사용법
  * https://hm02123.tistory.com/13
  * https://hm02123.tistory.com/8


## review
* 모든것의 시작: https://github.com/Stefal/rtkbase
  * 설치 방법 두가지가 있음.
      * Ready to flash release: 최신 Stefal/rtkbase가 적용된 rpi os(2022-04-04-raspios-bullseye) image와 image를 만드는 방법
      * Easy installation: rpi os와 상관없이 수동 설치 방법
  * 실험적으로 Easy installation 방법으로 함.
    * https://www.waveshare.com/wiki/7inch_DSI_LCD_(C) 사용하려면
    * 2022-01-28-raspios-bullseye-arm32 image를 사용해서 해보기로 했음
      * 2022-01-28-raspios-bullseye-arm32 설치
      * https://github.com/Stefal/rtkbase.git 다운
      * wget https://raw.githubusercontent.com/Stefal/rtkbase/master/tools/install.sh -O install.sh 실행
  
## gnss rover
```text
========================================================
RTK GNSS 모듈: F9P
https://www.devicemart.co.kr/goods/view?no=14035222

Driver:
https://github.com/KumarRobotics/ublox

Ntrip Client:
https://github.com/LORD-MicroStrain/ntrip_client

MapViewer
https://github.com/swri-robotics/mapviz

대략적인 설명입니다. 
모듈은 f9p입니다 첨부된 링크 참고 바랍니다. 
그렇게 구매 하시고 
윈도우에서 ublox u-center 앱 다운받아 확인 해보시고 
ubuntu 18.04 notebook에 USB 연결해서 사용하시면 됩니다. 
driver 설치하시고 관련 토픽이 잘 나오는지 확인하시고 
ntrip client 설치하시고 국토지리원 가셔서 등록하시고 정보 받아 입력하시면 됩니다. 
bagging된 위성데이터를 확인할때 mapviz 확인해보시고 
ntrip client 실행시와 미실행시 데이터를 확인해보시면 될것 같습니다. 
이상입니다.

최병철 드림
========================================================
```

## mapviz
```bash
cd mapviz
git checkout -b 802ed 802ed2c324379967f6ae4ba590e2fd4225e75694
```