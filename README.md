## Setup Gitlab CI on Google Cloud Platform

### Create pre-baked image with Packer
Create Google Cloud Engine image with pre-installed Docker and Docker Compose.
```sh
packer build -var 'project_id=example-project' -var 'source_image=ubuntu-1604-xenial-v20170815a' -var 'tags=docker' ubuntu-docker.json
```

### Create vm on GCP with Terraform
```sh
terraforn apply
```

### Install and configure Gitlab with Ansible
```sh
ansible-playbook gitlab.yml
```

### Setup Gitlab Runner
Run GitLab Runner in container
```sh
ansible-playbook gitlab-runner.yml --tags "setup"
```
Register GitLab Runner
```sh
ansible-playbook gitlab-runner.yml --tags "registration" --extra-vars "runner_token=TOKEN"
```

---

## TODO:
* Organize Terraform code with modules
* Create another vm for Gitlab Runner
* Ansible playbooks to manage running gitlab(restart, backup, etc)
