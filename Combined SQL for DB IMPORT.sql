-- ****************************************************************************
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- CREATE DB supermarketInventoryDB
-- ****************************************************************************
drop database if exists supermarketInventoryDB; 
create database supermarketInventoryDB; 
use supermarketInventoryDB;
-- ****************************************************************************
-- START
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- TABLES: totalSold
-- ****************************************************************************
create table totalSold (
department varchar(255),
totalSold int
);

insert into totalSold (department, totalSold)
values
('Grocery', 539),
('Non-Foods', 302),
('Frozen', 418),
('Dairy', 498); 
-- ****************************************************************************
-- END
-- TABLES: totalSold
-- ****************************************************************************
-- ****************************************************************************
-- START
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- THIS SQL IS WRITTEN BY JAMES GENGERKE 
-- TABLES: grocery and vendorCode with data
-- ****************************************************************************
-- create table grocery with data:
create table grocery (
    productName varchar(512),
    productUPC varchar(15),
    productCompany varchar(512),
    totalInStock int,
    retailPrice decimal(8,2),
    wholesalePrice decimal(8,2),
    vendorCode int
);
insert into grocery (productName, productUPC, productCompany, totalInStock, retailPrice, wholesalePrice, vendorCode) 
values
('Pure Leaf Lower Sugar Subtly Sweet Peach Real Brewed Tea, 16.9 oz, 6 count', '00012000213571', 'Lipton', 100, 8.29, 3.99, 1),
('Pringles Original Potato Crisps Chips, 5.2 oz', '00038000138416', 'Kellogg Company US', 328, 2.39, 0.99, 1),
('Goldfish Mega Bites Sharp Cheddar Baked Snack Crackers, 26.7 oz', '00014100053897', 'Pepperidge Farm', 481, 11.29, 4.99, 1),
('AriZona Green Tea with Ginseng and Honey, 128 fl oz', '00613008715120', 'AriZona', 256, 3.29, 0.99, 3), 
('Coca-Cola Cans, 7.5 fl oz, 6 Pack', '00049000061017', 'Coca-Cola', 589, 5.29, 2.99, 4), 
('Oreo Cakesters Soft Snack Cakes, 2.02 oz, 5 count', '00044000069940', 'Mondelēz International Foodservice', 390, 4.19, 1.99, 1), 
('OREO Chocolate Sandwich Cookies, 13.29 oz', '00044000060114', 'Mondelēz International Foodservice', 527, 4.19, 1.99, 1),
('Polar Toasted Coconut Premium Seltzer, 12 fl oz, 12 count', '00071537202885',	'Polar', 74, 5.99, 2.99, 1),
('Nestlé Toll House Dark Chocolate Morsels, 20 oz', '00028000394257', 'Nestlé', 184, 6.49, 2.99, 1),
('Nestlé Toll House Semi-Sweet Chocolate Morsels, 24 oz', '00028000215606', 'Nestlé', 156, 6.49, 2.99, 1),
('Cheez-It White Cheddar Cheese Crackers, 21 oz', '00024100440870', 'Kellogg Company US', 192, 6.49, 3.99, 1),
('Cheez-It Original Cheese Crackers, 21 oz', '00024100440702', 'Kellogg Company US', 289, 6.49, 3.99, 1), 
('Hellmann\'s Real Mayonnaise Real Mayo 30 oz', '00048001213487', 'Unilever', 791, 5.99, 2.99, 1),
('Annie\'s Shells & White Cheddar Macaroni & Cheese, 6 oz', '00013562000043', 'General Mills', 428, 2.39, 0.99, 1),
('Barilla Oven-Ready Lasagne Pasta, 9 oz', '00076808515589', 'Barilla', 390, 2.79, 0.75, 1),
('Del Monte Deluxe Gold Pineapple Chunks in 100% Pineapple Juice, 20 oz', '00024000248873', 'Del Monte Foods', 109, 2.19, 0.9, 1), 
('Kellogg\'s Special K Strawberry Pastry Crisps, 5.28 oz, 12 Count', '00038000167782', 'Kellogg Company US', 102, 3.09, 1.06, 1), 
('General Mills Cheerios Honey Nut Cereal, 1 lb 11.5 oz, 2 count', '00016000401068', 'General Mills', 20, 9.49, 7.99, 1),
('Maxwell House 100% Colombian Medium Ground Coffee, 10.5 oz', '00043000029268', 'Kraft Heinz Company', 242, 5.59, 1.99, 1),
('HERSHEY\'S Milk Chocolate Snack Size Candy Bars, Halloween, 10.35 oz', '00034000070534', 'Hershey Trust Company', 278, 4.49, 2.99, 1), 
('Betty Crocker Milk Chocolate Whipped Frosting, 12 oz', '00016000374102', 'General Mills', 182, 2, 0.5, 1), 
('Schmidt Old Tyme Premium Italian Enriched Bread, 20 oz', '00071010200025', 'Schmidt Baking Company', 302, 4.29, 0.99, 1), 
('Lipton Recipe Secrets Soup and Dip Mix Onion 2 oz', '00041000003622', 'Lipton', 384, 2.19, 0.99, 1),
('Entenmann\'s Donuts Variety Pack, 8 count, 15 oz', '00072030014210', 'Entenmanns', 210, 6.59, 1.99, 1), 
('Simply Organic Cinnamon, 2.45 oz', '00089836185136', 'Simply Organic', 104, 4.99, 1.99, 1);   

