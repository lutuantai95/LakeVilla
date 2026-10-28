-- Tables used by hermitage-lv (LV/src/hermitage.cpp, TEST_LOCK ... TEST_SNAP3).
-- The scenarios run in sequence and leave the tables modified, so run this
-- again before every hermitage-lv invocation:
--   docker exec spark-delta3 spark-sql -f ./hermitage.sql
-- Each row is inserted on its own so it lands in its own data file: LakeVilla
-- locates a key through the per-file min/max stats of the first column.

CREATE NAMESPACE IF NOT EXISTS tmp;

DROP TABLE IF EXISTS spark_catalog.tmp.lock;
CREATE TABLE spark_catalog.tmp.lock (id INT, value INT) USING delta;
INSERT INTO spark_catalog.tmp.lock VALUES (1, 10);
INSERT INTO spark_catalog.tmp.lock VALUES (2, 20);

DROP TABLE IF EXISTS spark_catalog.tmp.lock2;
CREATE TABLE spark_catalog.tmp.lock2 (id INT, value INT) USING delta;
INSERT INTO spark_catalog.tmp.lock2 VALUES (1, 10);
INSERT INTO spark_catalog.tmp.lock2 VALUES (2, 20);

DROP TABLE IF EXISTS spark_catalog.tmp.snap1;
CREATE TABLE spark_catalog.tmp.snap1 (id INT, value INT) USING delta;
INSERT INTO spark_catalog.tmp.snap1 VALUES (1, 10);
INSERT INTO spark_catalog.tmp.snap1 VALUES (2, 20);

DROP TABLE IF EXISTS spark_catalog.tmp.snap2;
CREATE TABLE spark_catalog.tmp.snap2 (id INT, value INT) USING delta;
INSERT INTO spark_catalog.tmp.snap2 VALUES (1, 10);
INSERT INTO spark_catalog.tmp.snap2 VALUES (2, 20);

DROP TABLE IF EXISTS spark_catalog.tmp.snap3;
CREATE TABLE spark_catalog.tmp.snap3 (id INT, value INT) USING delta;
INSERT INTO spark_catalog.tmp.snap3 VALUES (1, 10);
INSERT INTO spark_catalog.tmp.snap3 VALUES (2, 20);
