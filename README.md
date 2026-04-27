
## 1. 目录结构

```text
MedicalGPT-main/
├─ scripts/
│  ├─ train/
│  │  ├─ run_dpo.sh
│  │  ├─ dpo/
│  │  │  ├─ run_dpo_strong.sh
│  │  │  └─ run_dpo_base.sh          # 基线 DPO
│  │  ├─ run_pt.sh
│  │  ├─ run_sft.sh
│  │  ├─ run_sft_accelerate.sh
│  │  ├─ run_full_sft.sh
│  │  ├─ run_rm.sh
│  │  └─ legacy/
│  │     ├─ run_orpo.sh
│  │     ├─ run_ppo.sh
│  │     └─ run_grpo.sh
│  ├─ eval/
│  │  ├─ run_quant.sh
│  │  └─ run_eval_quantize.sh
│  └─ deploy/
│     └─ vllm_deployment.sh
├─ tools/
│  ├─ data/
│  │  ├─ build_domain_tokenizer.py
│  │  └─ convert_dataset.py
│  ├─ model/
│  │  ├─ merge_tokenizers.py
│  │  ├─ merge_peft_adapter.py
│  │  └─ model_quant.py
│  └─ eval/
│     ├─ eval_quantize.py
│     └─ validate_jsonl.py
├─ configs/
│  └─ deepspeed/
├─ notebooks/
└─ *.py（核心训练/服务主程序）
```


### 2.1 默认策略

- 默认入口：`scripts/train/run_dpo.sh`
- 默认行为：直接转发到 `scripts/train/dpo/run_dpo_strong.sh`

## 3. 快速开始

### 3.1 安装依赖

```bash
pip install -r requirements.txt
```

### 3.2 训练（默认 DPO 强化版）

```bash
make train
# 或
bash scripts/train/run_dpo.sh
```

### 3.3 评估与部署

```bash
bash scripts/eval/run_quant.sh
bash scripts/eval/run_eval_quantize.sh
bash scripts/deploy/vllm_deployment.sh
```

## 4. Makefile 命令

- `make train`


## 5. 免责声明

本项目用于医疗 NLP 技术研究与工程实践，不可替代专业医生诊疗意见。