-- create table vendorInfo with data:
create table vendorInfo (
    vendorCode int,
    vendorName varchar(255),
    vendorType varchar(255)
);
insert into vendorInfo (vendorCode, vendorName, vendorType)
values
(1, 'Keasby', 'commissary'),
(2, 'Bayonne', 'commissary'),
(3, 'AriZona', 'company'),
(4, 'Coca-Cola', 'company'),
(26, 'Chattem Inc.', 'company'),
(91, 'Advil', 'company'),
(256, 'Pictsweet Farms', 'company'),
(300, 'Conagra Brands', 'company');


-- RESET DATA IMPORT:
-- drop table grocery, vendorInfo; 

-- ****************************************************************************
-- END
-- TABLES: grocery and vendorCode with data
-- ****************************************************************************
-- ****************************************************************************
-- START
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- THIS SQL IS WRITTEN BY DANNY CHENG 
-- TABLES: nonfoods
-- ****************************************************************************
-- create table nonFoods with data:
CREATE TABLE nonfoods (
    productName VARCHAR(255),
    productUPC VARCHAR(15),
    productCompany VARCHAR(255),
    totalInStock INT,
    retailPrice DECIMAL(8, 2),
    wholesalePrice DECIMAL(8, 2),
    vendorCode VARCHAR(10)
);

INSERT INTO nonfoods (productName, productUPC, productCompany, totalInStock, retailPrice, wholesalePrice, vendorCode)
VALUES
('Funderdome Rainbow Car Air Freshener', '400260004891', 'Funderdome', 1, 9.99 , 4.99 , 1),
('Funderdome Avocado Car Air Freshener', '400260004976', 'Funderdome', 7, 9.99 , 4.99 , 2),
('AcneFree Oil Free Acne Cream Cleanser ', '3606000537392', 'AcneFree LLC', 15, 7.99 , 5.99 , 1),
('Tagamet HB 200 30 Tabs', '42037103637', 'Tagamet', 22, 8.99 , 6.99 , 1),
('Xyzal Original Prescription Strength 24hr Allergy Tablets', '41167351031', 'CHATTEM INC', 3, 32.99 , 25.99 , 1),
('Little Remedies Gas Relief Drops, 1 fl oz', '756184120415', 'Little Remedies', 9, 7.99 , 4.99 , 1),
('Babyganics Fragrance Free 3x, Laundry Detergent', '813277015215', 'Kas Direct', 25, 12.99 , 10.99 , 1),
('Dapple Baby Bottle & Dish Soap', '892245001252', 'Mainspring Holdings Inc.', 12, 5.99 , 3.99 , 2),
('Aquaphor Advanced Therapy Healing Ointment', '72140032630', 'Aquaphor', 6, 10.89 , 8.89 , 1),
('African Pride Olive Miracle Leave-In Conditioner', '802535434158', 'African Pride', 18, 4.99 , 2.99 , 1),
('Aussie 3 Minute Miracle Curls Conditioner', '381519186691', 'Procter & Gamble', 29, 5.99 , 4.99 , 1),
('Alberto VO5 Ocean Refresh with Sea Minerals Revitalizing Conditioner', ' 816559018799', 'Alberto VO5', 2, 1.19 , 1.19 , 2),
('Barbasol Classic Shaving Cream', '51009000607', 'Barbasol', 8, 5.99 , 4.99 , 1),
('Barbasol Rechargeable Foil Shaver with Stainless Steel Blades', ' 805106840044', 'Barbasol', 14, 14.99 , 12.99 , 1),
('Act Anticavity Fluoride Rinse Alcohol Free Mint', '41167094280', ' Act', 20, 4.99 , 3.99 , 1),
('ACT Kids Anticavity Fluoride Toothpaste, Bubble Gum Blowout', '41167094228', 'Chattem Inc.', 27, 5.49 , 3.49 , 26),
('Ultramax Active Sport Antiperspirant Deodorant', '33200197447', 'Church & Dwight Co. Inc', 5, 3.99 , 2.99 , 1),
('Axe 24 Hour Anti Perspirant Deodorant Invisible Solid Apollo ', '79400260949', 'Axe', 11, 5.79 , 3.79 , 1),
('Advil Chewable Tablets Junior Strength Grape', '305730179201', 'Advil', 26, 5.49 , 3.49 , 91),
('Simply Saline Sterile Nasal Mist Original', '22600029151', 'Simply Saline', 4, 5.49 , 3.49 , 1),
('Curad Basic Care Vinyl Exam Gloves 100 Count', '193489032256', 'Medline Industries Inc.', 9, 8.99 , 6.99 , 1),
('Ava 8.5 Scissors', '813245012338', 'Avantix Inc.', 5, 2.49 , 1.49 , 2),
('Jacent 4 Inch Appetizer Bamboo Skewers', '637118104520', 'Brite Concepts', 10, 4.49 , 3.49 , 1),
('Items 4 U! Grilled Cheese Non-Stick Pan', '852755005492', 'Items 4U', 24, 8.99 , 6.99 , 1),
('A J M Giant Size Lunch Bags', '76955692041', 'A J M', 28, 2.19 , 1.19 , 1);

