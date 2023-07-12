CREATE TABLE admin (
    adminid INT NOT NULL,
    name VARCHAR(10),
    password VARCHAR(10),
    PRIMARY KEY (adminid)
);
CREATE TABLE coupon (
    couponid INT NOT NULL,
    amount INTEGER,
    PRIMARY KEY (couponid)
);
CREATE TABLE customer (
    customerid INT NOT NULL,
    name VARCHAR(10),
    username VARCHAR(10),
    password VARCHAR(10),
    PRIMARY KEY (customerid)
);
CREATE TABLE employee (
    eid INT NOT NULL,
    name VARCHAR (10),
    password VARCHAR(10),
    PRIMARY KEY (eid)
);
CREATE TABLE feedback (
    feedbackid INT NOT NULL,
    description VARCHAR(10),
    customer_customerid INT NOT NULL,
    PRIMARY KEY (feedbackid),
    FOREIGN KEY (customer_customerid) REFERENCES customer(customer_customerid)
);
CREATE TABLE hall (
    hallid INT NOT NULL,
    hallname VARCHAR(10),
    location VARCHAR(10),
    PRIMARY KEY (hallid)
);
CREATE TABLE hallmanagement (
    admin_adminid INT NOT NULL,
    hall_hallid INT NOT NULL,
    PRIMARY KEY (admin_adminid, hall_hallid),
    FOREIGN KEY (admin_adminid) REFERENCES admin (adminid),
    FOREIGN KEY (hall_hallid) REFERENCES hall (hallid)
);
CREATE TABLE screening (
    show_showid INT NOT NULL,
    movie_movieid INT NOT NULL,
    PRIMARY KEY (show_showid, movie_movieid),
    FOREIGN KEY (movie_movieid) REFERENCES movie (movieid),
    FOREIGN KEY (show_showid) REFERENCES show (showid)
);
CREATE TABLE managecoupons (
    admin_adminid INTEGER NOT NULL,
    coupon_couponid INT NOT NULL,
    PRIMARY KEY (admin_adminid, coupon_couponid),
    FOREIGN KEY (admin_adminid) REFERENCES admin (adminid),
    FOREIGN KEY (coupon_couponid) REFERENCES coupon (couponid)
);
CREATE TABLE manages (
    admin_adminid INT NOT NULL,
    employee_eid INT NOT NULL,
    PRIMARY KEY (admin_adminid, employee_eid),
    FOREIGN KEY (admin_adminid) REFERENCES admin (adminid),
    FOREIGN KEY (employee_eid) REFERENCES employee (eid)
);
CREATE TABLE manageshow (
    show_showid INT NOT NULL,
    employee_eid INT NOT NULL,
    PRIMARY KEY (show_showid, employee_eid),
    FOREIGN KEY (employee_eid) REFERENCES employee (eid),
    FOREIGN KEY (show_showid) REFERENCES show (showid)
);
CREATE TABLE managesv1 (
    employee_eid INT NOT NULL,
    refreshment_itemid INTEGER NOT NULL,
    PRIMARY KEY (employee_eid, refreshment_itemid),
    FOREIGN KEY (employee_eid) REFERENCES employee (eid),
    FOREIGN KEY (refreshment_itemid) REFERENCES refreshment (itemid)
);
CREATE TABLE movie (
    movieid INTEGER NOT NULL,
    moviename CLOB,
    genre VARCHAR(10),
    reviews VARCHAR(10),
    director VARCHAR(10),
    releasedate VARCHAR(10),
    PRIMARY KEY (movieid)
);
CREATE TABLE notification (
    nid INTEGER NOT NULL,
    "date" VARCHAR(10),
    description VARCHAR(10),
    PRIMARY KEY (nid)
);
CREATE TABLE operation (
    employee_eid INTEGER NOT NULL,
    notification_nid INTEGER NOT NULL,
    PRIMARY KEY (employee_eid, notification_nid),
    FOREIGN KEY (employee_eid) REFERENCES employee (eid),
    FOREIGN KEY (notification_nid) REFERENCES notification (nid)
);
CREATE TABLE refreshment (
    itemid INT NOT NULL,
    itemname VARCHAR(10),
    description VARCHAR(10),
    PRIMARY KEY (itemid)
);
CREATE TABLE show (
    showid INT NOT NULL,
    timing varchar(10),
    "date" VARCHAR (10),
    PRIMARY KEY (showid)
);
CREATE TABLE ticket (
    ticketid INTEGER NOT NULL,
    price INTEGER,
    customer_customerid INTEGER NOT NULL,
    coupon_couponid INTEGER NOT NULL,
    show_showid INTEGER NOT NULL,
    PRIMARY KEY (ticketid),
    FOREIGN KEY (coupon_couponid) REFERENCES coupon (couponid),
    FOREIGN KEY (customer_customerid) REFERENCES customer (customerid),
    FOREIGN KEY (show_showid) REFERENCES show (showid)
);



  
INSERT INTO admin (adminid, name, password) VALUES (1, 'John Doe', 'admin123');
INSERT INTO admin (adminid, name, password) VALUES (2, 'Jane Smith', 'password456');
INSERT INTO admin (adminid, name, password) VALUES (3, 'Sarah Adams', 'admin987');
INSERT INTO admin (adminid, name, password) VALUES (4, 'David Wilson', 'passadmin123');
INSERT INTO admin (adminid, name, password) VALUES (5, 'Karen Thompson', 'adminpass456');
INSERT INTO admin (adminid, name, password) VALUES (6, 'Michael Smith', 'admin13');
INSERT INTO admin (adminid, name, password) VALUES (7, 'Jessica Johnson', 'password436');
INSERT INTO admin (adminid, name, password) VALUES (8, 'Andrew Wilson', 'admin654');
INSERT INTO admin (adminid, name, password) VALUES (9, 'Emma Thompson', 'passadmin907');
INSERT INTO admin (adminid, name, password) VALUES (10, 'Christopher Davis', 'adminpass107');
 

