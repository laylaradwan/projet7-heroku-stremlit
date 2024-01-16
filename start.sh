#!/bin/bash

# Définir les ports
FASTAPI_PORT=5000
STREAMLIT_PORT=8501

# Lancer FastAPI
gunicorn -w 4 -k uvicorn.workers.UvicornWorker main:app -b 0.0.0.0:$FASTAPI_PORT &

# Attendre quelques secondes avant de lancer Streamlit
sleep 5

# Lancer Streamlit
streamlit run dashboard.py --server.port $STREAMLIT_PORT