-- ****************************************************************************
-- END
-- TABLES: nonFoods
-- ****************************************************************************
-- ****************************************************************************
-- START
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- THIS SQL IS WRITTEN BY ANDREW PATILIS 
-- TABLES: frozen
-- ****************************************************************************
-- create table frozen with data:
create table frozen (
    productName varchar(512),
    productCompany varchar(512),
    productUPC varchar(100),
    wholesalePrice decimal(8,2),
    retailPrice decimal(8,2),
    totalInStock int,
    vendorCode int
);
insert into frozen (productName,productCompany, productUPC, wholesalePrice, retailPrice, totalInStock, vendorCode) 
values
('Applegate Natural Homestyle Chicken Tenders, 8oz (Frozen)', 'Hormel', '00025317005586', 0.94, 7.49, 150,1),
('Botticelli Frozen Premium Vegetables Artichoke Quarters, 10 oz','Botticelli', '00855019000998', 0.60, 5.99, 200,1),
('Tyson Anytizers Popcorn Chicken, 24 oz. (Frozen)','Tyson Foods', '00023700014153', 0.42, 10.08, 250,1),
('El Monterey Chicken & Cheese Taquitos, 20 count, 20 oz','EL Monterey' , '00071007401404', 0.36, 7.20, 300,1),
('ShopRite Some Pulp Orange Juice Frozen Concentrate, 12 fl oz','Shoprite', '00041190400959', 0.27, 3.24, 100,1),

('PERDUE® Individually Frozen Chicken Wings, 3 lbs','Perdue Farms', '00072745829840', 0.25, 11.99, 120,1),
('Tyson Buffalo Style Chicken Strips, 25 oz (Frozen)','Tyson Foods',  '00023700014092', 0.40, 9.99, 80,1),
('El Monterey Chicken & Cheese Taquitos, 20 count, 20 oz','El Monterey' ,'00071007401404', 0.36, 7.49, 200,1),
('El Monterey Beef & Cheese Taquitos, 20 count, 20 oz','El Monterey',  '00071007405204', 0.36, 7.49, 150,1),
('El Monterey Egg, Bacon & Cheese Taquitos, 20 count, 20 oz','El Monterey', '00071007405242', 0.36, 7.49, 95,1),

