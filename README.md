### Create pre-baked images with Packer

Create pre-baked image with Docker and Docker Compose.

```sh
packer build -var 'project_id=example-project' -var 'source_image=ubuntu-1604-xenial-v20170815a' -var 'tags=gitlab' packer/gitlab.json
```

### Create vm on GCP with Terraform

Run from terraform directory
```sh
terraforn apply
```

### Install and configure Gitlab with ansible playbooks

```sh
ansible-playbook ansible/site.yml --check
```
