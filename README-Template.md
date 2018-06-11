# Project Title

Henry Ford assembly line

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Java IDE

* VS Code or equivallent

* Docker

### Installing

After installing Docker, you need to run the folowing commands in the
terminal (powerShell for Windows):
```
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=VMware@123' -p 1433:1433 -d microsoft/mssql-server-linux

```
This will produce a container in which the data base is stored.

To see the running containers in docker, write:
```
docker ps

```

After that, you have to configure VS Code to connect to that server.
First you need to create a new sql script file. Then press 'F1' and write MS SQL Connect,
after that click 'Create connection profile' and enter the folowing:

```
servername: localhost
username: sa
password: VMware@123

```
After the connection establishment, you are ready to use the application.
The location of the Main app class is at: src/com/MainApp.java

Once the program is started, the database Factory is created and you can
make additional queries in the VS Code sql script file with the established connection.

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

The tests are located in the test/ folder of the application.

### Break down into end to end tests

* Create car and suv tests
  These tests are testing the create command with various cases.

* Delete car and suv tests
  These tests are testing the deletete command as well as print command
  which is used to verify the results of the tests.

* File read test is testing the functionality to sequentially read and execute
  the commands in a given file.

## Author

* **Petar Petrov** - *Initial work*

## License

This project has no license.

