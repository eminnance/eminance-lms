-- Database: eminancedb

 DROP DATABASE IF EXISTS eminancedb;

CREATE DATABASE eminancedb
    WITH
    OWNER = "eminance-username"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
