create DATABASE IF NOT EXISTS website;
use website;

CREATE TABLE IF NOT EXISTS user (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  email  VARCHAR(100) UNIQUE NOT NULL,
  password TEXT NOT NULL,
  mobile_no VARCHAR(10),
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table if not exists social_user (
	id varchar(100) primary key,
    email varchar(100) unique not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    picture_url varchar(500),
    type enum('google','fb','custom','na','other') not null,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- drop table social_user;
-- truncate table social_user;
-- describe social_user;
-- select * from social_user;