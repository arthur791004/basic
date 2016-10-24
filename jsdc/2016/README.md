# JSDC 2016

## How to adapt to change & exploring Vue.js (Blake Newman)

### JS is Fragile
* Modularisation
* Maintainability
* Scalability
* LIFT Principle
  * Locate
  * Identify
  * Flat - 7 files in the folder (?)
  * T-DRY(try to stick to dry) (DRY: Don't-Repeat-Yourself)
### How can we adapt
* Dependency Management
  * wrong
  ```json
  ^1.0.0: 1.0.0 <= 2.0.0
  ```
  * Use X-Ranges or Direct Version
  ```json
  1.0.x: 1.0.0 <= 1.1.0
  1.0.17: 1.0.17
  ```
  * keep in control
  ```shell
  $ npm i -g npm-check-updates
  $ ncu
    eslint              2.12.x  →  2.13.x
    vue-hot-reload-api   1.3.x  →   2.0.x
  ```
* Sacrificial Architecture
  * http://martinfowler.com/bliki/SacrificialArchitecture.html
  * https://medium.com/@TheStrazz86/sacrificial-architecture-in-web-development-3926c0593fc8#.sn2a2razc
* Problems are with Frameworks
  * Choose your framework as if you will need to change it after six months
  * Don't be a slave to Frameworks
* Development Experience
  * The best code that you can write now, probably won't be in a few years
  * The best way to cope with change is to increase productivity
    * HMR
  * Hiring people to write is not the same as hiring people to design and build durable, usable, dependable software.
* Vue.js
  * What does Vue deliver?
    * Library for the View layer
    * Components with reactivity
    * Extendable via plugins
    * Lightweight
    * Simplicity
    * Testable
  * How does Vue.js work?
    * Reactive data-binding system for a  Data-driven view
    * DOM in sync with data
    * Object.defineProperty
    * Component System helps with small abstraction layer
    * Component loosely modeled after the Web Components spec
    * Implements the Slot API and the special attribute is
  * What is Reactivity?
    * Vue.js works with Sacrificial Arcitecture!
    * Business logic is simple!
* Vue.js Components
  ```
  // demo.component.js
  Vue.component('demo-component', {
      template: '<div> {{ msg }} </div>',
      // Data initialization
      data() {
          return {
              msg: 'Vue is cool'
          };
      }, 
      computed: { }, 
      methods: { }, 
      events: { },
      ready() {
          // Execute logic on ready hook
      },
  });

  // demo.html
  <demo-component></demo-component>
  ```

## GraphQL 經驗分享(Steven Su)
* F8 App = react + redux + relay + GraphQL
* 問題
  * 代碼多
  * 接口一堆
  * 併發 request 很麻煩
  * 參數好難傳
* Example of GraphQL
  ```
  // query
  {
    me {
      id
      email
      name
    }
  }
  
  // response
  {
    "data": {
      "me": {
        "id": 1,
        "email": "xp@fandora.co",
        "name": "xpsteven"
      }
    }
  }
  ```
* express-graphql
  * schema 類似 router
  * field 就想成端點吧
  * promise
  * type 定義回傳資料結構
  * input/output 都是 strong type
  * query v.s mutatino
    * query: 拉資料, 平行處理
    * mutation: 更新資料, 序列處理 
  * cache 處理
    1. 改寫 res.end
    2. 透過 context 把 req 傳進 resolver
    3. 透過 req 來指名是否寫入 cache
    4. cache key 用 req.body.query + req.body.variables
  * 安全性
    * 思維: 從源頭開始
    * req.acl 來計算可以讀取的欄位


## ThinkJS - 使用 ES2015+ 特性开发 Node.js 项目 (李成银)

### Koa
* 提供基本功能
* 一套 middleware 機制
* 洋蔥模型
* Problems
  * 自動編譯 + 更新
  * 配置管理
  * 項目結構管理
  * router 管理
  * middleware 和 module 的選用
  * 性能, 安全等問題
  * 錯誤處理

### ThinkJS
* 直接使用 ES2015+ 的特性
* 用 async/await + Promise 處理異部問題
* 自動編譯 + 更新
* 詳細的 log
  * HTTP access log ===> 可以用 express middleware: morgan 做到
  * SQL
  * error
* cli 和 定時任務
* 斷點測試
* 其他
  * 支持 mysql, mongo, postgresql 等 db
  * 支持 socket.io, socketJS 等 websocket
  * 支持國際化和多主題
  * 支持 AOP 編程
  * 支持 RESTful API
### Koa v.s ThinkJS
* Koa
  * 核心就 4 個文件，提供了 middleware 機制
  * 比較靈活，但 middleware 要自己找
* ThinkJS
  * 封裝了很多常用的功能
  * 提供 middleware 和 adapter 機制
  * 固定的項目結構目錄

## 使用 Angular 2 與 Firebase 實現 Serverless 網站架構(Will 保哥)
* demo firebase(serverless) + angular2 CRUD

## 淺談網站自動化測試 - 以 WebdriverIO 框架為例(劉艾霖)

### 網站自動化測試
* 透過自動化的方式，去控制流程
* 比較實際結果與預期結果之間的差異
* 可反覆執行
* 前端測試框架挑選準則
  * 資源：功能、工具、文件
  * 擴充：架構容不容易擴充
  * 永續性：PR 多不多
  * 開發者面向：容不容易debug
  * webdriver.io v.s protractor v.s nightwatch
### Webdriver.IO 介紹
* 支援 Java, C#, Ruby, Python, JS
* nightwatch <---> request <---> webdriver (selenium server) <---> browser
* pros
  * 高度模組化
  * extendable
  * custom reporter
  * custom commands
  * Plugin
### Getting Started

### 框架為我們做了什麼?
* 簡化API 
  * API介紹
  * API這麼多如何使用 => 撰寫測試三步驟
    * 操作行為
    * 取得值
    * 操作結果
  * 常用類別
    * Action
    * Property
    * Protocol
    * State
    * Utility
* 管理Test Case
  * Mode
    * Standalone mode
    * WDIO Testrunner
* 支援promised
  * Default promised (內建promised)
  * Browser object: 一個公用變數, 可以取得公用資訊
  * Sychronized: 每一行保證promised
  * Asyncronous 可搭配 await
### 工具介紹
* Webdriverio 
* Browser driver manager
* Chimp
### 建構測試環境
### 快速建立前端測試 & Live demo
### 關於導入的建議
* 網站自動化測試，在一個已經上線的網站是否有建議從什麼地方開始做起，新功能或舊功能？
  * e2e: 10%, integration: 20%, unit: 70%
  * 從最重要的功能開始
* 但如果不補單元測試，直接開始寫前端測試會有什麼後果？
  * 不好維護的測試程式
  * 難以判斷測試結果
* 導入是一個組合性的問題
* 先請RD來建構整個架構
* 找曾經踩過雷的人

## Universal JavaScript?(洪名辰)

## How I learned to stop worrying and love the Polymer toolbox by Monica Dinculescu (Google Inc.)
* Polymer

## Reactive Programming In Action with RxJS 5(Paul Taylor)

## NIME: 使用 nodejs 快快樂樂開發輸入法( Lee)

## CodexJS: a conditional module bundler (Alex Liu)

## Date Visualization performance optmazation(Jim)

## 親愛的，我們來土炮一個 Google Docs 吧！(Fred Chien)

## Reference
* https://hackfoldr.org/jsdc2016
