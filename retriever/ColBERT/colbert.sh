#!/bin/bash
prediction_dir=./prediction
model_dir=./model/colbertv2.0
corpus=kilt_wikipedia
dataset=nq
index_dir=./index
SCRIPT_PATH="$(realpath "$0")"
RAGGED_PATH="${SCRIPT_PATH%/retriever/ColBERT/colbert.sh}"
data_dir="${SCRIPT_PATH%/data}"
corpus_dir="${SCRIPT_PATH%/corpus}"
export PYTHONPATH="$PYTHONPATH:$RAGGED_PATH:$COLBERT_PATH"


set +x
set +e
# export COLBERT_LOAD_TORCH_EXTENSION_VERBOSE=True
export FORCE_CUDA="1"
rm -rf .cache/torch_extensions/

python "$RAGGED_PATH/retriever/ColBERT/get_colbert_predictions.py" --prediction_dir $prediction_dir \
                                                                    --model_dir $model_dir \
                                                                    --corpus_dir $corpus_dir \
                                                                    --corpus $corpus \
                                                                    --data_dir $data_dir\
                                                                    --dataset $dataset\
                                                                    --index_dir $index_dir
