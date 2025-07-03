CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	username VARCHAR(100) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	password_hash TEXT NOT NULL,
	created_at DATE DEFAULT CURRENT_DATE 
);

CREATE TABLE categories(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL,
	description TEXT
);

CREATE TABLE videos(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT REFERENCES users(id),
	category_id BIGINT REFERENCES categories(id), 
	title VARCHAR(200) NOT NULL,
	description TEXT NOT NULL,
	file_path TEXT NOT NULL,
	thumbnail_path TEXT NOT NULL,
	views INTEGER DEFAULT 0,
	uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(50) NOT NULL,
	duration INTEGER NOT NULL
);

CREATE TABLE comments(
	id BIGSERIAL PRIMARY KEY,
	video_id BIGINT REFERENCES videos(id),
	user_id BIGINT REFERENCES users(id),
	content TEXT NOT NULL,
	posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ratings(
	id BIGSERIAL PRIMARY KEY,
	video_id BIGINT REFERENCES videos(id),
	user_id BIGINT REFERENCES users(id),
	rating INTEGER CHECK(rating >= 1 and rating <= 5),
	rated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE favorites(
	user_id BIGINT REFERENCES users(id),
	video_id BIGINT REFERENCES videos(id),
	PRIMARY KEY(user_id, video_id)
);

ALTER TABLE users ALTER COLUMN username TYPE VARCHAR(100);

-- ON DELETE CASCADE Qo`shish kerak
-- videos jadvalida
-- user_id BIGINT REFERENCES users(id) ON DELETE CASCADE

-- comments jadvalida
-- user_id BIGINT REFERENCES users(id) ON DELETE CASCADE

-- ratings jadvalida
-- user_id BIGINT REFERENCES users(id) ON DELETE CASCADE

-- favorites jadvalida
-- user_id BIGINT REFERENCES users(id) ON DELETE CASCADE

-- ON DELETE CASCADE Qo`shish kerak
-- comments jadvalida
-- video_id BIGINT REFERENCES videos(id) ON DELETE CASCADE

-- ratings jadvalida
-- video_id BIGINT REFERENCES videos(id) ON DELETE CASCADE

-- favorites jadvalida (agar kerak bo‘lsa)
-- video_id BIGINT REFERENCES videos(id) ON DELETE CASCADE

SELECT DISTINCT name FROM categories;

SELECT * FROM categories ORDER BY name;

SELECT * FROM categories ORDER BY id OFFSET 5 LIMIT 5;

SELECT * FROM categories WHERE description IS NULL OR description = '';

SELECT * FROM categories WHERE name IN('Music', 'Sport', 'News');

SELECT *FROM videos WHERE views BETWEEN 100 and 1000;  

SELECT * FROM videos WHERE status IN('опубликовано', 'черновик');

SELECT * FROM users ORDER BY created_at DESC LIMIT 1;

SELECT * FROM comments WHERE video_id=? ORDER BY posted_at DESC LIMIT 5;

SELECT COUNT(*) AS total_videos FROM videos;

SELECT COUNT(*) AS total_users FROM users;

SELECT SUM(views) AS total_views FROM videos;

SELECT AVG(rating) AS average_rating FROM ratings;

SELECT MIN(views) AS min_views, MAX(views) AS max_views FROM videos;

SELECT * FROM videos WHERE status = 'опубликовано' ORDER BY views DESC LIMIT 5;

SELECT * FROM videos WHERE views > 1000 ORDER BY views DESC OFFSET 5 LIMIT 5;

SELECT * FROM videos ORDER BY title ASC LIMIT 10;

SELECT * FROM videos ORDER BY views DESC LIMIT 10;

SELECT * FROM videos ORDER BY views ASC LIMIT 1;

SELECT COUNT(*) AS draft_count FROM videos WHERE status = 'черновик';

SELECT AVG(duration) AS avg_duration FROM videos;

SELECT SUM(duration) AS total_duration FROM videos;

SELECT * FROM comments ORDER BY LENGTH(content) DESC LIMIT 3;

SELECT * FROM comments ORDER BY LENGTH(content) ASC LIMIT 5;

SELECT COUNT(*) AS gmail_users FROM users WHERE email LIKE '%@gmail.com';

SELECT COUNT(*) AS rating_5_count FROM ratings WHERE rating = 5;