# angular2

## Module
```js
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})

export class AppModule { }
```
* @NgModule: 用來描述這是一個 module
* declarations: view dependency, such as components, directives, pipes
* exports: the subset of declarations that should be visible and usable in the component templates of other modules.
* imports: modules dependency
* providers: creators of services that this module contributes to the global collection of services
* bootstrap: 設定 root component

## Component
* ng g component \<component>
```js
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers:  [ HeroService ]
})

export class AppComponent {
  title = 'app works!';
}
```
* @Component: ES6提出來的一種 decorator 語法，用來描述這是一個 component
* moduleId: sets the source of the base address (module.id) for module-relative URLs such as the templateUrl.
* selector: 用來表示在HTML上的哪個element要套用這個component
* templateUrl: 用來表示這個component的view存放位置
* styleUrls: 用來加入專屬於這個component的css檔案位置
* providers: array of dependency injection providers for services that the component requires

## templates
* tells Angular how to render the component

## metadata
* tells Angular how to process a class, such as @NgModule, @Component

## 4 types of data binding
![](https://angular.io/resources/images/devguide/architecture/databinding.png)
### interpolation binding (內嵌)
```html
<!-- variable -->
<h1>{{ title }}</h1>
<!-- function -->
<h2>{{ '現在時間 : ' + getDate() }}</h2>
```
### property binding
```html
<input type="text" [placeholder]="placeholderText" />
```
### event binding
```html
<button (click)="addTodo($event)">增加</button>
```
### two way binding
```html
<input type="text" [(ngModel)]="todoText" />
```

## directives
```html
<li *ngFor="let hero of heroes"></li>
<hero-detail *ngIf="selectedHero"></hero-detail>
```

## services
```js
export class HeroService {
  private heroes: Hero[] = [];

  constructor(
    private backend: BackendService,
    private logger: Logger) { }

  getHeroes() {
    this.backend.getAll(Hero).then( (heroes: Hero[]) => {
      this.logger.log(`Fetched ${heroes.length} heroes.`);
      this.heroes.push(...heroes); // fill cache
    });
    return this.heroes;
  }
}
```

## dependency injection
![](https://angular.io/resources/images/devguide/architecture/injector-injects.png)
```js
constructor(private service: HeroService) { }
```

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
* https://angular.io/docs/ts/latest/guide/architecture.html#!#data-binding
* https://github.com/angular/angular-cli
