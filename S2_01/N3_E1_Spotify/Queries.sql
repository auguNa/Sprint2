-- Get all playlists of a user and the songs in them:
SELECT 
    p.title AS playlist_title,
    s.title AS song_title,
    u.username AS added_by_user
FROM 
    Playlists p
JOIN 
    Playlist_Songs ps ON p.playlist_id = ps.playlist_id
JOIN 
    Songs s ON ps.song_id = s.song_id
JOIN 
    Users u ON ps.added_by_user_id = u.user_id
WHERE 
    p.user_id = 1;

-- Get all users and the artists they follow:
SELECT 
    u.username,
    a.name AS artist_name
FROM 
    Users u
JOIN 
    User_Follows_Artist ufa ON u.user_id = ufa.user_id
JOIN 
    Artists a ON ufa.artist_id = a.artist_id;

-- Get the subscription details and payment history for a user:
SELECT 
    u.username,
    s.start_date,
    s.renewal_date,
    p.payment_date,
    p.amount
FROM 
    Users u
JOIN 
    Subscriptions s ON u.user_id = s.user_id
JOIN 
    Payments p ON s.subscription_id = p.subscription_id
WHERE 
    u.user_id = 2;
