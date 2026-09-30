# Source this file: source /home/edward/code/isaac_humanoid/activate.sh
if [[ -n "${VIRTUAL_ENV:-}" ]] && declare -F deactivate >/dev/null; then
    deactivate
fi
source /home/edward/miniconda3/etc/profile.d/conda.sh
conda activate /home/edward/miniconda3/envs/env_isaaclab
