# Benchmarking-VLMs

## Purpose
Purpose of this project is to benchmark various VLMs (Vision Language Models) to determine the best for use.  
For this project, Ollama was used to run the models inside a Docker Container.  

## Models used
Models used in this project were [LLaVA 1.5 7B](https://ollama.com/library/llava:7b), [Qwen2.5VL 3B](https://ollama.com/library/qwen2.5vl:3b) and [Gemma3 4B](https://ollama.com/library/gemma3:4b).

## Prerequisites
 - Ubuntu 22.04
 - Cuda 12.6
 - Docker is installed.
   - To install Docker, visit [here.](https://docs.docker.com/engine/install/ubuntu/)

## Input Setup Instructions
- Have a folder of images, varying in locations.
  -  All images formatted in .jpg
  -  All images labelled as a number, starting from 1.
  -  example: 1.jpg, 2.jpg ... 100.jpg
    
- Prepare an excel sheet (in .xlsx format) with the following columns:
  - Image
    - Image number without ".jpg"
  - Class (Location)
    - Location in the respective image.
  - Query
    - A query for each image.
    - Must follow the format of "Is this a [Location]?"  
  - Answer
    - Answer to the Query.
    - Either a "yes" or a "no", **in lowercaps**
  - Generated Reply
    - Leave blank

**Example of excel sheet:**

<img width="1000" height="400" alt="Image" src="https://github.com/user-attachments/assets/4f7cc17d-305c-44e0-bfc6-2dfb0aec00f5" />

## Building Docker Image
In dockerfile, copy your excel file into /app.
Replace `excel_file.xlsx` with the name of your excel file.

```
COPY excel_file.xlsx /app
```

In dockerfile, copy your image dataset folder into /app.
Replace `images_folder` with the name of your image dataset folder.
```
COPY images_folder /app/images_folder/
```

Go to repo directory into terminal with
```
cd Benchmarking-VLMs
```

To build docker image, where `my-ollama` is the name of the image, run this line in the terminal:
```
docker build . -t my-ollama
```

## Run Docker Container
To run docker container, where `ollama-con` is the name of the container, run this line in the terminal:
```
docker run --runtime=nvidia -v ollama:/root/.ollama -p 11434:11434 --name ollama-con my-ollama
```

To enter the Docker Container, use:
```
docker exec -it ollama-con bash
```

## Check Ollama models
Use `ollama list` inside the container to see if the models have been pulled from Ollama:
```
ollama list
```
If this appears, it means the models were successfully pulled:
<img width="1198" height="178" alt="Screenshot 2025-08-05 165747" src="https://github.com/user-attachments/assets/d4dfe362-14d4-414b-9a40-17ea9011089b" />

If not, pull the models with:
```
ollama pull llava:7b
ollama pull qwen2.5vl:3b
ollama pull gemma3:4b
```

## Change file names in python script
In Inference.py in line 27, edit the line to your excel file:
```
excel_file = "excel_file.xlsx"
```

In line 28, edit the line to your image folder:
```
folder_name = "images_folder"
```

## Run the script
Run this line in terminal for the models to start analysing the images and answering their queries:
```
python3 Inference.py
```
