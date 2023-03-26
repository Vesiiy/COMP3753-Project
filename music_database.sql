CREATE TABLE artist (
  artist_id SERIAL NOT NULL,
  artist_name VARCHAR (50) NOT NULL,
  PRIMARY KEY (artist_id) ON DELETE CASCADE 
);

CREATE TABLE track (
  track_id SERIAL NOT NULL,
  artist_id INT NOT NULL,
  track_name VARCHAR (50),
  time numeric (6, 2),
  PRIMARY KEY (track_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
  CONSTRAINT unique_artist_track UNIQUE (artist_id, track_name)
);

CREATE TABLE playlist (
  playlist_id SERIAL NOT NULL,
  playlist_name VARCHAR (50) NOT NULL,
  PRIMARY KEY (playlist_id) ON DELETE CASCADE
);

CREATE TABLE genre (
  genre_id SERIAL not null,
  genre_name VARCHAR (50) NOT NULL,
  PRIMARY KEY (genre_id) 
);

CREATE TABLE record_label (
  label_id SERIAL NOT NULL,
  record_label_name VARCHAR (50) NOT NULL,
  location VARCHAR (50) NOT NULL,
  PRIMARY KEY (label_id),
  CONSTRAINT unique_record_label_name UNIQUE (record_label_name)
);

CREATE TABLE playlist_track (
  playlist_id INT NOT NULL,
  track_id INT NOT NULL,
  PRIMARY KEY (playlist_id, track_id),
  FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
  FOREIGN KEY (track_id) REFERENCES track(track_id)
);

CREATE TABLE album (
  album_id SERIAL NOT NULL,
  artist_id INT NOT NULL,
  album_name VARCHAR (50) NOT NULL,
  release_year INT NOT NULL,
  genre_id INT NOT NULL,
  label_id INT NOT NULL,
  PRIMARY KEY (album_id) ON DELETE CASCADE,
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
  FOREIGN KEY (label_id) REFERENCES record_label(label_id)
);

CREATE TABLE album_tracks (
  track_no INT NOT NULL,
  album_id INT NOT NULL,
  track_id INT NOT NULL,
  PRIMARY KEY (album_id, track_id) ON DELETE CASCADE,
  FOREIGN KEY (album_id) REFERENCES album(album_id),
  FOREIGN KEY (track_id) REFERENCES track(track_id)
);
