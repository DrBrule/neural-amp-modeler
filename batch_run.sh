#!/bin/bash

# Specify the folder path from which to get files
current_path=$(pwd)
echo $current_path
folder_path="train"

cd $folder_path
file_list=$(ls)
echo $file_list

cd $current_path

for file in $file_list; do
    echo $current_path/train/$file
    nam-full \
        --data_config_path=$current_path/nam_full_configs/data/single_pair.json \
        --model_config_path=$current_path/nam_full_configs/models/wavenet_bigger.json \
        --learning_config_path=$current_path/nam_full_configs/learning/default.json \
        --outdir=$current_path/outputs/$file \
        --input_wav=$current_path/train/$file \
        --no-show

    echo "JOB DONE!!!"
    mv outputs/model.nam outputs/${file%.wav}.nam
done
