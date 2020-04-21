#!/bin/sh
EXE_PATH="/mnt/A/qiyh/2020/MVS/colmap-3.5/build/src/exe/colmap"

#SCENE_NAME="scan4"
DATASET_PATH="/mnt/A/qiyh/2020/April/dtu_dataset/dtu-test-1200/Rectified"

for SCENE_IDX in 9 10 11 12 13 15 23 24 29 32 33 34 48 49 62 75 77 110 114 118
do
echo "Processing scan${SCENE_IDX}"
#########################################
#########################################
$EXE_PATH feature_extractor \
    --database_path $DATASET_PATH/colmap/database_scan${SCENE_IDX}.db \
    --image_path $DATASET_PATH/scan${SCENE_IDX}

#########################################
#########################################

$EXE_PATH exhaustive_matcher \
    --database_path $DATASET_PATH/colmap/database_scan${SCENE_IDX}.db

#########################################
#########################################

mkdir $DATASET_PATH/colmap/sparse_scan${SCENE_IDX}

$EXE_PATH mapper \
    --database_path $DATASET_PATH/colmap/database_scan${SCENE_IDX}.db \
    --image_path $DATASET_PATH/scan${SCENE_IDX} \
    --output_path $DATASET_PATH/colmap/sparse_scan${SCENE_IDX}

done
