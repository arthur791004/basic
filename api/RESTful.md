# RESTful API

## What
* REST (REpresentational State Transfer)
  * [REST 原則](https://en.wikipedia.org/wiki/Representational_state_transfer)
  * 指的是一組架構約束條件和原則。滿足這些約束條件和原則的應用程序或設計就是 RESTful
* RESTful
  * RESTful API 是一種設計風格，這種風格使 API 設計具有整體一致性，易於維護、擴展，並且充份利用HTTP協定的特點。

## Why
* 客戶端 Cache 節省流量
  * 不需每次重新傳送 Presentation
    * Cache Presentation
    * Data Binding 交給 browser 處理
* 資料與介面分離
* 節省伺服器計算資源
  * 可以不再 server 做的東西，就不要再 server 作
  * Data Binding 交給瀏覽器處理
* API 能重複使用

## 謬誤
* server side 需要 stateless
  * RESTful 只要求 application server 是 stateless，server side 其他部分可以 stateful
* 要新一代支援 RESTful 的 NoSQL 資料庫
  * RESTful 和資料庫沒有直接關係
* 一定要用 HTTP 的 GET, PUT, POST, DELETE
  * 統一介面只建議善用 HTTP，使用其他介面也能滿足 RESTful 要求

## REST 條件/原則
* client-server
* cacheable
* layered system
  * | client | HA Proxy | Stateless Application Server | Database |
* stateless protocol
  * stateless: 不應該假設 server 知道"現在狀態" (隨時會斷線)
  * atomic
  * 足夠完整的資料
  * 重新呼叫
* uniform interface
  * 所有介面都應該基於物件，而不是行動
  * 一個物件正常有 4 種行動 CRUD
  * Examples
  ```js
  /**
   * v3                   : 使用第三版本的 /user/1234/book/54389
   * /user/1234/book/54389: 使用者 1234 屬下的書本 54389
   * GET                  : 取得書本內容
   * PUT                  : 更改書本內容
   * DELETE               : 刪除出本內容
   */
  /v3/user/1234/book/54389
  
  /**
   * GET : 取得使用者 1234 屬下的書本
   * POST: 在使用者 1234 屬下建立新的書本
   */
  /v3/user/1234/book/
  ```

## Reference
* https://zh.wikipedia.org/wiki/REST
* https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/08.3.md
* https://ihower.tw/blog/archives/1542
* https://tw.twincl.com/programming/*641y
* http://blog.kkbruce.net/2012/04/aspnet-web-api-2-rest.html#.WAmqIvl9670
* [軟體架構風格介紹-part-i-從了解-rest-到設計-restful](https://blog.toright.com/posts/725/representational-state-transfer-%E8%BB%9F%E9%AB%94%E6%9E%B6%E6%A7%8B%E9%A2%A8%E6%A0%BC%E4%BB%8B%E7%B4%B9-part-i-%E5%BE%9E%E4%BA%86%E8%A7%A3-rest-%E5%88%B0%E8%A8%AD%E8%A8%88-restful%EF%BC%81.html)
