#!/bin/bash

while [[ "0" == "0" ]]; do
    INPUT="0"
    while [[ "$INPUT" != "1" && "$INPUT" != "2" ]]; do
        echo 'You have the following options: (CTRL+C to quit)'
        echo '1)    start the api'
        echo '2)    start training process'
        echo ''
        printf "[1/2] : "
        read -n1 INPUT
        echo ''
    done
    clear
    if [[ "$INPUT" == "1" ]]; then
        python3 app.py --host=0.0.0.0 && echo ""
    else
        python3 build_model.py
        echo ""
    fi
done
