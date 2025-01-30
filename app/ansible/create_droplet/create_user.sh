#!/bin/bash
adduser --disabled-password --gecos "" {{ new_user }}
echo "{{ new_user }}:{{ user_password }}" | chpasswd
usermod -aG sudo {{ new_user }}
su - {{ new_user }} -c 'mkdir -p ~/.ssh && chmod 700 ~/.ssh && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys'
echo "{{ ssh_public_key }}" > /home/{{ new_user }}/.ssh/authorized_keys
chown -R {{ new_user }}:{{ new_user }} /home/{{ new_user }}/.ssh
