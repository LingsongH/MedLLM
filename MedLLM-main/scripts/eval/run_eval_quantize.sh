#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
cd "${PROJECT_ROOT}"
python tools/eval/eval_quantize.py --bnb_path /path/to/your/bnb_model --data_path data/finetune/medical_sft_1K_format.jsonl
