-- 5f4dcc3b5aa765d61d8327deb882cf99 is md5 hash of 'password' string
INSERT INTO USER (ID, USERNAME, PASSWORD, EMAIL, FIRST_NAME, LAST_NAME)
VALUES (1, 'user', '5f4dcc3b5aa765d61d8327deb882cf99', 'user@email.com', 'UserFn', 'UserLn'),
(2, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin@email.com', 'AdFn', 'AdLn'),
(3, 'manager', '5f4dcc3b5aa765d61d8327deb882cf99', 'manager@email.com', 'ManFn', 'ManLn');

INSERT INTO ROLE (ID, ROLE) VALUES (1, 'ADMIN'), (2, 'MANAGER'), (3, 'USER');

INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 3), (2, 1), (3, 2);