INSERT INTO coupon (couponid, amount) VALUES (1, 10);
INSERT INTO coupon (couponid, amount) VALUES (2, 20);
INSERT INTO coupon (couponid, amount) VALUES (3, 15);
INSERT INTO coupon (couponid, amount) VALUES (4, 25);
INSERT INTO coupon (couponid, amount) VALUES (5, 30);
INSERT INTO coupon (couponid, amount) VALUES (6, 5);
INSERT INTO coupon (couponid, amount) VALUES (7, 10);
INSERT INTO coupon (couponid, amount) VALUES (8, 15);
INSERT INTO coupon (couponid, amount) VALUES (9, 20);
INSERT INTO coupon (couponid, amount) VALUES (10, 25);
INSERT INTO coupon (couponid, amount) VALUES (11, 10);
INSERT INTO coupon (couponid, amount) VALUES (12, 20);
INSERT INTO coupon (couponid, amount) VALUES (13, 15);
INSERT INTO coupon (couponid, amount) VALUES (14, 25);
INSERT INTO coupon (couponid, amount) VALUES (15, 30);
INSERT INTO coupon (couponid, amount) VALUES (16, 5);
INSERT INTO coupon (couponid, amount) VALUES (17, 10);
INSERT INTO coupon (couponid, amount) VALUES (18, 15);
INSERT INTO coupon (couponid, amount) VALUES (19, 20);
INSERT INTO coupon (couponid, amount) VALUES (20, 25);
 

