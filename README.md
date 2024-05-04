# cloudrun-fastapi-container

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Yoshida24/cloudrun-fastapi-container)

This is a demo application that runs FastAPI Server on CloudRun with a container service.

**included:**
- Lint and Format
- Task runner
- Env support

## Usage

depends on:
- Python: 3.11
- pip: 24.0
- GNU Make: 3.81

support:
- OS: M1 Macbook Air Sonoma 14.4


## Gettig Started
First of all, install VSCode recommended extensions. This includes Linter, Formatter, and so on. Recommendation settings is written on `.vscode/extensions.json`.

Then, make virtual env and activate it:

```bash
python -m venv .venv
. .venv/bin/activate
```

Install dependencies:

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

To use environment variables in `.env` file, run below script to create `.env`

```bash
if [ ! -f .env ]; then
    cp .env.sample .env
    echo 'Info: .env file has successfully created. Please rewrite .env file'
else
    echo 'Info: Skip to create .env file. Because it is already exists.'
fi
```

Now you can run container locally:


```bash
# load environment variables from .env to your shell.
make build
make run
```

> **Note**
>
> This project *does not* depends on `dotenv-python`. Instead, using below script.
> `set -a && source ./.env && set +a`

## CloudRun

Deploy:

```bash
make deploy
```

> **Note**
> - If you have already deployed a resource with the same name, the resource will be updated.
> - The CloudRun URL will not change when the resource is updated!

Cleanup

```bash
make cleanup
```

> **Note**
> - `Do you want to continue (Y/n)?` Enter "y" when asked "Do you want to continue (Y/n)? The resource will be deleted.

## Jupyter

```bash
jupyter lab
```

## Develop App
On usual develop, first you activate `venv` first like below.

```bash
source .venv/bin/activate
```

Save requirements:

```bash
pip freeze > requirements.txt
```

Deactivate venv:

```bash
deactivate
```
