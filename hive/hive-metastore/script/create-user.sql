create user 'hive'@'%' identified by 'Hive2016!';
grant all privileges on *.* to 'hive'@'%';
create user 'hive'@'localhost' identified by 'Hive2016!';
grant all privileges on *.* to 'hive'@'%';
flush privileges;
