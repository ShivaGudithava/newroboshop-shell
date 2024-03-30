cp shipping.servicefile /etc/systemd/system/shipping.service

dnf install maven -y

useradd roboshop
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar

dnf install mysql -y
mysql -h 172.31.90.221 -uroot -pRoboShop@1 < /app/schema/shipping.sql

systemctl enable shipping
systemctl start shipping


