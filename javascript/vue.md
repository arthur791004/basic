# Vue

## Component Spec

### 檔案名稱
[component].vue

### 檔案內容
* 由三個部分所組成
  * \<template>
  * \<script>
  * \<style>
* Example
```html
<template>
  <div class="example">{{ msg }}</div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Hello world!'
    }
  }
}
</script>

<style>
.example {
  color: red;
}
</style>
```
### vue-loader
* 會 parse 檔案，並檢查每個部份的 language block，丟到對應的 loader
* 支援 non-default languages，如 CSS pre-processors and compile-to-HTML template languages, by specifying the lang attribute for a language block
* Example: 使用 sass 撰寫 css
```html
<style lang="sass">
  /* write SASS! */
</style>
```

### Language Block
* \<template>
* \<script>
* \<style>

### Src Imports
* 如果想要切割 Vue Component 成多個檔案，可以透過 src attribute 把他們 import 進來
* Example
```html
<template src="./template.html"></template>
<script src="./script.js"></script>
<style src="./style.css"></style>
```

## Quick Start
```bash
npm install -g vue-cli
vue init webpack-simple <proejct-name>
cd <proejct-name>
npm install
npm run dev # ready to go!
```

## Reference
* http://vue-loader.vuejs.org/en/index.html
