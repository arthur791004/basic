# CentOS

## info
* uname
  * -a: 列印所有版本資訊
  * -s: 核心名稱(Linux)
  * -n: 完整網域主機名稱(localhost.localdomain)
  * -r: 核心版本(2.6.18-128.el5)
  * -v: 核心發行日期(#1 SMP Wed Jan 21 10:44:23 EST 2009)
  * -m: 機器硬體名稱(i686)
  * -p: 處理器類型(i686)
  * -i: 硬體平台類型(i386)
  * -o: 作業系統(GNU/Linux)
* cat /etc/*-release
  * 查看目前作業系統類型版本
* getconf LONG_BIT
  * 查詢位元

## commands
* chkconfig <service> on
  * 設定服務開機自動啟動
* setenforce/getenforce
  * 關閉 SELinux

## files
* /etc/rc.d/rc.local
  * 開機時自動執行的 scripts
  * This script will be executed *after* all the other init scripts
* /etc/sysconfig/selinux
  * 設定 selinux
  
## reference
