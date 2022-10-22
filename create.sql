SELECT name_genre, COUNT(*) FROM Genre g
JOIN Genre_Singer s ON g.id = s.genre_id
GROUP BY name_genre;

SELECT COUNT(*) FROM Track t
JOIN Album a ON a.id = t.album_id
WHERE release_year BETWEEN 2019 AND 2020;

SELECT name_album, AVG(length_track) FROM Track t
JOIN Album a ON a.id = t.album_id
GROUP BY name_album;

SELECT name_singer FROM Singer s
JOIN Singer_Album a ON s.id = a.singer_id
JOIN Album l ON a.album_id = l.id
WHERE release_year != 2020
GROUP BY name_singer;

SELECT name_collection FROM Collection c
JOIN Collection_Track ct ON c.id = ct.collection_id
JOIN Track t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN Singer_Album sa ON a.id = sa.album_id
JOIN Singer s ON sa.singer_id = s.id
WHERE name_singer = 'Король и шут'
GROUP BY name_collection;

SELECT name_album FROM Album a
JOIN Singer_Album sa ON a.id = sa.album_id
JOIN Singer s ON sa.singer_id = s.id
JOIN Genre_Singer gs ON s.id = gs.singer_id
JOIN Genre g ON gs.genre_id = g.id
GROUP BY name_album
HAVING COUNT (DISTINCT g.name_genre) > 1;

SELECT name_track FROM Track t
LEFT JOIN Collection_Track ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

SELECT name_singer FROM Singer s
JOIN Singer_Album sa ON s.id = sa.singer_id
JOIN Album a ON sa.album_id = a.id
JOIN Track t ON a.id = t.album_id
WHERE length_track = (SELECT MIN(length_track) FROM Track);

SELECT name_album, COUNT(*) FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY name_album
HAVING COUNT(*) = (SELECT COUNT(*) FROM Album a
				   JOIN Track t ON a.id = t.album_id
				   GROUP BY name_album
				   ORDER BY COUNT(*)
				   limit 1);