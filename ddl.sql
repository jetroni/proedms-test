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
create table `sakila_test`.`actor` (
  `actor_id` smallint unsigned not null auto_increment,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create unique index `PRIMARY` on `sakila`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `sakila`.`actor`(`last_name` asc);
create unique index `PRIMARY` on `sakila_test`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `sakila_test`.`actor`(`last_name` asc);