# nodejs

## body parser
* 在 HTTP request 中，POST,PUT, PATCH 三種請求方法中包含 request body，Node.js 原生 HTTP module 中，request body 要基於 stream 的方式接收和解析。
* body-parser 是一個 HTTP request body 解析的 middleware，使用這個 module 可以解析 json, raw, text, urlencoded 格式的 request body
* Express 框架中就是使用這個 module 做為 request body 中解析的 middleware。

## util
* require('util').format
  * format string

## module.exports v.s exports
* example
  ```js
  // test.js
  var module_exports_something = require('./module_exports_something');
  var exports_something = require('./exports_something');
  
  module_exports_something();  // works
  exports_something();         // failed
  
  // module_exports_something.js
  module.exports = function() {
    ...
  }
  
  // exports_something.js
  exports = function() {
    ...
  }
  ```

## Reference
* basic
  * http://dreamerslab.com/blog/tw/node-js-basics/
* body parser
  * http://itbilu.com/nodejs/npm/EkDXWklVb.html
  * http://hao.jser.com/archive/9322/
* module pattern
  * https://my.oschina.net/chenzhiqiang/blog/129783
