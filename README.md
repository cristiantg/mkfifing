# mkfifing

First terminal:

```
cd mkfifing
chmod 770 ./*
./init.sh
./server.sh
```

Also you can run ```./start.sh``` instead of ```./server.sh``` to send the process to the background. In this case, use ```tail -f nohup.out``` to see in real-time the changes and ```ps -u <YOUR_USERNAME>``` to see the PID of the ./server.sh process to kill it when you want to stop it.

Second terminal:

```
cd mkfifing
./cli request response
```
