# React

## Compoent

### 三種寫法
* createElement
* class
```js
class App extends React.Componnet {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.dispatch({ type: 'app/create' });
  }
  render() {
    return <div onClick={ this.handleClick }>${this.props.name}</div>
  }
}
```
* Stateless Functional Component
```js
function App(props) {
  function handleClick() {
    props.dispatch({ type: 'app/create' });
  }
  return <div onClick={handleClick}>${props.name}</div>
}
```
  * 盡量使用此種方法，保持簡潔和 stateless。

## Middleware

## Redux

### redux-thunk

### redux-sagas

## Router

## CSS Modules

## Reference
