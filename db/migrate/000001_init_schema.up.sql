CREATE TABLE IF NOT EXISTS images(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(10),
    created_at DATE DEFAULT now()
);
CREATE TABLE IF NOT EXISTS bloggers(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    occupation VARCHAR(50),
    created_at DATE DEFAULT now(),
    id_image BIGINT REFERENCES images(id)
);
CREATE TABLE IF NOT EXISTS followers(
    id_followed BIGINT REFERENCES bloggers(id),
    id_follower BIGINT REFERENCES bloggers(id),
    PRIMARY KEY(id_followed, id_follower)
);
CREATE TABLE IF NOT EXISTS blogs(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    id_image BIGINT REFERENCES images(id),
    id_blogger BIGINT REFERENCES bloggers(id),
    created_at DATE DEFAULT now()
);
CREATE TABLE IF NOT EXISTS blog_types(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) UNIQUE
);
CREATE TABLE IF NOT EXISTS blog_details(
    id_blog BIGINT REFERENCES blogs(id),
    id_type BIGINT REFERENCES blog_types(id),
    PRIMARY KEY(id_blog, id_type)
);
CREATE TABLE IF NOT EXISTS comments(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    description TEXT,
    id_blogger BIGINT REFERENCES bloggers(id),
    id_blog BIGINT REFERENCES blogs(id),
    created_at DATE DEFAULT now()
);
CREATE TABLE IF NOT EXISTS thumbs(
    id_blogger BIGINT REFERENCES bloggers(id),
    id_blog BIGINT REFERENCES blogs(id),
    type VARCHAR(4) CHECK (thumbs.type IN ('up', 'dowm'))
);