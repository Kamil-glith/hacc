touch commands.txt
echo "exit" > commands.txt


for i in $(seq 1 30);
do
    ssh 192.168.2.$i  'bash -s' < commands.txt
done