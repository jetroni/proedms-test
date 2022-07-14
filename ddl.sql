create schema `sakila`;
create schema `sakila_test`;
create table `sakila`.`actor` (
  `actor_id` smallint unsigned not null auto_increment,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila`.`address` (
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
create unique index `PRIMARY` on `sakila`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `sakila`.`actor`(`last_name` asc);
create unique index `PRIMARY` on `sakila`.`address`(`address_id` asc);
create index `idx_fk_city_id` on `sakila`.`address`(`city_id` asc);
create index `idx_location` on `sakila`.`address`(`location` asc);
create unique index `PRIMARY` on `sakila_test`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `sakila_test`.`actor`(`last_name` asc);
create unique index `PRIMARY` on `sakila_test`.`address`(`address_id` asc);
create index `idx_fk_city_id` on `sakila_test`.`address`(`city_id` asc);
create index `idx_location` on `sakila_test`.`address`(`location` asc);