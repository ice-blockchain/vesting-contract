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

base_file=vesting-wallet # read private key from base_file.pk, save address in base_file.addr
start_time=1732520581 # unix time start time of the vesting
duration_time=10000 # duration of the vesting in seconds
unlock_period=100 # period to unlock a portion of the vesting amount in seconds
cliff_period=0 # delay first unlock period by specific time in seconds
vesting_amount=10 # vesting amount in Grams
sender_address=EQC4il794WSFzmB0EEJjcDtiE9__l-yb4nJzu7Kt_0hA8qDI # owner address can send portion of vesting amount to this address at any time
owner_address=EQAkqfKFKSWsoC90q7mmOdIDJ2ScPlmip-BCLJHTtgLfFEsu # the owner of the vesting wallet, the address of private key in base-file.pk

# multisig addr
$func -o vesting-wallet.fif -SPA vesting_wallet.fc
$fift -I ${inc} -s new-vesting-wallet.fif 0 268 ${base_file} ${start_time} ${duration_time} ${unlock_period} ${cliff_period} ${vesting_amount} ${sender_address} ${owner_address}
