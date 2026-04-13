#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
cd "${PROJECT_ROOT}"

# DPO强化版：更长训练步数、更稳定学习率/暖启动、更高评估频率
CUDA_VISIBLE_DEVICES=0,1 python pipelines/train/dpo_training.py \
    --model_name_or_path Qwen/Qwen2.5-0.5B-Instruct \
    --template_name qwen \
    --train_file_dir ./data/reward \
    --validation_file_dir ./data/reward \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 16 \
    --per_device_eval_batch_size 1 \
    --do_train \
    --do_eval \
    --use_peft True \
    --max_train_samples 5000 \
    --max_eval_samples 200 \
    --max_steps 600 \
    --learning_rate 1e-5 \
    --lr_scheduler_type cosine \
    --warmup_steps 60 \
    --weight_decay 0.01 \
    --eval_steps 50 \
    --save_steps 100 \
    --logging_steps 10 \
    --max_source_length 2048 \
    --max_target_length 512 \
    --output_dir outputs-dpo-qwen-strong \
    --target_modules all \
    --lora_rank 16 \
    --lora_alpha 32 \
    --lora_dropout 0.05 \
    --torch_dtype bfloat16 \
    --bf16 True \
    --fp16 False \
    --report_to tensorboard \
    --remove_unused_columns False \
    --gradient_checkpointing True \
    --cache_dir ./cache