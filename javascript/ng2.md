# angular2

## file structure
| File               | Description                                        |
| ------------------ | -------------------------------------------------- |
| angular-cli.json   | angular-cli 設定檔，本上就是一些目錄及打包程式時的設定 |
| e2e                | 用來存放 end to end 的測試案例                       |
| karma.conf.js      | Karma 作為 unit test 的設定檔                       |
| node_modules       | npm modules                                        |
| protractor.conf.js | protractor 測試相關的設定                           |
| src                | code                                               |
| tslint.json        | 針對TypeScript的程式撰寫風格進行規範(linter)的設定檔  |
| .editorconfig      | 給 IDE 設定來調整你的程式碼風格                      |

## angular-cli

### 新增 Project
* ng new \<project>
  * --style=sass

### Generator
| Scaffold  | Usage |
| --------- | ----- |
| Component | ng g component \<component> |
| Directive | ng g directive \<directive> |
| Pipe      | ng g pipe \<pipe> |
| Service   | ng g service \<service> |
| Class     | ng g class \<class> |
| Interface | ng g interface \<interface> |
| Enum      | ng g enum \<enum> |
| Module    | ng g module \<module> |

### Destroy
* 移除 Generator 產生的檔案
* 用法同 Generator: ng g ---> ng d

### Build
* ng build
  * --prod: 最小化
  * -w: watch

### Serve
* HMR 測試
* ng serve
  * --host
  * --port
  * --live-reload-port

### Lint
* 檢查 tslint.json 設定的 TypeScript 撰寫風格的相關限制
* ng lint

### Test
* ng test
  * unit test
  * 執行 src/app 下面所有的測試程式碼
  * karma + jasmine
* ng e2e
  * 執行 end to end 測試
  * 執行/e2e下面的測試程式
  * karma + protractor

### Others
* ng set defaults.styleExt scss

## Reference
* https://dotblogs.com.tw/wellwind
* https://github.com/angular/angular-cli
