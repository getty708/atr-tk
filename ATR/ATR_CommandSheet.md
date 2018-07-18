# ATR Sensor | Cheet Sheet

## Reference
+ sensor serverを使用した場合, teratermから送れるコマンド.
+ Ref.1: [小型無線多機能センサ（TSND151) コマンドインタフェース仕様書](http://www.atr-p.com/products/pdf/TSND151-cmd-spec.pdf)
+ Ref.2: [プロトコル変換ソフトウエア「SensorServer」マニュアル](http://www.atr-p.com/products/pdf/SensorServer-manual.pdf)


## System 設定
### 機器情報取得 [`devinfo`]
+ Bluetooth アドレス、シリアル番号、ソフトウェアバージョン、型名等の機器情報を応答する。

+ シリアル番号[10Byte] = 文字列“AP12345678”
+ Bluetooth アドレス[6Byte] = 00:11:22:33:44:55
+ ソフトウェアバージョン[4Byte] = 0x00000000～0xFFFFFFFF
+ 型名[10Byte] = 文字列“TSND151”(初めの 0x00(NULL)まで有効)

### 時刻取得 [`getd`]
+ システムの時刻を取得
+ 年[1Byte] = 0～90
+ 2000 年からの経過年数
+ 月[1Byte] = 1～12
+ 日[1Byte] = 1～31
+ 時[1Byte] = 0～23
+ 分[1Byte] = 0～59
+ 秒[1Byte] = 0～59
+ ミリ秒[2Byte] = 0～999


### 時刻設定 [`setd YYMMDDHHMMSSfff`]
+ 時刻の設定


## 加速度 & 角速度 関係
### 加速/角速度計測設定 [`setags {計測周期} {送信設定} {記録設定}`]
+ 加速、角速度の計測に関する設定を行う。

```
# Params
計測 OFF or 計測周期[1Byte] = 0～255
  計測の実施有無及び計測周期を設定
  (0:計測 OFF、1:計測周期 1ms～255:計測周期 255ms(1ms 単位指定))
計測データ送信設定[1Byte] = 0～255
  計測データ送信の実施有無及び送信時の平均回数を設定
  (0:送信しない、1:平均回数 1 回～255:平均回数 255 回)
計測データ記録設定[1Byte] = 0～255
  計測データ記録の実施有無及び記録時の平均回数を設定
```

### 加速/角速度計測取得 [`getags`]
加速度・角速度の計測設定を取得.



## 地磁気関係
### 地磁気計測設定 [`setgeo {計測周期} {送信設定} {記録設定}`]
+ 地磁気の計測に関する設定を行う。

```
# Params
計測 OFF or 計測周期[1Byte] = 0～255
  計測の実施有無及び計測周期を設定
  (0:計測 OFF、10:計測周期 10ms～255:計測周期 255ms(1ms 単位指定))
計測データ送信設定[1Byte] = 0～255
  計測データ送信の実施有無及び送信時の平均回数を設定
  (0:送信しない、1:平均回数 1 回～255:平均回数 255 回)
計測データ記録設定[1Byte] = 0～255
  計測データ記録の実施有無及び記録時の平均回数を設定
  (0:記録しない、1:平均回数 1 回～255:平均回数 255 回)
```

### 地磁気計測取得 [`getgeo`]
地磁気の計測設定を取得.



## メモリ関係
### 計測データ記録クリア [`clearmem`]

### 計測データ記録エントリ件数取得 [`memcount`]

### 計測データ記録エントリ詳細取得 [`getmementryinfo {entry no.}`]

### 計測データ記録メモリ読み出し [`readmemdata {entry no.}`]