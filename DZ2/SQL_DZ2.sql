CREATE TABLE IF NOT EXISTS Artist (
	id_artist SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
	id_genre SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists_genre (
	id_artist INTEGER REFERENCES Artist(id_artist),
	id_genre INTEGER REFERENCES Genre(id_genre),
	CONSTRAINT cpk_PG PRIMARY KEY (id_artist, id_genre)
);

CREATE TABLE IF NOT EXISTS Album (
	id_album SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Album_artist (
	id_artist INTEGER REFERENCES Artist(id_artist),
	id_album INTEGER REFERENCES Album(id_album),
	CONSTRAINT cpk_AA PRIMARY KEY (id_artist, id_album)
);

CREATE TABLE IF NOT EXISTS Track (
	id_track SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	duratuion INTEGER NOT NULL,
		CHECK(duratuion BETWEEN 1 AND 7000),
	id_album INTEGER REFERENCES Album(id_album)
);

CREATE TABLE IF NOT EXISTS Collection (
	id_collect SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS C_track (
	id_collect INTEGER REFERENCES Collection(id_collect),
	id_track INTEGER REFERENCES Track(id_track),
	CONSTRAINT cpk_CT PRIMARY KEY (id_collect, id_track)
);