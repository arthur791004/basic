# nodejs

## body parser
* 在 HTTP request 中，POST,PUT, PATCH 三種請求方法中包含 request body，Node.js 原生 HTTP module 中，request body 要基於 stream 的方式接收和解析。
* body-parser 是一個 HTTP request body 解析的 middleware，使用這個 module 可以解析 json, raw, text, urlencoded 格式的 request body
* Express 框架中就是使用這個 module 做為 request body 中解析的 middleware。

## Reference
* body parser
  * http://itbilu.com/nodejs/npm/EkDXWklVb.html
  * http://hao.jser.com/archive/9322/
