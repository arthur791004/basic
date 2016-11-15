# angular2

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
