## Packer
### Create pre-baked images.

Create pre-baked image

```sh
packer build -var 'project_id=example-project' -var 'source_image=ubuntu-1604-xenial-v20170815a' -var 'tags=gitlab' gitlab.json
```
