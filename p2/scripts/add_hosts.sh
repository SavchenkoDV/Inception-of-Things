# cheking and add hosts
echo "192.168.56.110 app1.com" | sudo tee -a "/etc/hosts"
echo "192.168.56.110 app2.com" | sudo tee -a "/etc/hosts"
echo "192.168.56.110 app3.com" | sudo tee -a "/etc/hosts"

cat /etc/hosts