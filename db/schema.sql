-- Script de criação do banco do Facebook CRUD (PostgreSQL)
--
-- Uso:
--   psql -U postgres -c "CREATE DATABASE facebook;"
--   psql -U postgres -d facebook -f db/schema.sql

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id       SERIAL PRIMARY KEY,
	nome     VARCHAR(100) NOT NULL,
	sexo     CHAR(1)      NOT NULL,
	email    VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
	id        SERIAL PRIMARY KEY,
	content   VARCHAR(500) NOT NULL,
	post_date DATE         NOT NULL DEFAULT CURRENT_DATE,
	user_id   INT          NOT NULL REFERENCES users (id) ON DELETE CASCADE
);

-- Novo cadastro: comentários (FK para posts e users)
CREATE TABLE comments (
	id           SERIAL PRIMARY KEY,
	content      VARCHAR(500) NOT NULL,
	comment_date DATE         NOT NULL DEFAULT CURRENT_DATE,
	post_id      INT          NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
	user_id      INT          NOT NULL REFERENCES users (id) ON DELETE CASCADE
);

-- Usuário inicial para login: admin@facebook.com / admin123
-- (senha armazenada como SHA-256 em Base64, igual ao PasswordEncryptor)
INSERT INTO users (nome, sexo, email, password) VALUES
	('Administrador', 'M', 'admin@facebook.com', 'JAvlGPq9JyTdtvBO6x2llnRI1+gxwIyPqCKAn3THIKk=');

INSERT INTO posts (content, user_id) VALUES
	('Olá, mundo! Primeiro post do Facebook CRUD.', 1);

INSERT INTO comments (content, post_id, user_id) VALUES
	('Primeiro comentário!', 1, 1);
