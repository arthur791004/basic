# Mongo DB

## Mongoose
* connect
  * connect to mongodb
  ```js
    mongoose.connect('mongodb://host/db');
  ```
* models and schema
  * Models are defined by passing a Schema instance to mongoose.model.
  * create schema
  ```js
    const UserSchema = new mongoose.Schema({
      email: {
        type: String,
        index: { unique: true }
      },
      password: String,
      name: String
    });
  ```
  * create model
  ```js
    mongoose.model('MyModel', mySchema);
  ```
* methods v.s. statics
  * methods
    * we can call our Model methods when we have an instance of Model
    ```js
      AnimalSchema.methods.findSimilarType = function findSimilarType (cb) {
        return this.model('Animal').find({ type: this.type }, cb);
      };
    ```
  * statics
    * exist directly on your Model and call without having an instance of Model
    ```js
      AnimalSchema.statics.search = function search (name, cb) {
        return this.where('name', new RegExp(name, 'i')).exec(cb);
      }
    ```
* middleware
  * Middleware are defined at the Schema level and are applied when the methods init (when a document is initialized with data from MongoDB), save, and remove are called on a document instance.
  * There are two types of middleware, serial and parallel.
    * serial
      * They're executed one after the other, when each middleware calls next.
      ```js
        schema.pre('save', function (next) {
          // ...
        })
      ```
    * parallel
      * Parallel middleware can next() immediately, but the final argument will be called when all the parallel middleware have called done().
      ```js
        schema.pre('remove', true, function (next, done) {
          // ...
        })
      ```

## Reference
* http://mongoosejs.com/docs/2.7.x/docs/methods-statics.html