INSERT INTO customer (customerid, name, username, password) VALUES (1, 'Alice Johnson', 'alice23', 'pass789');
INSERT INTO customer (customerid, name, username, password) VALUES (2, 'Bob Thompson', 'bob88', 'secureuwd');
INSERT INTO customer (customerid, name, username, password) VALUES (3, 'Mark Davis', 'mark85', 'customer763');
INSERT INTO customer (customerid, name, username, password) VALUES (4, 'Emily Wilson', 'emily28', 'passcustomer463');
INSERT INTO customer (customerid, name, username, password) VALUES (5, 'Samuel Roberts', 'sam98', 'customerpass456');
INSERT INTO customer (customerid, name, username, password) VALUES (6, 'Sophie Wilson', 'sophie34', 'pass73');
INSERT INTO customer (customerid, name, username, password) VALUES (7, 'Henry Roberts', 'henry56', 'securepwd');
INSERT INTO customer (customerid, name, username, password) VALUES (8, 'Grace Davis', 'grace72', 'customer23');
INSERT INTO customer (customerid, name, username, password) VALUES (9, 'Sebastian Thompson', 'seb89', 'passcustomer46');
INSERT INTO customer (customerid, name, username, password) VALUES (10, 'Lily Adams', 'lily99', 'customerpass79');
INSERT INTO customer (customerid, name, username, password) VALUES (11, 'Jackson Wilson', 'jackson77', 'pass12');
INSERT INTO customer (customerid, name, username, password) VALUES (12, 'Victoria Davis', 'victoria44', 'securewd');
INSERT INTO customer (customerid, name, username, password) VALUES (13, 'Ryan Thompson', 'ryan78', 'customer23');
INSERT INTO customer (customerid, name, username, password) VALUES (14, 'Zoe Adams', 'zoe22', 'passcustomer456');
INSERT INTO customer (customerid, name, username, password) VALUES (15, 'Christopher Johnson', 'chris33', 'customerpass89');
INSERT INTO customer (customerid, name, username, password) VALUES (16, 'Nora Wilson', 'nora12', 'pass123');
INSERT INTO customer (customerid, name, username, password) VALUES (17, 'Elijah Davis', 'elijah90', 'securepwd');
INSERT INTO customer (customerid, name, username, password) VALUES (18, 'Avery Thompson', 'avery46', 'customer123');
INSERT INTO customer (customerid, name, username, password) VALUES (19, 'Hannah Adams', 'hannah65', 'passcustomer456');
INSERT INTO customer (customerid, name, username, password) VALUES (20, 'Benjamin Johnson', 'ben88', 'customerpass789');
 


INSERT INTO employee (eid, name, password) VALUES (1, 'Michael Brown', 'emp367');
INSERT INTO employee (eid, name, password) VALUES (2, 'Emily Davis', 'emp789');
INSERT INTO employee (eid, name, password) VALUES (3, 'Jennifer Johnson', 'emp987');
INSERT INTO employee (eid, name, password) VALUES (4, 'Robert Smith', 'employeepass321');
INSERT INTO employee (eid, name, password) VALUES (5, 'Laura Davis', 'emp456');
INSERT INTO employee (eid, name, password) VALUES (6, 'Alexander Wilson', 'emp654');
INSERT INTO employee (eid, name, password) VALUES (7, 'Charlotte Davis', 'emp978');
INSERT INTO employee (eid, name, password) VALUES (8, 'Gabriel Johnson', 'emp123');
INSERT INTO employee (eid, name, password) VALUES (9, 'Scarlett Roberts', 'employeepass987');
INSERT INTO employee (eid, name, password) VALUES (10, 'Henry Davis', 'emp785');
INSERT INTO employee (eid, name, password) VALUES (11, 'Zoey Johnson', 'emp799');
INSERT INTO employee (eid, name, password) VALUES (12, 'Carter Adams', 'emp947');
INSERT INTO employee (eid, name, password) VALUES (13, 'Mila Thompson', 'employeepass237');
INSERT INTO employee (eid, name, password) VALUES (14, 'Liam Davis', 'emp496');
INSERT INTO employee (eid, name, password) VALUES (15, 'Harper Roberts', 'emp729');
INSERT INTO employee (eid, name, password) VALUES (16, 'Lucas Johnson', 'emp907');
INSERT INTO employee (eid, name, password) VALUES (17, 'Aria Adams', 'employeepass923');
INSERT INTO employee (eid, name, password) VALUES (18, 'Jackson Thompson', 'emp102');
INSERT INTO employee (eid, name, password) VALUES (19, 'Evelyn Davis', 'emp105');
INSERT INTO employee (eid, name, password) VALUES (20, 'Caleb Roberts', 'emp621');
 


INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (1, 'Great service!', 1);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (2, 'Could be better.', 2);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (3, 'The seats were uncomfortable.', 3);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (4, 'Excellent customer service!', 4);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (5, 'The sound quality needs improvement.', 5);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (6, 'Loved the movie!', 6);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (7, 'Average experience.', 7);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (8, 'Great service!', 8);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (9, 'The food was delicious.', 9);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (10, 'The staff was friendly.', 10);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (11, 'Movie was disappointing.', 11);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (12, 'Could be better.', 12);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (13, 'Service was slow.', 13);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (14, 'Loved the ambiance.', 14);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (15, 'Movie was thrilling!', 15);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (16, 'Could improve cleanliness.', 16);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (17, 'Theater seats were uncomfortable.', 17);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (18, 'Good value for money.', 18);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (19, 'Not worth the price.', 19);
INSERT INTO feedback (feedbackid, description, customer_customerid) VALUES (20, 'Highly recommended!', 20);
 

