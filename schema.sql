create table genre (
  id_genre int not null auto_increment,
  genre_name varchar(50) not null,
  primary key (id_genre)
)engine=innodb;

create table users(
  id_user int not null auto_increment,
  user_role int not null,
  username varchar(50) not null,
  password text not null,
  created_at date,
  primary key (id_user)
)engine=innodb;

create table packet (
  id_packet int not null auto_increment,
  packet_type varchar(50),
  description text,
  primary key (id_packet)
)engine=innodb;

create table payment (
  id_payment int not null auto_increment,
  payment_method varchar(50) not null,
  voucher varchar(255),
  payment_date date,
  primary key (id_payment)
)engine=innodb;

create table movie (
  id_movie int not null auto_increment,
  title varchar(255) not null,
  image_url text,
  rating varchar(255),
  movie_date date not null,
  detail text,
  author varchar(255),
  caster varchar(255),
  watch_total int,
  id_genre int,
  primary key (id_movie),
  constraint fk_movie_genre foreign key (id_genre) references genre(id_genre)
)engine=innodb;

create table series (
  id_series int not null auto_increment,
  title varchar(255) not null,
  image_url text,
  rating varchar(255),
  movie_date date not null,
  detail text,
  author varchar(255),
  caster varchar(255),
  watch_total int,
  id_genre int,
  primary key (id_series),
  constraint fk_series_genre foreign key (id_genre) references genre(id_genre)
)engine=innodb;

create table my_favorite (
  id_favorite int not null auto_increment,
  id_movie int,
  id_series int,
  id_user int,
  primary key (id_favorite),
  constraint fk_fav_movie foreign key (id_movie) references movie(id_movie),
  constraint fk_fav_series foreign key (id_series) references series(id_series),
  constraint fk_fav_user foreign key (id_user) references users(id_user)
)engine=innodb;

create table orders (
  id_order int not null auto_increment,
  id_packet int not null,
  id_payment int not null,
  id_user int not null,
  fee int not null,
  total int not null,
  primary key (id_order),
  constraint fk_order_packet foreign key (id_packet) references packet(id_packet),
  constraint fk_order_payment foreign key (id_payment) references payment(id_payment),
  constraint fk_order_user foreign key (id_user) references users(id_user)
)engine=innodb;

