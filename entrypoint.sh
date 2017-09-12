#!/bin/bash

set -e

function print_help {
    echo "Available options:"
    echo " start                                            - Start Word2Vec server"
    echo " run                                              - Run an arbitrary command inside the container"
}


case ${1} in
    start)
        exec python word2vec-api.py --model ./models/GoogleNews-vectors-negative300.bin --binary BINARY --path ./word2vec
        ;;       
    run)
        exec "${@:2}"
        ;;
    *)
        print_help
        ;;
esac


