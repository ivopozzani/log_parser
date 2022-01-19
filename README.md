# Log Parser

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This project was built as an assignment for a trainee program. It works as a log parser for a specific log file named "games.log".
	
## Technologies
Project is created with:
* Ruby: 3.1.0
* RSpec: 3.10 (https://rspec.info/)
    - rspec-core: 3.10.1
    - rspec-expectations: 3.10.2
    - rspec-mocks: 3.10.2
    - rspec-support: 3.10.3
* rvm: 1.29.12  (https://rvm.io/rvm/install)
	
## Setup
To run this project, make sure you have all technologies above previously installed (follow links above if necessary):

* Clone repository using

```
$ git clone https://github.com/ivopozzani/log_parser.git

```
* Navigate to ./log_parser
* Run Ruby

```
$ ruby main.rb

```

* To run rspec test navigate to ./log_parser then run command below (it should return you a report with all examples and failures)

```
$ rspec spec --format documentation

```

