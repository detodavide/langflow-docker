### Create Volume:

docker volume create example_vol_lf

### Build Image:

docker build -t langflow-dev .

### Create and run container:

docker run -v example_vol_lf:/app -p 7860:7860 langflow-dev
