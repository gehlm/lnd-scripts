#!/bin/bash
# requires jq

BLOCKCOUNT=$(bitcoin-cli getblockcount)
CURRHASH=$(bitcoin-cli getblockhash $BLOCKCOUNT)
DIFFICULTY=$(bitcoin-cli getdifficulty)
CONNCOUNT=$(bitcoin-cli getconnectioncount)
FEES=$(bitcoin-cli getblockstats $BLOCKCOUNT | jq '.totalfee / 100000000')
TX=$(bitcoin-cli getmempoolinfo | jq '.size')
SIZE=$(bitcoin-cli getmempoolinfo | jq '.bytes / 1048576')
SENT=$(curl -s https://api.alternative.me/fng/)
SENTIMENT=$(echo $SENT | jq -r '.data[0].value_classification')
SENTIMENTVAL=$(echo $SENT | jq -r '.data[0].value')

FEE_1=$(bitcoin-cli estimatesmartfee 1 ECONOMICAL | jq '.feerate * 97656')
FEE_2=$(bitcoin-cli estimatesmartfee 6 ECONOMICAL | jq '.feerate * 97656')
FEE_3=$(bitcoin-cli estimatesmartfee 12 ECONOMICAL | jq '.feerate * 97656')

echo ''
echo '=============================================================================='
echo 'HEIGHT:       '$BLOCKCOUNT
echo 'HASH:         '$CURRHASH
echo 'DIFFICULTY:   '$DIFFICULTY
echo 'FEES:         '$FEES' BTC'
echo 'CONNECTIONS:  '$CONNCOUNT
echo 'MEMPOOL TX:   '$TX
echo 'MEMPOOL SIZE: '${SIZE}' MB'
echo 'FEERATE (01): '${FEE_1%.*}' sat/byte'
echo 'FEERATE (06): '${FEE_2%.*}' sat/byte'
echo 'FEERATE (12): '${FEE_3%.*}' sat/byte'
echo 'SENTIMENT:    '$SENTIMENTVAL'-'$SENTIMENT
echo '=============================================================================='
echo ''
