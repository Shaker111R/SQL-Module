create table if not exists Artist (
	id_artist SERIAL primary key,
	name VARCHAR(60) unique not NULL
);

create table if not exists Genre (
	id_genre SERIAL primary key,
	name VARCHAR(50) unique not NULL
);

create table if not exists Artists_genre (
	id_artist INTEGER references Artist(id_artist),
	id_genre INTEGER references Genre(id_genre),
	constraint cpk_PG primary key (id_artist, id_genre)
);

create table if not exists Album (
	id_album SERIAL primary key,
	name VARCHAR(50) not null,
	release_year DATE not null
);

create table if not exists Album_artist (
	id_artist INTEGER references Artist(id_artist),
	id_album INTEGER references Album(id_album),
	constraint cpk_AA primary key (id_artist, id_album)
);

create table if not exists Track (
	id_track SERIAL primary key,
	name VARCHAR(50) not null,
	duratuion INTEGER not null,
		check(duratuion between 1 and 7000),
	id_album INTEGER references Album(id_album)
);

create table if not exists Collection (
	id_collect SERIAL primary key,
	name VARCHAR(60) not null,
	release_year DATE not null
);

create table if not exists C_track (
	id_collect INTEGER references Collection(id_collect),
	id_track INTEGER references Track(id_track),
	constraint cpk_CT primary key (id_collect, id_track)
);