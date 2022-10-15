MongoDB Get Started
 
1.  Introduction
MongoDB (@ https://www.mongodb.com/) is one of the most popular NoSQL databases. It is document-oriented, and stores in BSON (Binary JSON).

"MongoDB is a general purpose, document-based, distributed database built for modern application developers and for the cloud era. No database makes you more productive."

[TODO] client-server diagram. Database organization - like MySQL.

2.  Installation
To install mongoDB:

Goto https://www.mongodb.com/ ⇒ "Software" ⇒ "Community Server" ⇒
(For Windows) In OS, select "Windows x64" ⇒ In Package, select "ZIP" ⇒ "Download" (e.g., "mongodb-win32-x86_64-2012plus-4.2.3.zip", 312KB) ⇒ UNZIP into a directory of your choice ⇒ Add the "bin" sub-directory into PATH (see "How to add a directory to the PATH").
(For macOS)
(For Ubuntu)
The "bin" sub-directory contains all the executables and tools:

mongod: for starting mongoDB server (with suffix 'd' for daemon or server)
mongo: for starting a command-line client
mongoimport, monoexport:
mongodump, mongorestore:
3.  Getting Started
First, create a data directory for mongo, say "c:/mongo/data".
Start a CMD/Terminal/BashShell. Launch mongoDB server by running "mongod.exe", where the suffix 'd' denotes daemon (i.e., server). Observe the console message.
mongod --dbpath "c:/mongo/data"
......
2020-03-06T23:24:13.298-0700 I  NETWORK  [listener] Listening on 127.0.0.1
2020-03-06T23:24:13.300-0700 I  NETWORK  [listener] waiting for connections on port 27017
......
Start "another" CMD/Terminal/BashShell. Launch the command-line client by running "mongo.exe" (without the suffix 'd' for client).
mongo
MongoDB shell version v4.2.3
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
......
> help
show dbs                     show database names
show collections             show collections in current database
show users                   show users in current database
show profile                 show most recent system.profile entries with time >= 1ms
show logs                    show the accessible logger names
show log [name]              prints out the last segment of log in memory, 'global' is default
use <db_name>                set current database
db.foo.find()                list objects in collection foo
db.foo.find( { a : 1 } )     list objects in foo where a == 1
it                           result of the last line evaluated; use to further iterate
DBQuery.shellBatchSize = x   set default number of items to display on shell
exit                         quit the mongo shell

// show databases
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB

// show collections (documents)
> show collections

// Create a database called "coffeeshopdb"
// Database will be created when you create the first collection
> use coffeeshopdb
switched to db coffeeshopdb

// Create a collection (document)
> db.createCollection("beverage")
{ "ok" : 1 }

> show dbs
admin         0.000GB
coffeeshopdb  0.000GB
config        0.000GB
local         0.000GB
> show collections
beverage

// Insert one row
> db.beverage.insert({ id: 1, name: 'Espresso', price: 5.5 })
WriteResult({ "nInserted" : 1 })

// Insert multiple rows as an array
> db.beverage.insert([
      { id: 2, name: 'Cappuccino', price: 5.6 },
      { id: 3, name: 'Latte', price: 5.7 }
    ])
BulkWriteResult({
  "writeErrors" : [ ],
  "writeConcernErrors" : [ ],
  "nInserted" : 2,
  "nUpserted" : 0,
  "nMatched" : 0,
  "nModified" : 0,
  "nRemoved" : 0,
  "upserted" : [ ]
})

// Query (or Find)
> db.beverage.find().pretty()
{
  "_id" : ObjectId("5e63453cd24e043c085e1014"),
  "id" : 1,
  "name" : "Espresso",
  "price" : 5.5
}
{
  "_id" : ObjectId("5e63461cd24e043c085e1015"),
  "id" : 2,
  "name" : "Cappuccino",
  "price" : 5.6
}
{
  "_id" : ObjectId("5e63461cd24e043c085e1016"),
  "id" : 3,
  "name" : "Latte",
  "price" : 5.7
}

// Find with filter
> db.beverage.find({ id : 3 }).pretty()
{
  "_id" : ObjectId("5e63461cd24e043c085e1016"),
  "id" : 3,
  "name" : "Latte",
  "price" : 5.7
}

// Update with $set
> db.beverage.update({ name: 'Latte' }, { $set: { name: 'Latte New' }})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.beverage.find({ id: 3 } ).pretty()
{
  "_id" : ObjectId("5e63461cd24e043c085e1016"),
  "id" : 3,
  "name" : "Latte New",
  "price" : 5.7
}

// Update with $inc
> db.beverage.update({ name: 'Latte New' }, { $inc: { price: -1.1 } })
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.beverage.find({ id: 3 }).pretty()
{
  "_id" : ObjectId("5e63461cd24e043c085e1016"),
  "id" : 3,
  "name" : "Latte New",
  "price" : 4.6
}

// Update with $mul
> db.beverage.update({ name: { $in: ['Espresso', 'Cappuccino'] } }, { $mul: { price: 1.2 }})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.beverage.find({ id: { $in: [1, 2] } }).pretty()
{
  "_id" : ObjectId("5e63453cd24e043c085e1014"),
  "id" : 1,
  "name" : "Espresso",
  "price" : 6.6
}
{
  "_id" : ObjectId("5e63461cd24e043c085e1015"),
  "id" : 2,
  "name" : "Cappuccino",
  "price" : 5.6
}

> exit
bye
