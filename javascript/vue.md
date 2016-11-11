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

## Features

### Scoped CSS
* 在 \<style> 加入 scoped，使得 css 只會作用在當前的 component
* Example
```html
<style scoped>
.example {
  color: red;
}
</style>

<template>
  <div class="example">hi</div>
</template>
<!-- compile to the following -->
<style>
.example[_v-f3f3eg9] {
  color: red;
}
</style>

<template>
  <div class="example" _v-f3f3eg9>hi</div>
</template>
```

### CSS Modules
* Just add the module attribute to your \<style>
* This will turn on CSS Modules mode for css-loader, and the resulting class identifier object will be injected into the component as a computed property with the name $style
* You can use it in your templates with a dynamic class binding:
```html
<template>
  <p :class="$style.red">
    This should be red
  </p>
</template>
```

### Post CSS
### Hot Reload

## Reference
* http://vue-loader.vuejs.org/en/index.html
