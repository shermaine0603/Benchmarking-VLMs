FROM ollama/ollama:latest

WORKDIR /app

# Copy your Python applications files
COPY excel_file.xlsx /app
COPY Inference.py /app
COPY train_4 /app/train_4/

# Install Python and dependencies
RUN apt-get update && apt-get install -y python3 python3-pip -y curl \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && curl -fsSL https://ollama.com/install.sh | sh

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-venv python3-sklearn

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install scikit-learn
RUN pip install --upgrade pip
RUN pip install scikit-learn

# RUN pip freeze > requirements.txt
# RUN pip install -r requirements.txt
RUN pip3 install ollama
RUN pip install Openpyxl
RUN pip install Pillow
RUN pip install pandas
RUN pip install numpy
RUN pip install pyyaml

# Make the startup script executable
COPY start_services.sh .
RUN chmod +x start_services.sh

# Expose the Ollama API port
EXPOSE 11434

#Override the ENTRYPOINT from the base image
ENTRYPOINT []

# Run the startup script
CMD ["./start_services.sh"]


