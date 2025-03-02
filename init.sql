CREATE TABLE artist (
	artist_id				INTEGER	PRIMARY KEY AUTOINCREMENT,
	artist_name				TEXT		NOT 	NULL UNIQUE
);

CREATE TABLE label (
	label_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	label_name				TEXT 	NOT NULL UNIQUE
);

CREATE TABLE track (
	track_id 				INTEGER PRIMARY KEY AUTOINCREMENT,
	track_name 				TEXT 	NOT NULL,
	primary_artist_id 		INTEGER 	NOT NULL,
	track_version 			TEXT 	NOT NULL,
	release_date				DATE 	NOT NULL,
	label_id 				INTEGER 	NOT NULL,
	relative_volume 			FLOAT 	NOT NULL,
	original_length 			FLOAT 	NOT	NULL,
	folder_name 				TEXT 	NOT NULL UNIQUE,
	track_preference_rank 	INTEGER NOT NULL UNIQUE,
	track_intensity_rank		INTEGER NOT NULL UNIQUE,
	FOREIGN KEY (primary_artist_id) REFERENCES
		artist(artist_id) ON DELETE CASCADE,
	FOREIGN KEY (label_id) REFERENCES
		label(label_id) ON DELETE CASCADE
);

CREATE TABLE track_artist (
	track_artist_id			INTEGER PRIMARY KEY AUTOINCREMENT,
	track_id					INTEGER 	NOT NULL,
	artist_id				TEXT		NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES
		artist(artist_id) ON DELETE CASCADE,
	FOREIGN KEY (track_id) REFERENCES
		track(track_id) ON DELETE CASCADE
);

CREATE TABLE track_interval (
	track_interval_id 		INTEGER PRIMARY KEY AUTOINCREMENT,
	track_id 				INTEGER NOT NULL,
	track_interval_start 	FLOAT 	NOT NULL,
	track_interval_end 		FLOAT 	NOT NULL,
	FOREIGN KEY (track_id) REFERENCES
		track(track_id) ON DELETE CASCADE
);

CREATE TABLE tag (
	tag_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	track_id	 				INTEGER NOT NULL,
	tag_name 				TEXT 	NOT NULL,
	FOREIGN KEY (track_id) REFERENCES
		track(track_id) ON DELETE CASCADE
);

CREATE TABLE audio_quality (
	audio_quality_id 		INTEGER PRIMARY KEY AUTOINCREMENT,
	track_id 				INTEGER NOT NULL,
	audio_file_name 			TEXT 	NOT NULL,
	audio_file_size 			INTEGER NOT NULL,
	bit_rate 				FLOAT 	NOT NULL,
	FOREIGN KEY (track_id) REFERENCES
		track(track_id) ON DELETE CASCADE
);

CREATE TABLE image_quality (
	image_quality_id 		INTEGER PRIMARY KEY AUTOINCREMENT,
	track_id 				INTEGER NOT NULL,
	image_file_name 			TEXT 	NOT NULL,
	image_file_size 			INTEGER 	NOT NULL,
	image_width 				INTEGER NOT NULL,
	image_height 			INTEGER NOT NULL,
	FOREIGN KEY (track_id) REFERENCES
		track(track_id) ON DELETE CASCADE
);

CREATE TABLE preference_group (
	preference_group_id 		INTEGER PRIMARY KEY AUTOINCREMENT,
	preference_group_name 	TEXT 	NOT NULL UNIQUE,
	preference_value 		FLOAT 	NOT NULL,
	preference_start 		INTEGER NOT NULL,
	preference_colour 		INTEGER NOT NULL UNIQUE
);

CREATE TABLE intensity_group (
	intensity_group_id 		INTEGER PRIMARY KEY AUTOINCREMENT,
	intensity_group_name 	TEXT 	NOT NULL UNIQUE,
	intensity_value 			FLOAT 	NOT NULL,
	intensity_start 			INTEGER NOT NULL,
	intensity_colour 		INTEGER NOT NULL
);

CREATE TABLE playlist (
	playlist_id 				INTEGER PRIMARY KEY AUTOINCREMENT,
	playlist_name 			TEXT 	NOT NULL
);

CREATE TABLE track_playlist (
	track_playlist_id 		INTEGER PRIMARY KEY AUTOINCREMENT,
	track_id 				INTEGER NOT NULL,
	playlist_id 				INTEGER NOT NULL,
	FOREIGN KEY (track_id) REFERENCES
		track(track_id) ON DELETE CASCADE,
	FOREIGN KEY (playlist_id) REFERENCES
		playlist(playlist_id) ON DELETE CASCADE
);
