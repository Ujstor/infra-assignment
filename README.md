The repository contains two assignments assessing infrastructure and Kubernetes skills. They can be found together with solutions in the [documentation](https://ujstor.github.io/infra-assignment/).
## Terraform project tree

```bash
[4.0K]  ./
├── [4.0K]  modules/
│   ├── [4.0K]  external_ip_info/
│   │   ├── [ 11K]  LICENSE
│   │   ├── [ 295]  main.tf
│   │   ├── [ 127]  outputs.tf
│   │   ├── [ 751]  README.md
│   │   └── [ 149]  terraform.tf
│   └── [4.0K]  self_signed_certs/
│       ├── [ 11K]  LICENSE
│       ├── [1.5K]  main.tf
│       ├── [ 720]  outputs.tf
│       ├── [2.4K]  README.md
│       ├── [ 147]  terraform.tf
│       └── [ 565]  variables.tf
├── [ 790]  main.tf
├── [ 633]  outputs.tf

```

## Kubernetes project tree

```bash
[4.0K]  ./
├── [4.0K]  cassandra/
│   ├── [4.0K]  charts/
│   │   └── [4.0K]  common/
│   │       ├── [4.0K]  templates/
│   │       ├── [ 557]  Chart.yaml
│   │       ├── [ 23K]  README.md
│   │       └── [ 118]  values.yaml
│   ├── [4.0K]  ci/
│   │   └── [  35]  values-volume-permissions.yaml
│   ├── [4.0K]  templates/
│   │   ├── [2.0K]  cassandra-secret.yaml
│   │   ├── [ 117]  extra-list.yaml
│   │   ├── [1.1K]  headless-svc.yaml
│   │   ├── [6.1K]  _helpers.tpl
│   │   ├── [1.5K]  networkpolicy.yaml
│   │   ├── [4.5K]  NOTES.txt
│   │   ├── [ 875]  pdb.yaml
│   │   ├── [ 778]  serviceaccount.yaml
│   │   ├── [1.3K]  servicemonitor.yaml
│   │   ├── [1.8K]  service.yaml
│   │   ├── [ 25K]  statefulset.yaml
│   │   └── [1.4K]  tls-secret.yaml
│   ├── [ 228]  Chart.lock
│   ├── [ 970]  Chart.yaml
│   ├── [ 37K]  README.md
│   └── [ 26K]  values.yaml
├── [ 314]  cassandra-values.yaml
└── [ 490]  kubens.sh*
```