INSERT INTO hall (hallid, hallname, location) VALUES (1, 'Hall A', 'New York');
INSERT INTO hall (hallid, hallname, location) VALUES (2, 'Hall B', ' Phoenix');
INSERT INTO hall (hallid, hallname, location) VALUES (3, 'Hall C', ' Atlanta ');
INSERT INTO hall (hallid, hallname, location) VALUES (4, 'Hall D', 'San Francisco');
INSERT INTO hall (hallid, hallname, location) VALUES (5, 'Hall E', 'Miami');
INSERT INTO hall (hallid, hallname, location) VALUES (6, 'Hall F', 'Seattle');
INSERT INTO hall (hallid, hallname, location) VALUES (7, 'Hall G', 'Houston');
INSERT INTO hall (hallid, hallname, location) VALUES (8, 'Hall H', 'Boston');
INSERT INTO hall (hallid, hallname, location) VALUES (9, 'Hall I', 'Atlanta');
INSERT INTO hall (hallid, hallname, location) VALUES (10, 'Hall J', 'Denver');
INSERT INTO hall (hallid, hallname, location) VALUES (11, 'Hall K', 'Dallas');
INSERT INTO hall (hallid, hallname, location) VALUES (12, 'Hall L', 'Phoenix');
INSERT INTO hall (hallid, hallname, location) VALUES (13, 'Hall M', 'Las Vegas');
INSERT INTO hall (hallid, hallname, location) VALUES (14, 'Hall N', ' Austin ');
INSERT INTO hall (hallid, hallname, location) VALUES (15, 'Hall O', ' Seattle ');
INSERT INTO hall (hallid, hallname, location) VALUES (16, 'Hall P', 'Washington');
INSERT INTO hall (hallid, hallname, location) VALUES (17, 'Hall Q', 'Philadelphia');
INSERT INTO hall (hallid, hallname, location) VALUES (18, 'Hall R', 'Austin');
INSERT INTO hall (hallid, hallname, location) VALUES (19, 'Hall S', 'Miami');
INSERT INTO hall (hallid, hallname, location) VALUES (20, 'Hall T', 'San Antonio');

 


INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (1, 1);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (2, 2);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (3, 3);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (4, 4);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (5, 5);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (6, 6);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (7, 7);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (8, 8);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (9, 9);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (10, 10);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (11, 11);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (12, 12);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (13, 13);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (14, 14);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (15, 15);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (16, 16);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (17, 17);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (18, 18);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (19, 19);
INSERT INTO hallmanagement (admin_adminid, hall_hallid) VALUES (20, 20);
 

INSERT INTO screening (show_showid, movie_movieid) VALUES (1, 1);
INSERT INTO screening (show_showid, movie_movieid) VALUES (2, 2);
INSERT INTO screening (show_showid, movie_movieid) VALUES (3, 3);
INSERT INTO screening (show_showid, movie_movieid) VALUES (4, 4);
INSERT INTO screening (show_showid, movie_movieid) VALUES (5, 5);
INSERT INTO screening (show_showid, movie_movieid) VALUES (6, 6);
INSERT INTO screening (show_showid, movie_movieid) VALUES (7, 7);
INSERT INTO screening (show_showid, movie_movieid) VALUES (8, 8);
INSERT INTO screening (show_showid, movie_movieid) VALUES (9, 9);
INSERT INTO screening (show_showid, movie_movieid) VALUES (10, 10);
INSERT INTO screening (show_showid, movie_movieid) VALUES (11, 11);
INSERT INTO screening (show_showid, movie_movieid) VALUES (12, 12);
INSERT INTO screening (show_showid, movie_movieid) VALUES (13, 13);
INSERT INTO screening (show_showid, movie_movieid) VALUES (14, 14);
INSERT INTO screening (show_showid, movie_movieid) VALUES (15, 15);
INSERT INTO screening (show_showid, movie_movieid) VALUES (16, 16);
INSERT INTO screening (show_showid, movie_movieid) VALUES (17, 17);
INSERT INTO screening (show_showid, movie_movieid) VALUES (18, 18);
INSERT INTO screening (show_showid, movie_movieid) VALUES (19, 19);
INSERT INTO screening (show_showid, movie_movieid) VALUES (20, 20);

 


INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (1, 1);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (2, 2);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (3, 3);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (4, 4);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (5, 5);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (6, 6);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (7, 7);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (8, 8);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (9, 9);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (10, 10);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (11, 11);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (12, 12);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (13, 13);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (14, 14);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (15, 15);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (16, 16);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (17, 17);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (18, 18);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (19, 19);
INSERT INTO managecoupons (admin_adminid, coupon_couponid) VALUES (20, 20);
 


INSERT INTO manages (admin_adminid, employee_eid) VALUES (1, 1);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (2, 2);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (3, 3);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (4, 4);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (5, 5);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (6, 6);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (7, 7);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (8, 8);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (9, 9);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (10, 10);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (11, 11);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (12, 12);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (13, 13);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (14, 14);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (15, 15);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (16, 16);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (17, 17);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (18, 18);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (19, 19);
INSERT INTO manages (admin_adminid, employee_eid) VALUES (20, 20);
 

INSERT INTO manageshow (show_showid, employee_eid) VALUES (1, 1);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (2, 2);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (3, 3);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (4, 4);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (5, 5);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (6, 6);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (7, 7);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (8, 8);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (9, 9);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (10, 10);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (11, 11);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (12, 12);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (13, 13);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (14, 14);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (15, 15);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (16, 16);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (17, 17);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (18, 18);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (19, 19);
INSERT INTO manageshow (show_showid, employee_eid) VALUES (20, 20);
 

INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (1, 1);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (2, 2);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (3, 3);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (4, 4);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (5, 5);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (6, 6);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (7, 7);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (8, 8);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (9, 9);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (10, 10);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (11, 11);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (12, 12);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (13, 13);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (14, 14);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (15, 15);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (16, 16);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (17, 17);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (18, 18);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (19, 19);
INSERT INTO managesv1 (employee_eid, refreshment_itemid) VALUES (20, 20);
 



INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (1, 'The Great Gatsby', 'Drama', 'Positive', 'Baz Luhrmann', '2013-05-10');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (2, 'Inception', 'Sci-Fi', 'Highly acclaimed', 'Christopher Nolan', '2010-07-16');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (3, 'The Shawshank Redemption', 'Drama', 'Highly acclaimed', 'Frank Darabont', '1994-09-23');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (4, 'The Dark Knight', 'Action', 'Blockbuster', 'Christopher Nolan', '2008-07-18');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (5, 'Pulp Fiction', 'Crime', 'Cult classic', 'Quentin Tarantino', '1994-10-14');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (6, 'Movie F', 'Action', 'Good', 'Director F', '2023-05-01');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (7, 'Movie G', 'Drama', 'Excellent', 'Director G', '2023-05-02');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (8, 'Movie H', 'Comedy', 'Average', 'Director H', '2023-05-03');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (9, 'Movie I', 'Thriller', 'Good', 'Director I', '2023-05-04');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (10, 'Movie J', 'Action', 'Excellent', 'Director J', '2023-05-05');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (11, 'Movie K', 'Drama', 'Average', 'Director K', '2023-05-06');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (12, 'Movie L', 'Comedy', 'Good', 'Director L', '2023-05-07');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (13, 'Movie M', 'Thriller', 'Excellent', 'Director M', '2023-05-08');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (14, 'Movie N', 'Action', 'Average', 'Director N', '2023-05-09');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (15, 'Movie O', 'Drama', 'Good', 'Director O', '2023-05-10');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (16, 'Movie P', 'Comedy', 'Excellent', 'Director P', '2023-05-11');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (17, 'Movie Q', 'Thriller', 'Average', 'Director Q', '2023-05-12');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (18, 'Movie R', 'Action', 'Good', 'Director R', '2023-05-13');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (19, 'Movie S', 'Drama', 'Excellent', 'Director S', '2023-05-14');
INSERT INTO movie (movieid, moviename, genre, reviews, director, releasedate) VALUES (20, 'Movie T', 'Comedy', 'Average', 'Director T', '2023-05-15');
 



