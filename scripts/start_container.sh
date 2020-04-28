#!/bin/sh

cd /ostis/sc-machine/web/client
yarn && yarn run webpack-dev

cd /ostis/scripts
./build_kb.sh

cd /ostis/sc-machine/scripts
./make_all.sh
cat ../bin/config.ini | sudo tee -a ../../config/sc-web.ini

cd /ostis/scripts
./run_sctp.sh &
echo "\n\e[1;32mStarting the old sc-web on http://localhost:8000 and the new on http://localhost:8090...\e[0m\n"
./run_scweb.sh

