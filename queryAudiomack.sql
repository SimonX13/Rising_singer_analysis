-- Table name is songs

--- Create ratio columns for the table
ALTER TABLE songs
ADD COLUMN download_ratio FLOAT,
ADD COLUMN favorite_ratio FLOAT,
ADD COLUMN playlist_adds_ratio FLOAT,
ADD COLUMN reposts_ratio FLOAT;

--- Fill in with ratio data
UPDATE songs
SET download_ratio = total_downloads / (total_play30s + 1e-6),
    favorite_ratio = total_favorites / (total_play30s + 1e-6),
    playlist_adds_ratio = total_playlist_adds / (total_play30s + 1e-6),
    reposts_ratio = total_reposts / (total_play30s + 1e-6);


--- Create cumulative user engagement columns for the table
ALTER TABLE songs
ADD COLUMN cumulative_playlist_adds INT,
ADD COLUMN cumulative_downloads INT,
ADD COLUMN cumulative_favorites INT,
ADD COLUMN cumulative_reposts INT;

--- Fill in with cumulative data
UPDATE songs
SET cumulative_playlist_adds = sub.cumulative_playlist_adds,
    cumulative_downloads = sub.cumulative_downloads,
    cumulative_favorites = sub.cumulative_favorites,
    cumulative_reposts = sub.cumulative_reposts
FROM (
    SELECT 
        music_id,
        month,
        SUM(total_playlist_adds) OVER (PARTITION BY music_id ORDER BY month) AS cumulative_playlist_adds,
        SUM(total_downloads) OVER (PARTITION BY music_id ORDER BY month) AS cumulative_downloads,
        SUM(total_favorites) OVER (PARTITION BY music_id ORDER BY month) AS cumulative_favorites,
        SUM(total_reposts) OVER (PARTITION BY music_id ORDER BY month) AS cumulative_reposts
    FROM songs
) AS sub
WHERE songs.music_id = sub.music_id AND songs.month = sub.month;


-- Objective: Find the month and country combination with highest total plays
SELECT 
  country,
  month,
  SUM(total_plays) AS total_plays
FROM songs
GROUP BY country, month
ORDER BY total_plays DESC
LIMIT 1;


-- Objective: Explore hidden gem songs with lower than average plays but high engagement rates
SELECT 
  artist_name,
  song_name,
  music_id,
  (download_ratio + favorite_ratio + playlist_adds_ratio +reposts_ratio )AS total_engagement_rate
FROM songs
WHERE total_plays < (SELECT AVG(total_plays) FROM songs) AND (download_ratio )> 0.15
ORDER BY engagement_rate DESC;

--- Objective: Top 10 songs from each month and region with their songs average total_play30s.
SELECT 
  month,
  region,
  AVG(total_play30s) AS avg_total_play30s
FROM songs
WHERE music_id IN (
  SELECT 
    music_id
  FROM songs
  GROUP BY music_id
  ORDER BY SUM(total_play30s) DESC
  LIMIT 10
)
GROUP BY month, region
ORDER BY month, region;

