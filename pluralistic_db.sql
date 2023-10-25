drop database pluralisticdb;
drop user pluralistic;

create user pluralistic with password 'password';
create database pluralisticdb with template=template0 owner=pluralistic;
\connect pluralisticdb;
alter default privileges grant all on tables to pluralistic;
alter default privileges grant all on sequences to pluralistic



create table pl_users(
user_id integer primary key not null,
first_name varchar(28) not null,
last_name varchar(28) not null,
email varchar(30) not null,
password text not null
);

create table pl_productCategories(
category_id integer primary key not null,
user_id integer not null,
title varchar(20) not null,
description varchar(50) not null

)

alter table pl_productCategories add constraint  cat_users_fk
foreign key(user_id) references pl_users(user_id);

create table pl_orders(
order_id integer primary key not null,
category_id integer not null,
user_id integer not null,
price numeric(10,2) not null,

order_date bigint not null,
)
alter table pl_orders add constraint order_cat_fk
foreign key(category_id) references pl_productCategories(category_id);
alter table pl_orders add constraint order_users_fk
foreign key (user_id) references pl_users(user_id);


create table pl_products(
product_id integer primary key not null,
category_id integer not null,
product_price numeric(10,2) not null
)
alter table pl_products add constraint pro_detail_fk
foreign key(category_id) references pl_orders(category_id);


create sequences pl_users_seq increment 1 start 1;
create sequences pl_productCategories_seq increment 1 start 1;
create sequences pl_orders_seq increment 1 start 1;
create sequences pl_products_seq increment 1 start 1;