('Tyson Honey BBQ Chicken Strips, 25 oz (Frozen)','Tyson Foods', '00023700014139', 0.40, 9.99, 100,1),
('Alexia Crispy Onion Rings with Panko Breading and Sea Salt, 13.5 oz','Conagra Brands', '00834183007057', 0.44, 5.99, 75,300),
('Pictsweet Farms® Steamables® Edamame with Sea Salt Farm Favorites Frozen Vegetables 10 oz','Pictsweet Farms', '00070560977715', 0.20, 1.98, 150,256),
('Minute Maid Orange Juice Can, 12 fl oz, Frozen Concentrate', 'Coca Cola Company',  '00025000025198', 0.36, 4.29, 200,1),
('State Fair Classic Corn Dogs with Honey Sweetened Batter Frozen, 16 Count','State Fair Classic Corn Dogs', '00071068162054', 0.23, 9.99, 50,1),

('Frontera Chicken Verde Burrito Bowl Frozen Microwave Meal, 10 oz.','Conagra Brands', '00604183009074', 0.50, 4.99, 85,300),
('Birds Eye Stir Fry Veggies and Sauce, Teriyaki, Frozen Vegetables, 15 oz.','Conagra Brands', '00014500031587', 0.27, 3.99, 90,300),
('Healthy Choice Power Bowls Cajun-Style Chicken and Sausage With Riced Cauliflower Frozen, 9.4 oz.','Conagra Brands', '00072655032200', 0.50, 4.69, 110,300),
('Gardein Ultimate Plant-Based Spicy Chickn Filets, Vegan, Frozen, 15 oz','Conagra Brands', '00072655032200', 0.57, 8.49, 70,300),
('Marie Callenders Duos, Chicken Alfredo & Chicken Parmigiana, Frozen Meal, 14.5 oz.','Conagra Brands', '00021131009366', 0.36, 5.19, 65,300),

('Marie Callenders Duos, Meatloaf & Country Fried Chicken, Frozen Meal, 14.2 oz.','Conagra Brands', '00021131009373', 0.37, 5.19, 60,300),
('InnovAsian Sweet & Sour Chicken Frozen Asian Meal, 18 oz','Conagra Brands', '00695119120307', 0.39, 6.99, 100,300),
('P.F. Changs Home Menu Chicken Fried Rice, Frozen Meal, 11 oz.', 'Conagra Brands', '00031000100919', 0.50, 5.49, 80,300),
('Tyson Grilled & Ready Fully Cooked Grilled Chicken Breast Fillets, 19 oz. (Frozen)','Tyson Foods',  '00023700021885', 0.53, 9.99, 75,1),
('Stouffers Tuna Noodle Casserole Frozen Entrée 12 oz','Nestle',  '00013800447883', 0.35, 4.19, 90,1);

-- ****************************************************************************
-- END
-- TABLES: frozen
-- ****************************************************************************
-- ****************************************************************************
-- START
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- THIS SQL IS WRITTEN BY RYAN KINARD
-- TABLES: dairy
-- ****************************************************************************
-- create table dairy with data:

CREATE TABLE dairy (
    productName VARCHAR(255),
    productCompany VARCHAR(255),
    productUPC VARCHAR(20),
    wholesalePrice DECIMAL(5,2),
    retailPrice DECIMAL(5,2),
    totalInStock INT,
    vendorCode INT
);

