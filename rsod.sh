touch commands.txt
echo "Attack time:"
read t
echo "export DISPLAY=:0
wget https://i.ibb.co/xCjTJBs/1.png -O 1.png
timeout $t eog 1.png -f
rm 1.png
exit" > commands.txt

for i in $(seq 1 3);
do
    gnome-terminal -e "sshpass -p \"Pa\$\$w0rd\" ssh 192.168.2.$i 'bash -s' < commands.txt"
done