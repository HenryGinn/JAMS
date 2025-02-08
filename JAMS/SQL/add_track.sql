BEGIN;

-- Insert artist if not exists
INSERT INTO artist (artist_name) 
VALUES ('Artist Name') 
ON CONFLICT(artist_name) DO NOTHING;

-- Get artist_id
WITH found AS (
    SELECT artist_id FROM artist WHERE artist_name = 'Artist Name'
)
INSERT INTO track (track_name, artist_id)
SELECT 'Track Name', artist_id FROM found;

COMMIT;
