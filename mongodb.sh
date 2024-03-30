cp mongo.repofile /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y

#Update listen address from 127.0.0.1 to 0.0.0.0 in

systemctl enable mongod
systemctl start mongod
