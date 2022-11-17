
export CARLA_ROOT=${1:-/home/transfuser/autonomous_car/transfuser/carla}
export WORK_DIR=${2:-/home/transfuser/TCP}
export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:$WORK_DIR/leaderboard
export PYTHONPATH=$PYTHONPATH:$WORK_DIR/leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:$WORK_DIR/scenario_runner
export PYTHONPATH=$PYTHONPATH:$WORK_DIR

export LEADERBOARD_ROOT=${WORK_DIR}/leaderboard
export CHALLENGE_TRACK_CODENAME=SENSORS
export PORT=2000
export TM_PORT=8000
export DEBUG_CHALLENGE=0
export REPETITIONS=3 # multiple evaluation runs
export RESUME=True


# TCP evaluation
export ROUTES=$WORK_DIR/leaderboard/data/evaluation_routes/routes_town05_long.xml
export TEAM_AGENT=$WORK_DIR/team_code/tcp_agent.py
export TEAM_CONFIG=${3:-/home/transfuser/TCP/model_ckpt/best_model.ckpt}
export CHECKPOINT_ENDPOINT=$WORK_DIR/results_TCP.json
export SCENARIOS=$WORK_DIR/leaderboard/data/scenarios/town05_all_scenarios.json
export SAVE_PATH=$WORK_DIR/data/results_TCP/


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
#--trafficManagerPort=${TM_PORT}


