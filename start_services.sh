#!/bin/sh

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start
sleep 5

# Pull the required model(s)
ollama pull llava:7b
ollama pull qwen2.5vl:3b
ollama pull gemma3:4b

# Start your Python application
python Inference.py

tail -f /dev/null