INSERT INTO Artists (Name) VALUES (@ArtistName);

INSERT INTO Songs (Title, ArtistID)  
VALUES (@SongTitle, (SELECT ArtistID FROM Artists WHERE Name=@ArtistName LIMIT 1));

