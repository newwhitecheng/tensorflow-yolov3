#! /bin/bash

#================================================================
#   Copyright (C) 2019 * Ltd. All rights reserved.
#   
#   Editor      : VIM 
#   File name   : make_voc_tfrecords.sh
#   Author      : YunYang1994
#   Edited by   : Dave Cheng
#   Created date: 2019-01-21 11:40:10
#   Description : 
#
#================================================================

python scripts/extract_voc.py --voc_path /home/hc218/data/VOC/train/ --dataset_info_path ./
# use 2007_train, 2007_val, 2012_train, 2012_val for training
cat ./2007_train.txt ./2007_val.txt ./2012_train.txt ./2012_val.txt > voc_train.txt
python scripts/extract_voc.py --voc_path /home/hc218/data/VOC/test --dataset_info_path ./
# use 2007_test for testing
cat ./2007_test.txt > voc_test.txt
python core/convert_tfrecord.py --dataset_txt ./voc_train.txt --tfrecord_path_prefix ./VOC_tfrecord/VOC_train
python core/convert_tfrecord.py --dataset_txt ./voc_test.txt  --tfrecord_path_prefix ./VOC_tfrecord/VOC_test
