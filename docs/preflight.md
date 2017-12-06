# Pre-Flight Checklist

This document outlines a run-down of tasks when building an ansible role from this template skeleton.

## Repo Setup

- [ ] Update role description & dependencies in `meta/main.yml`
- [ ] Update `README.md`
- [ ] Update `LICENSE`
- [ ] Update `.travis.yml` tests
- [ ] Update `tests/README.md`
- [ ] Update `.gitignore`
- [ ] Update `.gitattributes`
- [ ] Add installation script to `install.sh`
- [ ] Run Docker tests `distro=gallium playbook=test.yml ./tests/test.sh`
- [ ] Run [Ansible Lint](https://github.com/willthames/ansible-lint)
- [ ] Initialize git repo `git init`
- [ ] Push repo to GitHub
- [ ] Create git tag `git tag -a v0.1.0 -m "Pre-release"`
- [ ] Create a [GitHub Release](https://help.github.com/articles/creating-releases/)
