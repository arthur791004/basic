# Database

### NoSQL
* 非關聯式資料庫
* 不使用 SQL 作為查詢語言
* 資料的儲存可以不需要固定的schema
* High scalability

### 特性
* Schema-less 
* Shared nothing architecture 
* Elasticity
* Sharding 
* Asynchronous replication
* BASE instead of ACID

### 理論基礎
* CAP
  * [C]onsistency 一致性
  * [A]vailability 可用性
  * [P]artition Tolerance 分區容錯性
* BASE
  * [B]asically [A]vailable 基本可用性
  * [A]vailability 狀態可以有一段時間不同步
  * [E]ventual consistency 最終一致性

### Pros

### Cons

## Examples
* document
  * mongodb, couchDB, couchBase
* in-memory
  * memcacheDB, redis
* key-value
  * Hadoop HBase, Amazon Dynamo
* graph
  * GraphDB

## SQL

### Pros

### Cons

### Examples
* SQLite, MySQL, postgreSQL

## Compare
![](https://acom.azurecomcdn.net/80C57D/cdn/mediahandler/docarticles/dpsmedia-prod/azure.microsoft.com/zh-tw/documentation/articles/documentdb-nosql-vs-sql/20160812120527/nosql-vs-sql-comparison.png)

## Reference
* http://wp.mlab.tw/?p=2245
* https://azure.microsoft.com/zh-tw/documentation/articles/documentdb-nosql-vs-sql/