INSERT INTO notification (nid, "date", description) VALUES (1, '2023-05-15', 'Upcoming event: Movie Marathon');
INSERT INTO notification (nid, "date", description) VALUES (2, '2023-05-16', 'Schedule change: Movie showtime');
INSERT INTO notification (nid, "date", description) VALUES (3, '2023-05-17', 'Special discount on tickets!');
INSERT INTO notification (nid, "date", description) VALUES (4, '2023-05-18', 'Movie premiere tonight!');
INSERT INTO notification (nid, "date", description) VALUES (5, '2023-05-19', 'Upcoming movie marathon event');
INSERT INTO notification (nid, "date", description) VALUES (6, '2023-05-20', 'New movie release!');
INSERT INTO notification (nid, "date", description) VALUES (7, '2023-05-21', 'Special screening event');
INSERT INTO notification (nid, "date", description) VALUES (8, '2023-05-22', 'Limited-time offer: Buy one, get one free');
INSERT INTO notification (nid, "date", description) VALUES (9, '2023-05-23', 'Upcoming movie premiere');
INSERT INTO notification (nid, "date", description) VALUES (10, '2023-05-24', 'Discounted tickets for students');
INSERT INTO notification (nid, "date", description) VALUES (11, '2023-05-25', 'Exclusive VIP event');
INSERT INTO notification (nid, "date", description) VALUES (12, '2023-05-26', 'Newly added movie showtime');
INSERT INTO notification (nid, "date", description) VALUES (13, '2023-05-27', 'Special offer: Free popcorn with ticket purchase');
INSERT INTO notification (nid, "date", description) VALUES (14, '2023-05-28', 'Upcoming movie marathon');
INSERT INTO notification (nid, "date", description) VALUES (15, '2023-05-29', 'Limited seating available for popular movie');
INSERT INTO notification (nid, "date", description) VALUES (16, '2023-05-30', 'Exclusive advanced screening');
INSERT INTO notification (nid, "date", description) VALUES (17, '2023-05-31', 'Newly released movie now showing');
INSERT INTO notification (nid, "date", description) VALUES (18, '2023-06-01', 'Special event: Q&A with movie director');
INSERT INTO notification (nid, "date", description) VALUES (19, '2023-06-02', 'Upcoming blockbuster movie');
INSERT INTO notification (nid, "date", description) VALUES (20, '2023-06-03', 'Limited-time discount on refreshments');

 

INSERT INTO operation (employee_eid, notification_nid) VALUES (1, 1);
INSERT INTO operation (employee_eid, notification_nid) VALUES (2, 2);
INSERT INTO operation (employee_eid, notification_nid) VALUES (3, 3);
INSERT INTO operation (employee_eid, notification_nid) VALUES (4, 4);
INSERT INTO operation (employee_eid, notification_nid) VALUES (5, 5);
INSERT INTO operation (employee_eid, notification_nid) VALUES (6, 6);
INSERT INTO operation (employee_eid, notification_nid) VALUES (7, 7);
INSERT INTO operation (employee_eid, notification_nid) VALUES (8, 8);
INSERT INTO operation (employee_eid, notification_nid) VALUES (9, 9);
INSERT INTO operation (employee_eid, notification_nid) VALUES (10, 10);
INSERT INTO operation (employee_eid, notification_nid) VALUES (11, 11);
INSERT INTO operation (employee_eid, notification_nid) VALUES (12, 12);
INSERT INTO operation (employee_eid, notification_nid) VALUES (13, 13);
INSERT INTO operation (employee_eid, notification_nid) VALUES (14, 14);
INSERT INTO operation (employee_eid, notification_nid) VALUES (15, 15);
INSERT INTO operation (employee_eid, notification_nid) VALUES (16, 16);
INSERT INTO operation (employee_eid, notification_nid) VALUES (17, 17);
INSERT INTO operation (employee_eid, notification_nid) VALUES (18, 18);
INSERT INTO operation (employee_eid, notification_nid) VALUES (19, 19);
INSERT INTO operation (employee_eid, notification_nid) VALUES (20, 20);
 

