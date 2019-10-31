# Enable normal user login in MySql

`sudo mysql -u root`

```
SELECT User,Host FROM mysql.user;
DROP USER 'root'@'localhost';
CREATE USER 'root'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
