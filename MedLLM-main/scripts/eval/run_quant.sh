#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
cd "${PROJECT_ROOT}"
python tools/model/model_quant.py --unquantized_model_path /path/to/unquantized/model --quantized_model_output_path /path/to/save/quantized/model