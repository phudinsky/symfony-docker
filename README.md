#About
This repository is based on [intellectsoft-uk/symfony-skeleton](https://github.com/intellectsoft-uk/symfony-skeleton), but adapted for Symfony 2.8


#Required software
* Docker 1.10+
* Docker-compose 1.7+
* Docker-machine 0.7+

#Example of usage
* Clone project `git clone https://github.com/phudinsky/symfony-docker`
* Go to created directory `cd symfony-docker`
* Clone your project `git clone https://github.com/phudinsky/some-project symfony`
* Run `shortcuts/composer install` command to install dependecies
* Update parameters using env variables from .env file
* Run `docker-compose up -d`
* Run `shortcuts/console doctrine:database:create` to create database
* Run `shortcuts/console doctrine:migrations:migrate` to run migration scripts
* Run `shortcuts/console doctrine:fixtures:load` to load base data
