# Jour 1
## Bases
### Cheat sheet:

```bash
roscore  # Démarre le master

rospack <command> [package] # Informations package

rosnode <command> [node] #Information package
```
<p style="text-align: center;">
<a href="https://wiki.ros.org/Tools"> >>>> La bible <<<< </a>
</p>

### Setting up connection with turtle bot

1. Connect your computer and the turtle bot to the same network. The turtle connection is set in `/etc/netplan`; the SD card was plugged in the computer and the partition was mounted to modify the file.

2. ssh to the turtle bot with :

```bash
ssh ubuntu@deer.local
```

3. The following line was added to the turtle bot's `.bashrc`
```bash
export ROS_MASTER_URI=http://grymoir.local:8565
```

4. On local computer, run the docker and inside the docker, run the following lines:

```bash
export ROS_MASTER_URI=http://grymoir.local:8565
roscore -p 8565
```

5. It is now possible to ping the master from the turtle bot:
```bash
rosnode list
```
6. Inside docker, the publisher packages are created in `/mnt/publisher/src`.