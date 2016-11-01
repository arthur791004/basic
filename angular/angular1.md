# angular 1

## Directive
### scope
* 若給一物件則會建立一個 isolate scope，若指定為 true 則繼成自 parent scope
* @
  * 綁訂一個局部 scope 屬性到當前 dom 節點的屬性值。结果總是一個字符串，因為 dom 屬性是字符串。
  * one way binding
* =
  * 通過 directive 的 attr 屬性的值在局部 scope 的屬性和 parent scope 屬性名之間建立雙向绑定。
  * two way binding
* &
  * 提供一種方式執行一个表達式在 parent scope 的上下文中。如果没有指定 attr 名稱，則屬姓名稱為相同的本地名稱。
  * 通常是 function
  * Example
  ```js
  // directive.html
  <example handle-click="handleClick(param1, param2)" variable="variable"></example>
  
  // directive.js
  angular
    .module('<module>')
    .directive('example', exampleDirective);

    /* @ngInject */
    function exampleDirective() {
      return {
        restrict: 'E',
        scope: {
          variable: '=',
          handleClick: '&'
        },
        template: '<div ng-click="handleClick({ param1: param1, param2: param2})>{{ variable }}</div>',
        link: function($scope, $elem, $attrs) {
          ...
        }
      };
    }
  ```

## Reference
* http://exile1030-blog.logdown.com/posts/168283-customizing-the-angularjs-directive-2
