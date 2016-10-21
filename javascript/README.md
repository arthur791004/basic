# Javascript

## scopes & closures
* scope
  * 變數及 function 的"作用域"或是"有效範圍"
  * 一個 function 一個 scope
* closures
  * 產生條件
    * 內部 function 存取了外部 function 的變數
    * 內部 function 能被外界直接調用
  * 特性
    * 內部 function 可存取外部變數，外部 function 不可存取內部變數
  * 常見錯誤
    ```js
    // wrong
    function addLinks() {
      for (var i = 0; i < 5; i++) {
        link = document.createElement('a');
        link.innerHTML = `link${i}`;
        link.onclick = function() {
          alert(i);
        }
        document.body.appendChild(link);
      }
    }
    
    window.onload = addLinks();
    
    // correct
    function addLinks() {
      for (var i = 0; i < 5; i++) {
        link = document.createElement('a');
        link.innerHTML = `link${i}`;
        link.onclick = (function(num) {
          return function() {
            alert(num);
          };
        })(i);
        document.body.appendChild(link);
      }
    }
    
    window.onload = addLinks();
    ```

## Functions
* 四種建立 function 的方法
  ```js
  function declaration() {
  
  }
  
  var funcExpression = function() {
  
  };
  
  var namedFuncExpression = function named() {
  
  };
  
  var fnConstructor = new Function();
  ```

## IIFE (Immediately Invoked Function Expression)
* 可以立即執行的 function
* examples
  ```js
  // format 1
  (function() {
  
  }());
  
  // format 2
  (function(parameters) {
  
  })(parameters);
  ```
* 何時使用
  * 全域變數的減少
  * 全域變數區域化

## this
* 當下這個 scope 的物件
* 常見錯誤
  * 在不同的 scope 使用 this，而 this 卻指向不是我們要的 object

## prototype

## callbacks
* 當一個函式執行完畢後所執行的那個 function
* 常見問題
  * callback hell
  * 執行 callback 後，function 繼續往下作
* 解決方法
  * Promise chain

## call & apply
* call
  * call 必須將 function 的參數一一帶入
  ```js
  fn.call(this, arg1, arg2, ...);
  ```
* apply
  * 只要在第二個參數帶入一個陣列即可
  ```js
  fn.apply(this, [arg1, arg2, ...]);
  ```

## ES6
* let & const
* class
* arrow function
* extendes parameter handling
  ```js
  // default parameter values
  function f(x, y = 7, z = 42) {
  
  }
  
  // reset parameter
  function f(x, y, ...a) {
  
  }
  
  // spread operator
  var params = ["hello", true, 7];
  f(1, 2, ...params);
  ```
* template literals
* Map/Set & WeakMap/WeakSet
* Promise
* import

## 常用第三方 Library

## Reference
* yahoo module pattern
  * http://yuiblog.com/blog/2007/06/12/module-pattern/
* scope & closures
  * http://dreamerslab.com/blog/tw/javascript-function-scopes-and-closures/
  * http://ithelp.ithome.com.tw/articles/10029457
  * http://taian.su/2012-10-17-explaining-javascript-scope-and-closures-by-robert-nyman/
* functions
  * https://blog.gtwang.org/programming/defining-javascript-functions/
* IIFE
  * http://www.victsao.com/blog/81-javascript/287-javascript-function-iife
* this
  * http://dreamerslab.com/blog/tw/javascript-this/
* prototype
  * http://blog.pulipuli.info/2010/09/javascriptprototype.html
* callbacks
  * http://dreamerslab.com/blog/tw/javascript-callbacks/
* call & apply
  * http://dreamerslab.com/blog/tw/javascript-call-and-apply/
* ES6
  * http://es6-features.org/#Constants
