DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  is_blocked INTEGER DEFAULT 0
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

INSERT INTO post (title, body, author_id, created) VALUES
('Post 1', 'Nội dung bài viết 1', 1, CURRENT_TIMESTAMP),
('Post 2', 'Nội dung bài viết 2', 1, CURRENT_TIMESTAMP),
('Post 3', 'Nội dung bài viết 3', 1, CURRENT_TIMESTAMP),
('Post 4', 'Nội dung bài viết 4', 1, CURRENT_TIMESTAMP),
('Post 5', 'Nội dung bài viết 5', 1, CURRENT_TIMESTAMP),
('Post 6', 'Nội dung bài viết 6', 1, CURRENT_TIMESTAMP),
('Post 7', 'Nội dung bài viết 7', 1, CURRENT_TIMESTAMP),
('Post 8', 'Nội dung bài viết 8', 1, CURRENT_TIMESTAMP),
('Post 9', 'Nội dung bài viết 9', 1, CURRENT_TIMESTAMP),
('Post 10', 'Nội dung bài viết 10', 1, CURRENT_TIMESTAMP),
('Post 11', 'Nội dung bài viết 11', 1, CURRENT_TIMESTAMP),
('Post 12', 'Nội dung bài viết 12', 1, CURRENT_TIMESTAMP),
('Post 13', 'Nội dung bài viết 13', 1, CURRENT_TIMESTAMP),
('Post 14', 'Nội dung bài viết 14', 1, CURRENT_TIMESTAMP),
('Post 15', 'Nội dung bài viết 15', 1, CURRENT_TIMESTAMP),
('Post 16', 'Nội dung bài viết 16', 1, CURRENT_TIMESTAMP),
('Post 17', 'Nội dung bài viết 17', 1, CURRENT_TIMESTAMP),
('Post 18', 'Nội dung bài viết 18', 1, CURRENT_TIMESTAMP),
('Post 19', 'Nội dung bài viết 19', 1, CURRENT_TIMESTAMP);
