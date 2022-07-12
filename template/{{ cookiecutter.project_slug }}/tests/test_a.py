from {{ cookiecutter.project_slug }}.main import main

def test_check_main():
    assert main() == "ok"
