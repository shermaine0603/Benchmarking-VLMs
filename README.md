# Benchmarking-VLMs

## Purpose
Purpose of this project is to benchmark various VLMs (Vision Language Models) to determine the best for use.
For this project, Ollama was used to run the models inside a Docker Container.

## Prerequisites
 - Ubuntu 22.04
 - Cuda 12.6
 - Docker is installed.
   - To install Docker, visit [here.](https://docs.docker.com/engine/install/ubuntu/)

## File Setup Instructions
- Have a folder of images, varying in locations.
  -  All images formatted in .jpg
  -  All images labelled as a number, starting from 1.
  -  example: 1.jpg, 2.jpg ... 100.jpg
    
- Prepare an excel sheet with the following columns:
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

<img width="1000" height="400" alt="Image" src="https://github.com/user-attachments/assets/4f7cc17d-305c-44e0-bfc6-2dfb0aec00f5" />



