# framework
React v.s Angualr2 v.s vue2

## 整理
| Framework | Data Flow  | Mobile       | CLI              | UI               |
| --------- | ---------- | ------------ | ---------------- | ---------------- |
| React     | Flux/Redux | ReactNative  | create-react-app | Material-UI      |
| Angular2  | RxJS/Redux | NativeScript | ng               | angular materail |
| Vue2      | Vuex       | Weex         | vue-cli          | vue-material     |

## basic template syntax
| Framework | Text       | Model                 | attributes  | For-Loop                   | Events     | If     |
| --------- | ---------- | --------------------- | ----------- | -------------------------- | ---------- | ------ |
| React     | { data }   |                       |             | { array.map to component } |            |        |
| Angular2  | {{ data }} | [ngModel]/([ngModel]) | [attr]      | *ngFor="let todo of todos" | (click)    | [ngIf] |
| Vue2      | {{ data }} | v-model               | v-bind:attr | v-for="todo in todos"      | v-on:click | v-if   |
* angular2 data flow: ngrx-store/ng2-redux

## Reference
* https://angular.io/docs/ts/latest/guide/template-syntax.html
* https://vuejs.org/v2/guide/syntax.html
