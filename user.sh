cp user.servicefile /etc/systemd/system/user.service
cp mongorepo cp mongo.repofile /etc/yum.repos.d/mongo.repo

dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app
npm install
dnf install mongodb-org-shell -y
mongo --host 172.31.92.208 </app/schema/user.js

systemctl enable user
systemctl start user
