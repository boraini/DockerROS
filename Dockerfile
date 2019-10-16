FROM osrf/ros:melodic-desktop-full-bionic
WORKDIR /workspace
#RUN useradd -m $USERNAME
#RUN echo "$USERNAME:$USERNAME" | chpasswd
#RUN usermod --shell /bin/bash $USERNAME
#RUN usermod -aG sudo $USERNAME
#RUN mkdir /etc/sudoers.d/
#RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME
#RUN chmod 0440 /etc/sudoers.d/$USERNAME
#RUN usermod  --uid 1000 $USERNAME
#RUN groupmod --gid 1000 $USERNAME
