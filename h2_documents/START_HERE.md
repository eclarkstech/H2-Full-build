# Unitree H2 model files

The complete official H2 description is in `../unitree_ros/robots/h2_description/`.
Keep its `meshes/` directory beside the URDF files so relative references resolve.

## Files

- `H2.urdf`: STL model; 37 links, 36 joints, including 31 movable joints.
- `H2_dae.urdf`: alternate model with DAE meshes; same link and joint counts.
- `H2_loop.urdf`: alternate linkage model; 55 links and 54 joints, including 37 movable joints.
- `H2_loop.xml`: accompanying MuJoCo model.
- `meshes/`: all 72 upstream STL and DAE mesh assets.

This folder contains the downloaded upstream `README.md` and `LICENSE`.
Unitree does not provide a separate H2 README in this revision's H2 description directory.
`validation.json` records the source revision, SHA-256 hashes, and dependency checks.

## Miniconda environment

The installed environment is named `env_isaaclab`:

```bash
source /home/edward/miniconda3/etc/profile.d/conda.sh
conda activate env_isaaclab
```

Verified interpreter: `/home/edward/miniconda3/envs/env_isaaclab/bin/python`.
Installed versions: Python 3.11.16, Isaac Lab 0.54.4, Isaac Sim 5.1.0.0.
Downloads and XML/dependency verification used this interpreter.

You can also activate the project's environment with:

```bash
source /home/edward/code/isaac_humanoid/activate.sh
```

All six Isaac Lab packages in this Conda environment are installed in editable
mode from this project's `IsaacLab/source/` directory. Project and parent-folder
VS Code settings select the same Conda interpreter. If VS Code has already
cached a different interpreter, run **Python: Select Interpreter** and select
`/home/edward/miniconda3/envs/env_isaaclab/bin/python`, then open a new terminal.

Source code, documentation, and H2 model assets remain in this project directory;
Python packages and executables are managed by the dedicated Conda environment.
The older project-local Python 3.10 environment at `../env_isaaclab/` is retained
but is no longer selected by project settings. Do not activate that environment.
The original Conda package list and editor settings are preserved in
`environment_before_migration/`.

Environment migration checks passed: the activation script selects the intended
Conda prefix, all six Isaac Lab packages resolve to this project's source, CUDA
is available, and a headless Isaac Sim application starts, updates, and closes
successfully. See `environment-smoke-test.log`.

An existing dependency conflict remains: `isaacsim-kernel==5.1.0.0` requires
`fastapi==0.115.7`, whose Starlette range conflicts with this Isaac Lab checkout's
`starlette==0.49.1` requirement. The original `fastapi==0.121.0` and
`starlette==0.49.1` versions are retained. `pip check` reports this conflict even
though the headless startup check passes; HTTP/livestream functionality has not
been verified. See `environment-pip-check.txt`.

## Optional import into Isaac Lab

The local Isaac Lab repository includes a URDF-to-USD converter. After activating
the environment above, an example conversion command is:

```bash
python /home/edward/code/isaac_humanoid/IsaacLab/scripts/tools/convert_urdf.py \
  /home/edward/code/isaac_humanoid/unitree_ros/robots/h2_description/H2.urdf \
  /home/edward/code/isaac_humanoid/assets/h2/H2.usd \
  --headless
```

This command has not been run as part of the download. Simulator import and
dynamic behavior have not been tested. Converter drive defaults are examples,
not validated H2 controller settings.

## Sources and validation

- Official model source: https://github.com/unitreerobotics/unitree_ros/tree/5994d4faef0a9cadd3287f8de0199a67eeb2a259/robots/h2_description
- Official repository documentation: https://github.com/unitreerobotics/unitree_ros/blob/5994d4faef0a9cadd3287f8de0199a67eeb2a259/README.md
- H2 product page: https://www.unitree.com/H2/
- Unitree developer documentation portal: https://support.unitree.com/home/en/developer/

All 76 model files match the official Git objects at the revision above, which
matched the remote HEAD when checked. All three URDFs and the MuJoCo XML parse;
all referenced mesh files exist. Each URDF has a connected tree rooted at
`pelvis`, with no missing links or duplicate joint children. DAE image references
were also checked. These are file integrity and structural checks, not physics
validation. Web-based hardware/developer manuals are linked above and are not
included as offline manuals.