INSERT INTO dairy (productName, productCompany, productUPC, wholesalePrice, retailPrice, totalInStock, vendorCode) VALUES
('Red Apple Cheese Naturally Good Kosher Swiss Cheese, 8 oz', 'Ronin Equity Partners', '00604262021485', 0.87, 6.99, 35, 1),
('Red Apple Cheese Naturally Good Kosher Not Smoked Provolone Cheese, 8 oz', 'Ronin Equity Partners', '00604262021881', 0.87, 6.99, 45, 1),
('So Delicious Dairy Free Strawberry Coconutmilk Yogurt Alternative, 5.3 oz', 'WhiteWave Foods Company', '00744473000128', 0.32, 1.69, 56, 1),
('So Delicious Dairy Free Blueberry Coconutmilk Yogurt Alternative, 5.3 oz', 'WhiteWave Foods Company', '00744473000104', 0.32, 1.69, 24, 1),
('So Delicious Dairy Free Vanilla Coconutmilk Yogurt Alternative, 24 oz', 'WhiteWave Foods Company', '00744473000319', 0.28, 6.69, 35, 1),
('So Delicious Dairy Free Wondermilk Salted Caramel Sundae Dairy-Free Frozen Dessert 4 fl oz, 3 count', 'WhiteWave Foods Company', '00036632078216', 0.48, 5.79, 15, 1),
('Brown Cow Cream Top Plain Whole Milk Yogurt, 32 oz. Carton', 'Stonyfield Farm, Inc.', '00088194340607', 0.16, 4.99, 12, 1),
('Brown Cow Cream Top Chocolate On Bottom Whole Milk Yogurt, 5.3 oz.', 'Stonyfield Farm, Inc.', '00088194340102', 0.24, 1.29, 14, 1),
('Brown Cow Cream Top Coffee Whole Milk Yogurt 5.3 oz. Cup', 'Stonyfield Farm, Inc.', '00088194340065', 0.24, 1.29, 17, 1),
('Noosa Coconut Finest Yoghurt, 4.5 oz', 'Sovos Brands Intermediate Inc', '00815909020444', 0.40, 1.79, 32, 1),
('Noosa Honey Finest Yoghurt, 8 oz', 'Sovos Brands Intermediate Inc', '00853923002008', 0.30, 2.39, 45, 1),
('Noosa Raspberry Finest Yoghurt, 8 oz', 'Sovos Brands Intermediate Inc', '00853923002404', 0.30, 2.39, 10, 1),
('Noosa Vanilla Bean Finest Yoghurt, 8 oz', 'Sovos Brands Intermediate Inc', '00815909020338', 0.30, 2.39, 19, 1),
('Noosa Salted Caramel Finest Yoghurt, 4.5 oz', 'Sovos Brands Intermediate Inc', '00815909020468', 0.40, 1.79, 24, 1),
('Organic Valley Grassmilk Whole Milk, half gallon', 'Organic Valley', '00093966009989', 0.11, 6.99, 15, 1),
('Organic Valley Reduced Fat Milk, half gallon', 'Organic Valley', '00093966515008', 0.09, 5.99, 22, 1),
('Horizon Organic 1% Lowfat High Vitamin D Milk, Half Gallon', 'Danone', '00742365264153', 0.09, 5.99, 28, 1),
('Horizon Organic High Vitamin D Reduced Fat Milk, 1 gallon', 'Danone', '00742365006746', 0.08, 9.99, 20, 1),
('Horizon Organic High Vitamin D Whole Milk, 1 gallon', 'Danone', '00742365006753', 0.08, 9.99, 11, 1),
('Brown Cow Cream Top Vanilla Whole Milk Yogurt, 5.3 oz. Cup', 'Stonyfield Farm, Inc.', '00088194340027', 0.24, 1.29, 23, 1),
('Philadelphia Original Cream Cheese, 8 oz', 'Kraft Heinz', '00021000612239', 0.44, 3.49, 53, 1),
('Philadelphia Strawberry Cream Cheese Spread, 7.5 oz', 'Kraft Heinz', '00021000007271', 0.63, 4.69, 58, 1),
('Philadelphia Chive & Onion Cream Cheese Spread, 7.5 oz', 'Kraft Heinz', '00021000007288', 0.63, 4.69, 59, 1),
('Daisy Light Sour Cream, 1 lb', 'Daisy Dairy', '00073420000158', 0.17, 2.79, 35, 1),
('Finlandia Gouda Imported Premium Cheese Slices, 10 count, 7 oz', 'Finlandia Cheese', '00673803080069', 0.71, 4.99, 40, 1);

-- ****************************************************************************
-- END
-- TABLES: dairy
-- ****************************************************************************
-- ****************************************************************************
-- START
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- TABLES: totalStock
-- ****************************************************************************
create table totalStock (
Items int,
Departments varchar(255)
);

insert into totalStock (items)
select sum(totalInStock) as groceryTotal from grocery;
update totalStock set Departments=('grocery')
where Items=(select sum(totalInStock) as groceryTotal from grocery);

insert into totalStock (items)
select sum(totalInStock) as nonfoodsTotal from nonfoods;
update totalStock set Departments=('nonFoods')
where Items=(select sum(totalInStock) as nonfoodsTotal from nonfoods);

insert into totalStock (items)
select sum(totalInStock) as frozenTotal from frozen;
update totalStock set Departments=('frozen')
where Items=(select sum(totalInStock) as frozenTotal from frozen);

insert into totalStock (items)
select sum(totalInStock) as dairyTotal from dairy;
update totalStock set Departments=('dairy')
where Items=(select sum(totalInStock) as dairyTotal from dairy);

-- ****************************************************************************
-- END
-- TABLES: totalStock
-- ****************************************************************************
-- ****************************************************************************
-- END
-- DATABASE SQL PROJECT - SUPERMARKET INVENTORY DATABASE
-- ****************************************************************************
