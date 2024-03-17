INSERT INTO Artist (id_artist, name) 
VALUES (1, 'Eminem'),
(2, 'Кипелов'),
(3, 'Бах'),
(4, 'Клава Кока'),
(5, 'D12');

INSERT INTO Genre (id_genre, name) 
VALUES (1, 'Classic'),
(2, 'Pop'),
(3, 'Rap'),
(4, 'Rock');

INSERT INTO Artists_genre (id_genre, id_artist) 
VALUES (1, 3),
(2, 4),
(3, 1),
(4, 2),
(3, 5);

INSERT INTO Album (id_album, name, release_year) 
VALUES (1, 'Кантаты Баха', 1708),
(2, 'Герой асфальта', 1987),
(3, 'Encore', 2004),
(4, 'Неприлично о личном', 2019);

INSERT INTO Album_artist (id_album, id_artist) 
VALUES (1, 3),
(2, 2),
(3, 1),
(4, 4),
(3, 5);

INSERT INTO Track (id_track, name, duratuion, id_album) 
VALUES (1, 'BWV 71 — Gott ist mein König', 1440, 1),
(2, 'Герой асфальта', 311, 2),
(3, 'Улица роз', 356, 2),
(4, 'My 1st Single', 303, 3),
(5, 'One Shot 2 Shot', 267, 3),
(6, 'Мне пох', 158, 4);

INSERT INTO Collection (id_collect, name, release_year) 
VALUES (1, 'Всё подряд', 2000),
(2, 'Liric collection', 2005),
(3, 'World collection', 2019),
(4, 'RAP & ROCK', 2020),
(5, 'RAP & POP', 2023);

INSERT INTO C_track (id_track, id_collect) 
VALUES (1, 3),
(2, 4),
(3, 2),
(5, 1),
(4, 5),
(6, 5);