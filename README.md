# SpringMVC-based-CinemaHallManagementSystem
Disclaimer: Seat arrangement section is still under development

Technologies used:
1. Spring MVC
2. Spring Security
3. Spring ORM
4. Spring AOP
5. MySQL

How to run this project:
1. Import pom.xml into your IDE
2. Configure smart tomcat and java(suitable version-8)
3. open mysql/datagrip
4. paste below query-
5. 
   CREATE TABLE user (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  enabled TINYINT(1) NOT NULL,
  created_on DATE,
  PRIMARY KEY (id)

);

CREATE TABLE customer (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  gender varchar(10) NOT NULL,
  date_of_birth date NOT NULL,
  user_id bigint(20) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY FK_CUSTOMER_USER (user_id),
  CONSTRAINT FK_CUSTOMER_USER FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE address (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  address VARCHAR(255),
  type ENUM('HOME','OFFICE','LOCAL'),
  customer_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_ADDRESS_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id)
);


CREATE TABLE customer_order (
  product_id BIGINT UNSIGNED NOT NULL,
  customer_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (product_id,customer_id),
  CONSTRAINT FK_CUSTOMER_ORDER_PRODUCT FOREIGN KEY (product_id) REFERENCES product (id),
  CONSTRAINT FK_CUSTOMER_ORDER_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id)
);

create table product
(
    id          bigint unsigned auto_increment
        primary key,
    link        varchar(255)    null,
    poster      varchar(255)    null,
    director    varchar(255)    null,
    released    varchar(255)    null,
    title       varchar(255)    null,
    rated       varchar(255)    null,
    runtime     varchar(255)    null,
    schedule_id bigint unsigned null,
    constraint product_schedule_id_fk
        foreign key (schedule_id) references schedule (id)
            on update cascade on delete cascade
);

create table schedule
(
    id         bigint unsigned auto_increment
        primary key,
    date       date            null,
    stime      time            null,
    etime      time            null,
    product_id bigint unsigned null,
    constraint schedule_product_id_fk
        foreign key (product_id) references product (id)
            on update cascade on delete cascade
);

5.run 
