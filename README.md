# Isaac Humanoid — Unitree H2

Unitree H2 model files and setup notes for working with Isaac Lab and Isaac Sim.

## Repository layout

- `IsaacLab/`: official Isaac Lab repository, pinned as a Git submodule.
- `unitree_ros/`: official Unitree robot models, pinned as a Git submodule.
- `h2_documents/`: H2 setup instructions, upstream documentation and license,
  and model validation results.
- `activate.sh`: activation helper for the original workstation's Conda environment.

The H2 URDF is at `unitree_ros/robots/h2_description/H2.urdf`. Keep the adjacent
`meshes/` directory with it.

## Get the project

Clone this repository with `git clone --recurse-submodules <repository-url>`.
If you already cloned without submodules, run:

```bash
git submodule update --init --recursive
```

The original workstation uses a sparse checkout of `unitree_ros` containing the
H2 model. A fresh submodule clone includes the upstream repository's other files
unless you configure sparse checkout separately.

## Environment

On the original workstation:

```bash
source /home/edward/code/isaac_humanoid/activate.sh
```

This selects `/home/edward/miniconda3/envs/env_isaaclab`. The environment itself
is not stored in Git. On another computer, follow the installation instructions
in the pinned Isaac Lab repository and adjust local paths in `activate.sh`.

See [the H2 setup guide](h2_documents/START_HERE.md) for tested versions, model
validation, import instructions, and the existing package compatibility issue.
The setup guide contains paths specific to the original workstation.

## Upstream changes

Submodules track specific commits. To retain your own changes within `IsaacLab/`
or `unitree_ros/`, commit and push them to a writable fork of that repository,
then update this project's submodule reference. A parent commit alone does not
publish uncommitted files within a submodule.

Upstream code and assets retain their respective licenses. The license in
`h2_documents/LICENSE` applies to the downloaded Unitree material.
