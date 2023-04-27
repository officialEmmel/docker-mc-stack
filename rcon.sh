#!/bin/bash

# Small script to handle the itzg/rcon-cli connection

read -p "IP: (default: 127.0.0.1)" ip
read -p "Port: (default: 25565)" port
read -s -p "Password: " password

if [ -z "$ip" ]; then
    ip="127.0.0.1"
fi

if [ -z "$port" ]; then
    port="25565"
fi

if -z "$password" ]; then
    echo "Password is required"
    exit 1
fi

echo "starting rcon client connecting to $ip:$port"

#check if client executable exists
if [ ! -f "rcon-cli" ]; then
    echo "rcon-cli executable not found, downloading..."
    read -p "Architecture: (default: linux_amd64): " arch
    if [ -z "$arch" ]; then
        arch="linux_amd64"
    fi
    wget -q "https://github.com/itzg/rcon-cli/releases/download/1.6.1/rcon-cli_1.6.1_$arch.tar.gz" -O rcon-cli.tar.gz
    tar -xzf rcon-cli.tar.gz
    rm rcon-cli.tar.gz
fi

./rcon-cli --host $ip --port $port --password $password

