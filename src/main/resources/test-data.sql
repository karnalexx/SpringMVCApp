INSERT INTO USER (ID, USERNAME, PASSWORD, EMAIL, FIRST_NAME, LAST_NAME)
VALUES (1, 'user', 'password', 'user@email.com', 'UserFn', 'UserLn'),
  (2, 'admin', 'password', 'admin@email.com', 'AdminFn', 'AdminLn');

INSERT INTO ROLE (ID, ROLE) VALUES (1, 'ROLE_ADMIN'), (2, 'ROLE_USER');

INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 2), (2, 1);

INSERT INTO MESSAGE (ID, _FROM, TO, DATE, SUBJECT, TEXT)
VALUES (1, 'SAM', 'MARRY', '2016-01-11 11:22:33', 'Subj1', 'Some Message Text 1'),
  (2, 'TOM', 'JACK', '2016-02-12 11:44:33', 'Subj2', 'Some Message Text 2'),
  (3, 'TAD', 'JOHN', '2016-02-10 22:44:33', 'Subj3', 'Some Message Text 3'),
  (4, 'ANDY', 'PAUL', '2015-11-11 22:44:33', 'Subj4', 'Some Message Text 4');

