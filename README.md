# Phi-3 Mini Docker Wrapper

## Table of Contents

1. [Introduction](#introduction)

1. [Model Details](#model-details)

1. [Usage](#usage)

1. [License](#license)

## Introduction

This project provides a Dockerized environment for the Phi3 Mini Large Language Model (LLM). The goal of this project is to demonstrate useful capabilities of this model when it comes to off-line and local LLM usage.

An example use case might be to take a text transcript from a meeting and turn this into a meeting summary.

```
query -f <text file> “Provide a summary in Markdown format”
```

Or perhaps we want to ask a specific question about the text.

```
query -f <text file> “What programming language is this file written in?”
```

## Model Details

The Phi3 model is the latest generation of the Phi series of models that was announced by Microsoft on their [Blog Post](https://news.microsoft.com/source/features/ai/the-phi-3-small-language-models-with-big-potential/). For this project have started by using the smallest model that can be run on a system without a dedicated graphics card.

```
cpu_and_mobile/cpu-int4-rtn-block-32-acc-level-4
```

This model has a context window that is limited to <XYZ> words/characters.

## Usage

The project is packaged and deployed on DockerHub allowing for easy usage from the command line. If you want to pre-fetch the Docker image, then use the following command:

```
docker pull gencore/<project name>
```

Then, to ask the model a question, simply invoke it as follows:

```
docker run --rm -ti gencore/<project name> “Your question here”
```

We have then taken this concept one stage further by providing a query script that will take a text file and a query prompt and provide these to the AI model.

## Testing

From initial testing, there is a clear link between the number of words provided to the AI model and the time it takes to process the model. A testing script is provided in this project to enable testing and benchmarking of the model on your own system.

## License

This project is open source and follows the same license that was used on the Microsoft project, the MIT License.