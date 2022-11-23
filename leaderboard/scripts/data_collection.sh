#!/bin/sh
export CARLA_ROOT=${1:-/home/transfuser/autonomous_car/transfuser/carla}
export WORK_DIR=${2:-/home/transfuser/autonomous_car/TCP-Eyup/TCP}
export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:${WORK_DIR}/leaderboard
export PYTHONPATH=$PYTHONPATH:${WORK_DIR}/leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:${WORK_DIR}/scenario_runner
export PYTHONPATH=$PYTHONPATH:${WORK_DIR}/
export PYTHONPATH=$PYTHONPATH:${WORK_DIR}/roach/log

export LEADERBOARD_ROOT=${WORK_DIR}/leaderboard
export CHALLENGE_TRACK_CODENAME=SENSORS
export PORT=2000
export TM_PORT=8000
export DEBUG_CHALLENGE=0
export REPETITIONS=1 # multiple evaluation runs
export RESUME=True
export DATA_COLLECTION=True
export OPENBLAS_CORETYPE=ARMV8

# Roach data collection
export ROUTES=${WORK_DIR}/leaderboard/data/TCP_training_routes/routes_town04_val.xml
export TEAM_AGENT=${WORK_DIR}/team_code/roach_ap_agent.py
export TEAM_CONFIG=${WORK_DIR}/roach/config/config_agent.yaml
export CHECKPOINT_ENDPOINT=${WORK_DIR}/results/data_collect_town04_results.json
export SCENARIOS=${WORK_DIR}/leaderboard/data/scenarios/town04_all_scenarios.json
export SAVE_PATH=${WORK_DIR}/data/data_collect_town04_results/



python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
--scenarios=${SCENARIOS}  \
--routes=${ROUTES} \
--repetitions=${REPETITIONS} \
--track=${CHALLENGE_TRACK_CODENAME} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--debug=${DEBUG_CHALLENGE} \
--record=${RECORD_PATH} \
--resume=${RESUME} \
--port=${PORT} \




