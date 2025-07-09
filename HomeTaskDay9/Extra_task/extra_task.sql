-- CREATE DATABASE instagram_db;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(30) UNIQUE,
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(256),
    full_name VARCHAR(50),
    bio TEXT,
    created_at TIMESTAMP,
    is_private BOOLEAN,
    is_verified BOOLEAN,
    profile_photo_url TEXT
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    caption TEXT,
    location VARCHAR(100),
    created_at TIMESTAMP,
    is_archived BOOLEAN,
    post_type TEXT CHECK (post_type IN ('photo', 'video', 'carousel'))
);

CREATE TABLE post_media (
    media_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    media_url TEXT,
    media_type TEXT CHECK (media_type IN ('image', 'video')),
    order_position INT
);

CREATE TABLE stories (
    story_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    media_url TEXT,
    created_at TIMESTAMP,
    expires_at TIMESTAMP
);

CREATE TABLE followers (
    follower_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    following_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    followed_at TIMESTAMP,
    PRIMARY KEY (follower_id, following_id)
);

CREATE TABLE likes (
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    created_at TIMESTAMP,
    PRIMARY KEY (user_id, post_id)
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    content TEXT,
    created_at TIMESTAMP,
    parent_comment_id INT REFERENCES comments(comment_id)
);

CREATE TABLE hashtags (
    hashtag_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    created_at TIMESTAMP
);

CREATE TABLE post_hashtags (
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    hashtag_id INT REFERENCES hashtags(hashtag_id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, hashtag_id)
);

-- 1. Barcha foydalanuvchilar roʻyxati
SELECT * FROM users;

-- 2. Har bir foydalanuvchining nechta posti borligini chiqarish
SELECT u.username, COUNT(p.post_id) AS post_count
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.username;

-- 3. Eng koʻp post joylagan foydalanuvchini toping
SELECT u.username, COUNT(p.post_id) AS post_count
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY u.username
ORDER BY post_count DESC
LIMIT 1;

-- 4. Har bir postga nechta like bosilganini chiqarish
SELECT p.caption, COUNT(l.like_id) AS like_count
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id;

-- 5. Har bir postga nechta comment yozilganini chiqarish
SELECT p.caption, COUNT(c.comment_id) AS comment_count
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;

-- 6. Eng koʻp like to‘plagan postni toping
SELECT p.caption, COUNT(l.like_id) AS like_count
FROM posts p
JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY like_count DESC
LIMIT 1;

-- 7. Har bir foydalanuvchi nechta like bosganini chiqarish
SELECT u.username, COUNT(l.like_id) AS likes_given
FROM users u
LEFT JOIN likes l ON u.user_id = l.user_id
GROUP BY u.username;

-- 8. Har bir foydalanuvchi nechta comment yozganini chiqarish
SELECT u.username, COUNT(c.comment_id) AS comments_written
FROM users u
LEFT JOIN comments c ON u.user_id = c.user_id
GROUP BY u.username;

-- 9. Har bir foydalanuvchi oxirgi necha kun ichida post joylaganini toping
SELECT username, MAX(created_at) AS last_post_date
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY username;

-- 10. O‘zi post qilmagan foydalanuvchilar
SELECT username FROM users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM posts);

-- 11. Har bir foydalanuvchi nechta foydalanuvchini follow qilgan
SELECT u.username, COUNT(f.followed_id) AS following
FROM users u
JOIN follows f ON u.user_id = f.follower_id
GROUP BY u.username;

-- 12. Har bir foydalanuvchini nechta foydalanuvchi follow qilgan
SELECT u.username, COUNT(f.follower_id) AS followers
FROM users u
JOIN follows f ON u.user_id = f.followed_id
GROUP BY u.username;

-- 13. Eng koʻp followeri bor foydalanuvchi
SELECT u.username, COUNT(f.follower_id) AS follower_count
FROM users u
JOIN follows f ON u.user_id = f.followed_id
GROUP BY u.username
ORDER BY follower_count DESC
LIMIT 1;

-- 14. O‘zaro bir-birini follow qilgan foydalanuvchilar juftligi
SELECT f1.follower_id, f1.followed_id
FROM follows f1
JOIN follows f2 ON f1.follower_id = f2.followed_id AND f1.followed_id = f2.follower_id;

-- 15. Eng ko‘p comment yozilgan post
SELECT p.caption, COUNT(c.comment_id) AS comment_count
FROM posts p
JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY comment_count DESC
LIMIT 1;

-- 16. Bugun necha post joylandi
SELECT COUNT(*) FROM posts WHERE created_at::date = CURRENT_DATE;

-- 17. O‘tgan oyda nechta yangi foydalanuvchi ro‘yxatdan o‘tgan
SELECT COUNT(*) FROM users
WHERE registration_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month')
  AND registration_date < date_trunc('month', CURRENT_DATE);

-- 18. Foydalanuvchi va uning postlari
SELECT u.username, p.caption
FROM users u
JOIN posts p ON u.user_id = p.user_id;

-- 19. Posti yo‘q foydalanuvchilar
SELECT u.username FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
WHERE p.post_id IS NULL;

-- 20. Commentida "nice" so‘zi ishlatilgan commentlar
SELECT * FROM comments WHERE content ILIKE '%nice%';

-- 21. Har bir postga comment qoldirganlar ro‘yxati
SELECT p.caption, u.username, c.content
FROM comments c
JOIN users u ON c.user_id = u.user_id
JOIN posts p ON c.post_id = p.post_id;

-- 22. Har bir comment qoldirgan user va post nomi
SELECT u.username, p.caption, c.content
FROM comments c
JOIN users u ON c.user_id = u.user_id
JOIN posts p ON c.post_id = p.post_id;

-- 23. Har bir userga eng ko‘p like bosilgan postini topish
SELECT username, caption, like_count FROM (
  SELECT u.username, p.caption, COUNT(l.like_id) AS like_count,
        RANK() OVER (PARTITION BY u.user_id ORDER BY COUNT(l.like_id) DESC) AS rnk
  FROM users u
  JOIN posts p ON u.user_id = p.user_id
  LEFT JOIN likes l ON p.post_id = l.post_id
  GROUP BY u.username, p.caption
) t
WHERE rnk = 1;

-- 24. Eng ko‘p izoh yozgan userni topish
SELECT u.username, COUNT(c.comment_id) AS total_comments
FROM users u
JOIN comments c ON u.user_id = c.user_id
GROUP BY u.username
ORDER BY total_comments DESC
LIMIT 1;

-- 25. Har bir foydalanuvchining o‘z postlariga o‘rtacha nechta like bosilgan
SELECT u.username, ROUND(AVG(like_count), 2) AS avg_likes_per_post FROM (
  SELECT p.user_id, COUNT(l.like_id) AS like_count
  FROM posts p
  LEFT JOIN likes l ON p.post_id = l.post_id
  GROUP BY p.post_id, p.user_id
) sub
JOIN users u ON sub.user_id = u.user_id
GROUP BY u.username;
