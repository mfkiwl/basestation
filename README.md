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
* https://hm02123.tistory.com/13
* https://hm02123.tistory.com/8



