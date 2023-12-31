#!/bin/bash

if [ "$1" = "train" ]; then
	CUDA_VISIBLE_DEVICES=0 python3 run.py train --train-src=./ko_en_data/train.ko --train-tgt=./ko_en_data/train.en --dev-src=./ko_en_data/dev.ko --dev-tgt=./ko_en_data/dev.en --vocab=vocab.json --cuda --lr=5e-4 --patience=1 --valid-niter=200 --batch-size=32 --dropout=.3
elif [ "$1" = "test" ]; then
        CUDA_VISIBLE_DEVICES=0 python3 run.py decode model.bin ./ko_en_data/test.ko ./ko_en_data/test.en outputs/test_outputs.txt --cuda
elif [ "$1" = "train_local" ]; then
	python3 run.py train --train-src=./ko_en_data/train.ko --train-tgt=./ko_en_data/train.en --dev-src=./ko_en_data/dev.ko --dev-tgt=./ko_en_data/dev.en --vocab=vocab.json --lr=5e-4
elif [ "$1" = "test_local" ]; then
    python3 run.py decode model.bin ./ko_en_data/test.ko ./ko_en_data/test.en outputs/test_outputs.txt
elif [ "$1" = "vocab" ]; then
	python3 vocab.py --train-src=./ko_en_data/train.ko --train-tgt=./ko_en_data/train.en vocab.json		
else
	echo "Invalid Option Selected"
fi
