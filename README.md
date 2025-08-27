### 本项目专注于 OpenWrt USB WiFi 音箱的系统构建。

#### 一般情况下，本项目固件自动包含以下功能：

##### Airplay | DLNA（Gmediarender）| Aria2 | DDNS-GO | EasyTier | Pianod（Pandora）

Android 下的 App 对于 DLNA 音箱支持其实非常差，远远不如 iOS 系统的 AirPlay 成熟度高。

iOS 在不添加额外硬件的情况下，通过软件即可让 Spotify 和 Pandora 实现 WIFI 音箱的功能，但在 Android 上，这两个目前都很难实现。

路由器在集成了 DLNA 功能后，似乎只有 Windows 端可以通过本地音乐播放器（foobar2000、WMP、VLC等）实现推流播放本地音乐的功能，在线推流的支持都差。

#### 上游 OpenWrt 代码 Fork 自 [lede](https://github.com/coolsnowwolf/lede)
#### Actions 代码 Frok 自 [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)

