# DockerROS
the Docker image I created to eliminate the troubles of running a VM on my MacBook

## Requirements
- Configured on a MacBook Pro Late 2016. Made to run on Homebrew Docker using Homebrew VirtualBox
- A docker-machine you previously created.

## Usage
($ indicates host terminal and # indicates docker root terminal)
- $ `export $DRHNAME=machine_name` in Terminal
- $ `export $DRBUILD=y` to configure building. Required only if you started the docker-machine the first time.
- $ `sh run.sh` Hopefully you will get a terminal running at the docker-machine's root.
- # `cd workspace/ && catkin_make && source devel/setup.bash`
- To start another terminal on the same machine:
 - Start new Terminal window/tab
 - $ `docker exec -it DockerROS bash` Hopefully you will get a terminal running at the docker-machine's root.
- To setup XQuartz for graphics:
 - Find your local IP address by running $ `ifconfig` and finding en0: IPv4 address.
 - Copy the X11config to "~/.ssh/config" (config is the file, not a directory)
 - Start XQuartz
 - $ `xhost + [ip]`
 - # `export DISPLAY=[ip]:0`
 - Try launching a stageros, for example. (robotcraft2018 maze.launch was used in the tests.)
## Current Status
- Although X11 works fine, the main aim was running Gazebo in it and there is a lot of work to do. ALSA lib (who needs f*ing sounds in Gazebo?) and libgl still produce errors.
