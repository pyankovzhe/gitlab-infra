### Create pre-baked images with Packer

Create pre-baked image with Docker and Docker Compose.

```sh
packer build -var 'project_id=example-project' -var 'source_image=ubuntu-1604-xenial-v20170815a' -var 'tags=docker' ubuntu-docker.json
```

### Create vm on GCP with Terraform

```sh
terraforn apply
```

### Install and configure Gitlab

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
