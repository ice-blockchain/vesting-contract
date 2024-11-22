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

inc=${CRYPTO_SRC_PATH}/fift/lib/:${CRYPTO_SRC_PATH}/smartcont/

# multisig addr
$fift -I ${inc} -s send-vesting-wallet.fif vesting-wallet EQC4il794WSFzmB0EEJjcDtiE9__l-yb4nJzu7Kt_0hA8qDI 268 1 10
