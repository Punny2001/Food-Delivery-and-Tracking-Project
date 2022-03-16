INSERT INTO Branch (BranchID, Branch_name, Branch_phoneno, Branch_address)
VALUES
('B001','Head Office', '020212555', 'Thanapoom Building, 30th Floor, New Petchburi Road, Ratchathewi, Bangkok'),
('B002','Charansanitwong', '0956038163', 'Charansanitwong Road, Bangwaek, Bangkok'),
('B003','Minburi (Market Parade Market)', '095593919', 'Room B1, No. 248 Sihaburanukit Road, Minburi Sub-District/District Bangkok'),
('B004','Ramkhamhaeng', '0886582653', 'Grace Bike Shop, Soi Ramkhamhaeng 24 Intersection 10, Ramkhamhaeng Road, Hua Mak, Bang Kapi, Bangkok'),
('B005','Prachauthit', '0982864708', 'Fuchen Badminton Court, Pracha Uthit Road, Thung Khru Subdistrict, Thung Khru District, Bangkok'),
('B006','Pathum Thani', '0814210330', 'DD Security Guard Group Company Limited 661 Phaholyothin Road, Prachathipat Subdistrict, Thanyaburi District, Pathum Thani Province'),
('B007','Nonthaburi', '0967709264', 'T Market, Khlong Thanon 98/1, Moo 11, Bang Rak Phatthana Subdistrict, Bang Bua Thong District, Nonthaburi Province'),
('B008','Samut Prakan', '0619967978', 'Beyond the mouth of Soi Sai Luad 1, about 30 meters, 103/3-4 Sai Luad Road, Pak Nam Subdistrict, Mueang District, Samut Prakan Province');

UPDATE Branch
SET ManagerID = 'SM001'
WHERE BranchID = 'B001';

UPDATE Branch
SET ManagerID = 'SM002'
WHERE BranchID = 'B002';

UPDATE Branch
SET ManagerID = 'SM003'
WHERE BranchID = 'B003';

UPDATE Branch
SET ManagerID = 'SM004'
WHERE BranchID = 'B004';

UPDATE Branch
SET ManagerID = 'SM005'
WHERE BranchID = 'B005';

UPDATE Branch
SET ManagerID = 'SM006'
WHERE BranchID = 'B006';

UPDATE Branch
SET ManagerID = 'SM007'
WHERE BranchID = 'B007';

UPDATE Branch
SET ManagerID = 'SM008'
WHERE BranchID = 'B008';

