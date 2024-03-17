/*
Задание 2
Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

Внимание: результаты запросов не должны быть пустыми, учтите это при заполнении таблиц.

Название и продолжительность самого длительного трека.
Название треков, продолжительность которых не менее 3,5 минут.
Названия сборников, вышедших в период с 2018 по 2020 год включительно.
Исполнители, чьё имя состоит из одного слова.
Название треков, которые содержат слово «мой» или «my».
 */

SELECT name, duratuion
FROM Track
WHERE duratuion=(SELECT MAX(duratuion) FROM Track);

SELECT name
FROM Track
WHERE duratuion >= 210;

SELECT name
FROM Collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name
FROM Artist
WHERE name NOT LIKE '% %';

SELECT name
FROM Track
WHERE LOWER(name) LIKE '%мой%' OR LOWER(name) LIKE '%my%';

/*
 Задание 3
Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

Количество исполнителей в каждом жанре.
Количество треков, вошедших в альбомы 2019–2020 годов.
Средняя продолжительность треков по каждому альбому.
Все исполнители, которые не выпустили альбомы в 2020 году.
Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами - Eminem).
 */

SELECT g.name, COUNT(ag.id_artist) AS artist_count
FROM Genre g
LEFT JOIN Artists_genre ag ON g.id_genre = ag.id_genre
GROUP BY g.name;

SELECT COUNT(t.id_track) AS track_count
FROM Track t
INNER JOIN Album a ON t.id_album = a.id_album
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.name, AVG(t.duratuion) AS avg_duration
FROM Album a
LEFT JOIN Track t ON a.id_album = t.id_album
GROUP BY a.name;

SELECT a.name
FROM Artist a
LEFT JOIN Album_artist aa ON a.id_artist = aa.id_artist
LEFT JOIN Album al ON aa.id_album = al.id_album
WHERE al.release_year <> 2020;

SELECT c.name
FROM Collection c
INNER JOIN C_track ct ON c.id_collect = ct.id_collect
INNER JOIN Track t ON ct.id_track = t.id_track
INNER JOIN Album al ON t.id_album = al.id_album
INNER JOIN Album_artist aa ON al.id_album = aa.id_album
INNER JOIN Artist a ON aa.id_artist = a.id_artist
WHERE a.name = 'Eminem';