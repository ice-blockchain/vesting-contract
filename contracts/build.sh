#!/bin/bash

if [[ -z "${EXEC_PATH}" ]]; then
  EXEC_PATH=/usr/bin/ion
fi

if [[ -z "${SRC_PATH}" ]]; then
  SRC_PATH=/usr/src/ion
fi

CRYPTO_EXEC_PATH=${EXEC_PATH}/crypto
CRYPTO_SRC_PATH=${SRC_PATH}/crypto

fift=${CRYPTO_EXEC_PATH}/fift
func=${CRYPTO_EXEC_PATH}/func

lite_client=${EXEC_PATH}/lite-client/lite-client
config=${EXEC_PATH}/global.config.json

inc=${CRYPTO_SRC_PATH}/fift/lib/:${CRYPTO_SRC_PATH}/smartcont/

# multisig addr
$func -o vesting-wallet.fif -SPA vesting_wallet.fc
$fift -I ${inc} -s new-vesting-wallet.fif 0 268 vesting-wallet 1732286307 10000 100 0 10 EQC4il794WSFzmB0EEJjcDtiE9__l-yb4nJzu7Kt_0hA8qDI EQAkqfKFKSWsoC90q7mmOdIDJ2ScPlmip-BCLJHTtgLfFEsu
