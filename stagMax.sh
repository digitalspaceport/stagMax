#!/bin/bash

cd ~/
mkdir stagMax
cd stagMax
wget https://github.com/jollyjollyjolly/chia-plotter/releases/download/beta6/chia_plot
chmod 755 chia_plot
#wget https://packages.slackonly.com/pub/packages/14.2-x86_64/libraries/libsodium/libsodium-1.0.18-x86_64-1_slonly.txz
#upgradepkg --install-new libsodium-1.0.18-x86_64-1_slonly.txz
#wget https://slackware.uk/slackware/slackware64-current/slackware64/ap/screen-4.8.0-x86_64-4.txz
#upgradepkg --install-new screen-4.8.0-x86_64-4.txz
mkdir ~/stagMax/chialogs && chmod 755 ~/stagMax/chialogs
touch ~/stagMax/runme.sh && chmod +x ~/stagMax/runme.sh

#execute on formatted device mounts, make sure you end ALL mounts with a / or it crashes. Double check.
readonly pk='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
readonly fk='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
readonly dir2='/mnt/sdi/'

screen -d -m -S sdf bash -c 'sleep 000m && ~/stagMax/chia_plot -r 8 -n 2 -t /mnt/sdf/ -2 '"$dir2"' -d /mnt/sdf/ -p '"$pk"' -f '"$fk"' | tee ~/stagMax/chialogs/sdf.log'
screen -d -m -S sdd bash -c 'sleep 004m && ~/stagMax/chia_plot -r 8 -n 4 -t /mnt/sdd/ -2 '"$dir2"' -d /mnt/sdd/ -p '"$pk"' -f '"$fk"' | tee ~/stagMax/chialogs/sdd.log'
screen -d -m -S sdc bash -c 'sleep 005m && ~/stagMax/chia_plot -r 8 -n 4 -t /mnt/sdc/ -2 '"$dir2"' -d /mnt/sdc/ -p '"$pk"' -f '"$fk"' | tee ~/stagMax/chialogs/sdc.log'
screen -d -m -S sde bash -c 'sleep 006m && ~/stagMax/chia_plot -r 8 -n 4 -t /mnt/sde/ -2 '"$dir2"' -d /mnt/sde/ -p '"$pk"' -f '"$fk"' | tee ~/stagMax/chialogs/sde.log'
screen -d -m -S sdg bash -c 'sleep 007m && ~/stagMax/chia_plot -r 8 -n 4 -t /mnt/sdg/ -2 '"$dir2"' -d /mnt/sdg/ -p '"$pk"' -f '"$fk"' | tee ~/stagMax/chialogs/sdg.log'
screen -d -m -S sdh bash -c 'sleep 008m && ~/stagMax/chia_plot -r 8 -n 4 -t /mnt/sdh/ -2 '"$dir2"' -d /mnt/sdh/ -p '"$pk"' -f '"$fk"' | tee ~/stagMax/chialogs/sdh.log'

#lets watch it with tail, ctrl-c to quit tail on most machines

tail -f ~/stagMax/chialogs/*.log