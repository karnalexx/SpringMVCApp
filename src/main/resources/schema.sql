CREATE TABLE IF NOT EXISTS USER (
  ID         BIGINT       NOT NULL PRIMARY KEY AUTO_INCREMENT,
  USERNAME   VARCHAR(255) NOT NULL,
  PASSWORD   VARCHAR(255) NOT NULL,
  EMAIL      VARCHAR(255),
  FIRST_NAME VARCHAR(255),
  LAST_NAME  VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ROLE (
  ID      BIGINT       NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ROLE    VARCHAR(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS USER_ROLE (
  USER_ID BIGINT NOT NULL,
  ROLE_ID BIGINT NOT NULL,
  FOREIGN KEY (USER_ID) REFERENCES USER,
  FOREIGN KEY (ROLE_ID) REFERENCES USER
);