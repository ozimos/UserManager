[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# User Manager

This repository contains a simple demo API built with NodeJS.
The API is used to manage users in a MongoDB database.

### Development
This application was developed using [ExpressJS](http://expressjs.com/). MongoDB was used for persisting data with [Mongoose](https://mongoosejs.com/) as [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping).

### Installation with Docker Containers
* Start up your terminal (or Command Prompt on Windows OS).
* Clone the repository to a local directory.
* Navigate to the project folder using `cd UserManager` on your terminal (or command prompt)
* Linux users may either install both docker and docker-compose by running the `install_linux.sh` file in the project root from the terminal as a user with administrator privileges, or they may install by using the instructions below.
* Visit https://docs.docker.com/engine/installation/ to install the appropriate version of docker for your operating system.
* Visit https://docs.docker.com/compose/install/ to install the appropriate version of docker-compose for your operating system.
* Confirm installation of  docker and docker-compose with the commands `docker --version`  and `docker-compose --version` respectively.
* You may modify the `.env` file in your root directory as described in `.env` file or you may leave the preset values as-is.
* After this, you can then start the containers by running the command: `docker-compose up` from the terminal in the project root directory as a user with administrator privilege.

### Installation without Docker Containers
* Start up your terminal (or Command Prompt on Windows OS).
* Ensure that you have `node` and `mongodb` installed on your PC.
* Clone the repository to a local directory.
* Navigate to the project folder using `cd UserManager` on your terminal (or command prompt)
* After cloning, install the application's dependencies with the command `npm install`.
* Modify the `.env` file in your root directory as described in `.env` file. Variables such as DB_URL (which must be a mongoDB URL) and PORT are defined in the .env file and it is essential you set the values of the variables to match your local setup environment before running the application. You may ignore the variables in the database variables section. They are not required when not using containers.
```
PORT=3000
DB_URL='mongodb://john:doe@localhost:27017/databaseName'
```
* Ensure the mongodb service is running.
* After this, you can then start the server with the command: `npm run start-local`.


### Testing
To ensure that your installation is successful you'll need to run tests.
The command: `npm test` makes this possible. It isn't functional right now, but once it's done you'll be notified via the README.

### API Documentation
The API only has one endpoint which is the `/users` endpoint for saving users to the database. The endpoint works with the HTTP verbs: `POST`, `GET`, `PUT`, `DELETE`.

###### POST HTTP Request
-   `POST` /users
-   INPUT:
```x-form-url-encoded
name: John Doe
email: john.doe@gmail.com
password: johndoe
```

###### HTTP Response

-   HTTP Status: `201: created`
-   JSON data
```json
{
  "_id": "59071791b0lkscm2325794",
  "name": "John Doe",
  "email": "john.doe@gmail.com",
  "password": "johndoe",
  "__v": 0
}
```

###### GET HTTP Response
-   `GET` /users

```json
[
    {
        "_id": "59071791b0lkscm2325794",
        "name": "John Doe",
        "email": "john.doe@gmail.com",
        "password": "johndoe",
        "__v": 0
    }
]
```

###### GET HTTP Response
-   `GET` /users/:id

```json
{
    "_id": "59071791b0lkscm2325794",
    "name": "John Doe",
    "email": "john.doe@gmail.com",
    "password": "johndoe",
    "__v": 0
}
```

###### DELETE HTTP Response
-   `DELETE` /users/:id

```json
User John Doe was deleted
```

###### POST HTTP Request
-   `PUT` /users/:id
-   INPUT:
```x-form-url-encoded
name: Jane Doe
email: jane.doe@gmail.com
password: janedoe
```

###### HTTP Response

-   HTTP Status: `200: OK`
-   JSON data
```json
{
  "_id": "59071791b0lkscm2325794",
  "name": "Jane Doe",
  "email": "jane.doe@gmail.com",
  "password": "janedoe",
  "__v": 0
}
```



### Author
**Olajide Bolaji 'Nuel** - Software Developer at Andela
