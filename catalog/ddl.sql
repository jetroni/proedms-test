create schema `experiment`;
create schema `sakila`;
create schema `sakila_test`;
create table `experiment`.`actor` (
  `actor_id` smallint unsigned not null auto_increment,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila`.`TESTCHAR` (
  `TESTCHAR` char(1) null,
  `maxchar` varchar(16382) null
);
create table `sakila`.`actor` (
  `actor_id` smallint unsigned not null,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila`.`actor1` (
  `actor_id` smallint unsigned not null,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila`.`actor2` (
  `actor_id` smallint unsigned not null,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila`.`address` (
  `address_id` smallint unsigned not null,
  `address` varchar(50) not null,
  `address2` varchar(50) null,
  `district` varchar(20) not null,
  `city_id` smallint unsigned not null,
  `postal_code` varchar(10) null,
  `phone` varchar(20) not null,
  `location` other null,
  `last_update` timestamp not null,
  constraint `PRIMARY`
    primary key (`address_id`)
);
create table `sakila`.`category` (
  `category_id` tinyint unsigned not null,
  `name` varchar(25) not null,
  `last_update` timestamp not null,
  constraint `PRIMARY`
    primary key (`category_id`)
);
create table `sakila`.`city` (
  `city_id` smallint unsigned not null,
  `city` varchar(50) not null,
  `country_id` smallint unsigned not null,
  `last_update` timestamp not null,
  `nullable` varchar(100) null,
  constraint `PRIMARY`
    primary key (`city_id`)
);
create table `sakila`.`country` (
  `country_id` smallint unsigned not null,
  `country` varchar(50) not null,
  `last_update` timestamp not null,
  constraint `PRIMARY`
    primary key (`country_id`)
);
create table `sakila`.`customer` (
  `customer_id` smallint unsigned not null,
  `store_id` tinyint unsigned not null,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `email` varchar(50) null,
  `address_id` smallint unsigned not null,
  `active` bit not null,
  `create_date` timestamp not null,
  `last_update` timestamp null,
  constraint `PRIMARY`
    primary key (`customer_id`)
);
create table `sakila_test`.`actor` (
  `actor_id` smallint unsigned not null auto_increment,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila_test`.`address` (
  `address_id` smallint unsigned not null auto_increment,
  `address` varchar(50) not null,
  `address2` varchar(50) null,
  `district` varchar(20) not null,
  `city_id` smallint unsigned not null,
  `postal_code` varchar(10) null,
  `phone` varchar(20) not null,
  `location` other null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`address_id`)
);
create table `sakila_test`.`category` (
  `category_id` tinyint unsigned not null auto_increment,
  `name` varchar(25) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`category_id`)
);
create table `sakila_test`.`country` (
  `country_id` smallint unsigned not null auto_increment,
  `country` varchar(50) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`country_id`)
);
create table `sakila_test`.`film` (
  `film_id` smallint unsigned not null auto_increment,
  `title` varchar(128) not null,
  `description` text null,
  `release_year` date null,
  `language_id` tinyint unsigned not null,
  `original_language_id` tinyint unsigned null,
  `rental_duration` tinyint unsigned not null default 3,
  `rental_rate` decimal(4, 2) not null default 4.99,
  `length` smallint unsigned null,
  `replacement_cost` decimal(5, 2) not null default 19.99,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`film_id`)
);
create table `sakila_test`.`film_actor` (
  `actor_id` smallint unsigned not null,
  `film_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (
      `actor_id`,
      `film_id`
    )
);
create table `sakila_test`.`film_category` (
  `film_id` smallint unsigned not null,
  `category_id` tinyint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (
      `film_id`,
      `category_id`
    )
);
create table `sakila_test`.`film_text` (
  `film_id` smallint not null,
  `title` varchar(255) not null,
  `description` text null,
  constraint `PRIMARY`
    primary key (`film_id`)
);
create table `sakila_test`.`language` (
  `language_id` tinyint unsigned not null auto_increment,
  `name` char(20) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`language_id`)
);
create table `sakila_test`.`newtable` (
  `smallint_col` bigint unsigned not null auto_increment
);
create table `sakila_test`.`testtest` (
  `testcomment` varchar(100) null
);
alter table `sakila_test`.`film`
  add constraint `fk_film_language`
    foreign key (`language_id`)
    references `sakila_test`.`language` (`language_id`);
alter table `sakila_test`.`film`
  add constraint `fk_film_language_original`
    foreign key (`original_language_id`)
    references `sakila_test`.`language` (`language_id`);
alter table `sakila_test`.`film_actor`
  add constraint `fk_film_actor_actor`
    foreign key (`actor_id`)
    references `sakila_test`.`actor` (`actor_id`);
alter table `sakila_test`.`film_actor`
  add constraint `fk_film_actor_film`
    foreign key (`film_id`)
    references `sakila_test`.`film` (`film_id`);
alter table `sakila_test`.`film_category`
  add constraint `fk_film_category_category`
    foreign key (`category_id`)
    references `sakila_test`.`category` (`category_id`);
alter table `sakila_test`.`film_category`
  add constraint `fk_film_category_film`
    foreign key (`film_id`)
    references `sakila_test`.`film` (`film_id`);
comment on column `sakila_test`.`testtest`.`testcomment` is 'descriptionoffield';
create unique index `PRIMARY` on `experiment`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `experiment`.`actor`(`last_name` asc);
create unique index `PRIMARY` on `sakila`.`actor`(`actor_id` asc);
create unique index `PRIMARY` on `sakila`.`actor1`(`actor_id` asc);
create unique index `PRIMARY` on `sakila`.`actor2`(`actor_id` asc);
create unique index `PRIMARY` on `sakila`.`address`(`address_id` asc);
create unique index `PRIMARY` on `sakila`.`category`(`category_id` asc);
create unique index `PRIMARY` on `sakila`.`city`(`city_id` asc);
create unique index `PRIMARY` on `sakila`.`country`(`country_id` asc);
create unique index `PRIMARY` on `sakila`.`customer`(`customer_id` asc);
create unique index `PRIMARY` on `sakila_test`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `sakila_test`.`actor`(`last_name` asc);
create unique index `PRIMARY` on `sakila_test`.`address`(`address_id` asc);
create index `idx_fk_city_id` on `sakila_test`.`address`(`city_id` asc);
create index `idx_location` on `sakila_test`.`address`(`location` asc);
create unique index `PRIMARY` on `sakila_test`.`category`(`category_id` asc);
create unique index `PRIMARY` on `sakila_test`.`country`(`country_id` asc);
create unique index `PRIMARY` on `sakila_test`.`film`(`film_id` asc);
create index `idx_fk_language_id` on `sakila_test`.`film`(`language_id` asc);
create index `idx_fk_original_language_id` on `sakila_test`.`film`(`original_language_id` asc);
create index `idx_title` on `sakila_test`.`film`(`title` asc);
create unique index `PRIMARY` on `sakila_test`.`film_actor`(
  `actor_id` asc,
  `film_id` asc
);
create index `idx_fk_film_id` on `sakila_test`.`film_actor`(`film_id` asc);
create unique index `PRIMARY` on `sakila_test`.`film_category`(
  `film_id` asc,
  `category_id` asc
);
create index `fk_film_category_category` on `sakila_test`.`film_category`(`category_id` asc);
create unique index `PRIMARY` on `sakila_test`.`film_text`(`film_id` asc);
create index `idx_title_description` on `sakila_test`.`film_text`(
  `title` asc,
  `description` asc
);
create unique index `PRIMARY` on `sakila_test`.`language`(`language_id` asc);
create unique index `smallint_col` on `sakila_test`.`newtable`(`smallint_col` asc);