USE blog; 

CREATE TABLE blog_posts (idblog_posts INT NOT NULL, title VARCHAR(20), post_text TEXT, post_date TEXT, image_url TEXT, tags TEXT); 

INSERT INTO blog_posts VALUES (1, 'first post', 'this is my first post', '2022-10-03', 'https://google.com', 'post;blogging;medium');