dirname=${PWD##*/}
if [ "$dirname" == "DockerROS" ]
then
  XSOCK=/tmp/.X11-unix
  echo "$DRBUILD"
  if [ "$DRHNAME" == "" ]
  then
    read "docker host machine name (default):" DRHNAME
    if [ "$DRHNAME" == "" ]
    then
      export DRHNAME=default
    fi
  fi
  docker-machine start $DRHNAME
  eval $(docker-machine env $DRHNAME)
  if [ "$DRBUILD" == "y" ]
  then
    docker build -t boraini/dockerros .
  fi
  docker container kill DockerROS
  docker run \
    -v $(pwd .)/workspace:/workspace:rw \
    -v /run/dbus/:/run/dbus/:rw \
    -v /dev/shm:/dev/shm \
    -p 0:6000 \
    --cap-add SYS_PTRACE \
    --device=/dev/dri/card0:/dev/dri/card0 \
    --device=/dev/dri/renderD128:/dev/dri/renderD128 \
    --device=/dev/snd/pcmC0D0p:/dev/snd/pcmC0D0p \
    --device=/dev/snd/controlC0:/dev/snd/controlC0 \
    --device=/dev/snd/seq:/dev/snd/seq \
    -e DISPLAY=":6000" \
    --hostname $DRHNAME \
    --name DockerROS \
    --privileged \
    --rm -it boraini/dockerros
  export DRBUILD=n
fi
