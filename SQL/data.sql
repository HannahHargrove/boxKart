INSERT INTO VENDORS VALUES (1, 'GARMIN');
INSERT INTO VENDORS VALUES (2, 'AT&T');
INSERT INTO VENDORS VALUES (3, 'IKEA');
INSERT INTO VENDORS VALUES (4, 'WALMART');

INSERT INTO ITEMS VALUES (DEFAULT, 'Television', '23.54', '0', '3.02', NULL, NULL, 'e');
INSERT INTO ITEM_TAGS VALUES ('1', 'black');
INSERT INTO ITEM_TAGS VALUES ('1', 'HD');
INSERT INTO ITEM_TAGS VALUES ('1', '1080p');
INSERT INTO ITEM_TAGS VALUES ('1', 'Television');
INSERT INTO ITEM_TAGS VALUES ('1', 'GARMIN');
INSERT INTO ITEM_TAGS VALUES ('1', 'Electronic');
INSERT INTO SUPPLY VALUES ('1', '1');

INSERT INTO ITEMS VALUES (DEFAULT, 'Speakers', '54.92', '12', '7.28', NULL, NULL, 'e');
INSERT INTO ITEM_TAGS VALUES ('2', 'loud');
INSERT INTO ITEM_TAGS VALUES ('2', 'good');
INSERT INTO ITEM_TAGS VALUES ('2', 'condition');
INSERT INTO ITEM_TAGS VALUES ('2', 'Speakers');
INSERT INTO ITEM_TAGS VALUES ('2', 'AT&T');
INSERT INTO ITEM_TAGS VALUES ('2', 'HD');
INSERT INTO ITEM_TAGS VALUES ('2', 'Electronic');
INSERT INTO SUPPLY VALUES ('2', '2');

INSERT INTO ITEMS VALUES (DEFAULT, 'Couch', '123.90', '20', NULL, 'living room', NULL, 'f');
INSERT INTO ITEM_TAGS VALUES ('3', 'velvet');
INSERT INTO ITEM_TAGS VALUES ('3', 'soft');
INSERT INTO ITEM_TAGS VALUES ('3', 'Couch');
INSERT INTO ITEM_TAGS VALUES ('3', 'Furniture');
INSERT INTO ITEM_TAGS VALUES ('3', 'IKEA');
INSERT INTO SUPPLY VALUES ('3', '3');

INSERT INTO ITEMS VALUES (DEFAULT, 'Coffe Table', '50.90', '213', NULL, 'kitchen', NULL, 'f');
INSERT INTO ITEM_TAGS VALUES ('4', 'wooden');
INSERT INTO ITEM_TAGS VALUES ('4', 'round');
INSERT INTO ITEM_TAGS VALUES ('4', 'Coffee');
INSERT INTO ITEM_TAGS VALUES ('4', 'Table');
INSERT INTO ITEM_TAGS VALUES ('4', 'Furniture');
INSERT INTO ITEM_TAGS VALUES ('4', 'IKEA');
INSERT INTO SUPPLY VALUES ('4', '3');

INSERT INTO ITEMS VALUES (DEFAULT, 'Halloween', '9.99', '3', NULL, NULL, 'horror', 'm');
INSERT INTO ITEM_TAGS VALUES ('5', 'spooky');
INSERT INTO ITEM_TAGS VALUES ('5', 'Rob');
INSERT INTO ITEM_TAGS VALUES ('5', 'Zombie');
INSERT INTO ITEM_TAGS VALUES ('5', 'Halloween');
INSERT INTO ITEM_TAGS VALUES ('5', 'Movie');
INSERT INTO ITEM_TAGS VALUES ('5', 'WALMART');
INSERT INTO SUPPLY VALUES ('5', '4');

INSERT INTO ITEMS VALUES (DEFAULT, 'The Avengers', '17.99', '40', NULL, NULL, 'action', 'm');
INSERT INTO ITEM_TAGS VALUES ('6', 'superheroes');
INSERT INTO ITEM_TAGS VALUES ('6', 'marvel');
INSERT INTO ITEM_TAGS VALUES ('6', 'Avengers');
INSERT INTO ITEM_TAGS VALUES ('6', 'Movie');
INSERT INTO ITEM_TAGS VALUES ('6', 'WALMART');
INSERT INTO SUPPLY VALUES ('6', '4');
