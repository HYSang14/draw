SET NAMES UTF8;
DROP DATABASE IF EXISTS chart;
CREATE DATABASE chart CHARSET=UTF8;
USE chart;
CREATE TABLE tables(
	id INT PRIMARY KEY,
	pric VARCHAR(32),
	source VARCHAR(32),
	channel VARCHAR(32),
	question VARCHAR(32)
);
INSERT INTO tables VALUES(1,'安徽','网页','网页1','你是猪吗？');
INSERT INTO tables VALUES(3,'河南','网页','网页2','你好啊');
INSERT INTO tables VALUES(5,'江苏','网页','网页3','嗯嗯');
INSERT INTO tables VALUES(7,'河北','微信','微信1','好的');
INSERT INTO tables VALUES(9,'山东','APP','APP1','你吃饭了么');
INSERT INTO tables VALUES(11,'西藏','APP','APP1','哇塞啊');
INSERT INTO tables VALUES(13,'新疆','APP','APP1','什么意思？');
INSERT INTO tables VALUES(15,'江西','APP','APP1','如何申请补贴');
INSERT INTO tables VALUES(17,'广州','微信','微信2','虎牙直播');
INSERT INTO tables VALUES(19,'福建','微信','微信1','斗鱼直播');
INSERT INTO tables VALUES(21,'海南','网页','网页1','熊猫直播');
INSERT INTO tables VALUES(23,'上海','网页','网页1','你家住哪？');
INSERT INTO tables VALUES(25,'山东','网页','网页1','你是猪吗？');
INSERT INTO tables VALUES(27,'江西','网页','网页2','你好啊');
INSERT INTO tables VALUES(29,'台湾','网页','网页3','嗯嗯');
INSERT INTO tables VALUES(31,'河南','微信','微信1','好的');
INSERT INTO tables VALUES(33,'西藏','APP','APP1','你吃饭了么');
INSERT INTO tables VALUES(35,'江西','APP','APP1','哇塞啊');
INSERT INTO tables VALUES(37,'湖北','APP','APP2','什么意思？');
INSERT INTO tables VALUES(39,'湖南','APP','APP1','如何申请补贴');
INSERT INTO tables VALUES(41,'湖北','微信','微信2','虎牙直播');
INSERT INTO tables VALUES(43,'江西','微信','微信1','斗鱼直播');
INSERT INTO tables VALUES(45,'江苏','网页','网页1','熊猫直播');
INSERT INTO tables VALUES(47,'江苏','网页','网页1','你家住哪？');
INSERT INTO tables VALUES(49,'河北','网页','网页1','你是猪吗？');
INSERT INTO tables VALUES(51,'江苏','网页','网页2','你好啊');
INSERT INTO tables VALUES(53,'陕西','网页','网页3','嗯嗯');
INSERT INTO tables VALUES(55,'甘肃','微信','微信1','好的');
INSERT INTO tables VALUES(57,'四川','APP','APP1','你吃饭了么');
INSERT INTO tables VALUES(59,'安徽','APP','APP1','哇塞啊');
INSERT INTO tables VALUES(61,'江苏','APP','APP1','什么意思？');
INSERT INTO tables VALUES(63,'上海','APP','APP1','如何申请补贴');
INSERT INTO tables VALUES(65,'台湾','微信','微信2','虎牙直播');
INSERT INTO tables VALUES(67,'山东','微信','微信1','斗鱼直播');
INSERT INTO tables VALUES(69,'陕西','网页','网页1','熊猫直播');
INSERT INTO tables VALUES(71,'山西','网页','网页1','你家住哪？');
INSERT INTO tables VALUES(73,'黑龙江','网页','网页1','你是猪吗？');
INSERT INTO tables VALUES(75,'吉林','网页','网页2','你好啊');
INSERT INTO tables VALUES(77,'西藏','网页','网页3','嗯嗯');
INSERT INTO tables VALUES(79,'安徽','微信','微信1','好的');
INSERT INTO tables VALUES(81,'新疆','APP','APP1','你吃饭了么');
INSERT INTO tables VALUES(83,'上海','APP','APP2','哇塞啊');
INSERT INTO tables VALUES(85,'河南','APP','APP1','什么意思？');
INSERT INTO tables VALUES(87,'青海','APP','APP1','如何申请补贴');
INSERT INTO tables VALUES(89,'香港','微信','微信2','虎牙直播');
INSERT INTO tables VALUES(91,'澳门','微信','微信1','斗鱼直播');
INSERT INTO tables VALUES(93,'河南','网页','网页1','熊猫直播');
INSERT INTO tables VALUES(95,'湖北','网页','网页1','你家住哪？');
CREATE TABLE classes(
	id INT PRIMARY KEY,
	name VARCHAR(32),
	channel VARCHAR(32)
);
INSERT INTO classes VALUES(1,'网页','网页1');
INSERT INTO classes VALUES(3,'网页','网页2');
INSERT INTO classes VALUES(5,'网页','网页3');
INSERT INTO classes VALUES(7,'微信','微信1');
INSERT INTO classes VALUES(1,'微信','微信2');
INSERT INTO classes VALUES(1,'APP','APP1');
INSERT INTO classes VALUES(1,'APP','APP2');