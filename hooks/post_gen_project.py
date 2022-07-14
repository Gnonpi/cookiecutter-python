import logging
import subprocess

logging.basicConfig(
    format="%(asctime)s [%(filename)s:%(lineno)d] %(levelname)s: %(message)s",
    level=logging.INFO
)

def main():
    # https://stackoverflow.com/questions/38556622/create-a-git-versioned-project-with-cookiecutter
    logging.info("Init git repo")
    subprocess.call(["git", "init"])
    subprocess.call(["git", "add", "."])

    logging.info("Project is generated:\n\n\tFeel free to do your first commit\n")

if __name__ == "__main__":
    main()
