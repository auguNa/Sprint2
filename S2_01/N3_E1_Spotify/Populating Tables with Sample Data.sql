-- Insert sample data into Users table
INSERT INTO Users (email, password, username, dob, gender, country, postal_code, user_type) VALUES
('user1@example.com', 'password1', 'user1', '1990-01-01', 'M', 'CountryA', '12345', 'free'),
('user2@example.com', 'password2', 'user2', '1992-02-02', 'F', 'CountryB', '54321', 'premium');

-- Insert sample data into Artists table
INSERT INTO Artists (name, artist_image) VALUES
('Artist1', 'artist1.jpg'),
('Artist2', 'artist2.jpg');

-- Insert sample data into Albums table
INSERT INTO Albums (artist_id, title, release_year, cover_image) VALUES
(1, 'Album1', 2000, 'album1.jpg'),
(2, 'Album2', 2005, 'album2.jpg');

-- Insert sample data into Songs table
INSERT INTO Songs (album_id, title, duration, play_count) VALUES
(1, 'Song1', 180, 10),
(1, 'Song2', 200, 20),
(2, 'Song3', 240, 30);

-- Insert sample data into Subscriptions table
INSERT INTO Subscriptions (user_id, start_date, renewal_date, payment_method) VALUES
(2, '2023-01-01', '2024-01-01', 'credit_card');

-- Insert sample data into Payments table
INSERT INTO Payments (subscription_id, payment_date, order_number, amount, payment_method, card_number, expiry_month, expiry_year, security_code, paypal_username) VALUES
(1, '2023-01-01', 'ORDER123', 9.99, 'credit_card', '1234567812345678', 12, 2024, '123', NULL);

-- Insert sample data into Playlists table
INSERT INTO Playlists (user_id, title, song_count, created_at, status) VALUES
(1, 'Playlist1', 2, '2023-01-01 12:00:00', 'active'),
(2, 'Playlist2', 1, '2023-01-01 13:00:00', 'deleted');

-- Insert sample data into Playlist_Songs table
INSERT INTO Playlist_Songs (playlist_id, song_id, added_by_user_id, added_at) VALUES
(1, 1, 1, '2023-01-01 12:01:00'),
(1, 2, 1, '2023-01-01 12:02:00'),
(2, 3, 2, '2023-01-01 13:01:00');

-- Insert sample data into User_Follows_Artist table
INSERT INTO User_Follows_Artist (user_id, artist_id) VALUES
(1, 1),
(2, 2);

-- Insert sample data into Similar_Artists table
INSERT INTO Similar_Artists (artist_id, similar_artist_id) VALUES
(1, 2);

-- Insert sample data into User_Favorite_Albums table
INSERT INTO User_Favorite_Albums (user_id, album_id) VALUES
(1, 1),
(2, 2);

-- Insert sample data into User_Favorite_Songs table
INSERT INTO User_Favorite_Songs (user_id, song_id) VALUES
(1, 1),
(2, 3);