INSERT INTO refreshment (itemid, itemname, description) VALUES (1, 'Popcorn', 'Classic movie snack');
INSERT INTO refreshment (itemid, itemname, description) VALUES (2, 'Soda', 'Refreshing beverage');
INSERT INTO refreshment (itemid, itemname, description) VALUES (3, 'Nachos', 'Crunchy snack');
INSERT INTO refreshment (itemid, itemname, description) VALUES (4, 'Hot Dog', 'Classic cinema food');
INSERT INTO refreshment (itemid, itemname, description) VALUES (5, 'Ice Cream', 'Sweet treat');
INSERT INTO refreshment (itemid, itemname, description) VALUES (6, 'Candy', 'Assorted sweet treats');
INSERT INTO refreshment (itemid, itemname, description) VALUES (7, 'Popcorn Combo', 'Popcorn with a drink');
INSERT INTO refreshment (itemid, itemname, description) VALUES (8, 'Pizza', 'Delicious pizza slices');
INSERT INTO refreshment (itemid, itemname, description) VALUES (9, 'Mozzarella Sticks', 'Cheesy appetizers');
INSERT INTO refreshment (itemid, itemname, description) VALUES (10, 'Pretzel', 'Salty snack');
INSERT INTO refreshment (itemid, itemname, description) VALUES (11, 'Coffee', 'Hot beverage');
INSERT INTO refreshment (itemid, itemname, description) VALUES (12, 'Smoothie', 'Refreshing fruit drink');
INSERT INTO refreshment (itemid, itemname, description) VALUES (13, 'Cheeseburger', 'Classic fast food');
INSERT INTO refreshment (itemid, itemname, description) VALUES (14, 'Fries', 'Crispy side dish');
INSERT INTO refreshment (itemid, itemname, description) VALUES (15, 'Brownie', 'Rich chocolate dessert');
INSERT INTO refreshment (itemid, itemname, description) VALUES (16, 'Sundae', 'Ice cream with toppings');
INSERT INTO refreshment (itemid, itemname, description) VALUES (17, 'Salad', 'Healthy option');
INSERT INTO refreshment (itemid, itemname, description) VALUES (18, 'Chicken Wings', 'Spicy appetizers');
INSERT INTO refreshment (itemid, itemname, description) VALUES (19, 'Hot Chocolate', 'Warm and comforting drink');
INSERT INTO refreshment (itemid, itemname, description) VALUES (20, 'Soft Pretzel', 'Freshly baked pretzel');
 

INSERT INTO show (showid, timing, "date") VALUES (1, '14:00', '2023-05-20');
INSERT INTO show (showid, timing, "date") VALUES (2, '19:30', '2023-05-21');
INSERT INTO show (showid, timing, "date") VALUES (3, '16:30', '2023-05-22');
INSERT INTO show (showid, timing, "date") VALUES (4, '21:00', '2023-05-23');
INSERT INTO show (showid, timing, "date") VALUES (5, '13:00', '2023-05-24');
INSERT INTO show (showid, showtime, screen_screenid) VALUES (6, '2023-06-04 10:00:00', 6);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (7, '2023-06-04 12:30:00', 7);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (8, '2023-06-04 15:00:00', 8);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (9, '2023-06-04 17:30:00', 9);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (10, '2023-06-04 20:00:00', 10);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (11, '2023-06-05 10:00:00', 11);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (12, '2023-06-05 12:30:00', 12);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (13, '2023-06-05 15:00:00', 13);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (14, '2023-06-05 17:30:00', 14);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (15, '2023-06-05 20:00:00', 15);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (16, '2023-06-06 10:00:00', 16);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (17, '2023-06-06 12:30:00', 17);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (18, '2023-06-06 15:00:00', 18);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (19, '2023-06-06 17:30:00', 19);
INSERT INTO show (showid, showtime, screen_screenid) VALUES (20, '2023-06-06 20:00:00', 20);
 

INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (1, 15, 1, 1, 1);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (2, 20, 2, 2, 2);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (3, 18, 3, 2, 3);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (4, 22, 4, 1, 4);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (5, 16, 5, 3, 5);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (6, 12, 6, 4, 6);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (7, 18, 7, 5, 7);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (8, 14, 8, 3, 8);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (9, 20, 9, 2, 9);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (10, 16, 10, 1, 10);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (11, 22, 11, 6, 11);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (12, 17, 12, 7, 12);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (13, 19, 13, 8, 13);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (14, 15, 14, 9, 14);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (15, 21, 15, 10, 15);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (16, 13, 16, 11, 16);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (17, 23, 17, 12, 17);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (18, 16, 18, 13, 18);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (19, 24, 19, 14, 19);
INSERT INTO ticket (ticketid, price, customer_customerid, coupon_couponid, show_showid) VALUES (20, 18, 20, 15, 20);
