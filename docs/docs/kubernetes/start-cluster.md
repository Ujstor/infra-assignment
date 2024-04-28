```bash
k3d cluster create test-assignment \
  --servers 3 \
  --agents 3 \
  --k3s-node-label "type=control@server:0" \
  --k3s-node-label "type=worker@agent:0,1,2"

INFO[0000] Prep: Network
INFO[0000] Created network 'k3d-test-assignment'
INFO[0000] Created image volume k3d-test-assignment-images
INFO[0000] Starting new tools node...
INFO[0000] Creating initializing server node
INFO[0000] Creating node 'k3d-test-assignment-server-0'
INFO[0001] Pulling image 'ghcr.io/k3d-io/k3d-tools:5.6.3'
INFO[0001] Pulling image 'docker.io/rancher/k3s:v1.28.8-k3s1'
INFO[0002] Starting node 'k3d-test-assignment-tools'
INFO[0014] Creating node 'k3d-test-assignment-server-1'
INFO[0015] Creating node 'k3d-test-assignment-server-2'
INFO[0015] Creating node 'k3d-test-assignment-agent-0'
INFO[0015] Creating node 'k3d-test-assignment-agent-1'
INFO[0015] Creating node 'k3d-test-assignment-agent-2'
INFO[0015] Creating LoadBalancer 'k3d-test-assignment-serverlb'
INFO[0016] Pulling image 'ghcr.io/k3d-io/k3d-proxy:5.6.3'
INFO[0022] Using the k3d-tools node to gather environment information
INFO[0022] HostIP: using network gateway 172.24.0.1 address
INFO[0022] Starting cluster 'test-assignment'
INFO[0022] Starting the initializing server...
INFO[0022] Starting node 'k3d-test-assignment-server-0'
INFO[0025] Starting servers...
INFO[0025] Starting node 'k3d-test-assignment-server-1'
INFO[0045] Starting node 'k3d-test-assignment-server-2'
INFO[0060] Starting agents...
INFO[0060] Starting node 'k3d-test-assignment-agent-2'
INFO[0060] Starting node 'k3d-test-assignment-agent-0'
INFO[0060] Starting node 'k3d-test-assignment-agent-1'
INFO[0064] Starting helpers...
INFO[0064] Starting node 'k3d-test-assignment-serverlb'
INFO[0070] Injecting records for hostAliases (incl. host.k3d.internal) and for 7 network members into CoreDNS configmap...
INFO[0072] Cluster 'test-assignment' created successfully!
INFO[0072] You can now use it like this:
kubectl cluster-info
```

```bash
kubectl cluster-info

Kubernetes control plane is running at https://0.0.0.0:46557
CoreDNS is running at https://0.0.0.0:46557/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://0.0.0.0:46557/api/v1/namespaces/kube-system/services/https:metrics-server:https/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

```bash
kubectl get all -A

NAMESPACE     NAME                                          READY   STATUS      RESTARTS   AGE
kube-system   pod/coredns-6799fbcd5-9g8vm                   1/1     Running     0          2m46s
kube-system   pod/helm-install-traefik-crd-9mpsr            0/1     Completed   0          2m47s
kube-system   pod/helm-install-traefik-g58zb                0/1     Completed   1          2m47s
kube-system   pod/local-path-provisioner-6c86858495-bj9r7   1/1     Running     0          2m46s
kube-system   pod/metrics-server-54fd9b65b-sv4pv            1/1     Running     0          2m46s
kube-system   pod/svclb-traefik-d1e5a933-4rtwp              2/2     Running     0          2m17s
kube-system   pod/svclb-traefik-d1e5a933-88ns7              2/2     Running     0          2m17s
kube-system   pod/svclb-traefik-d1e5a933-bn694              2/2     Running     0          2m17s
kube-system   pod/svclb-traefik-d1e5a933-d9ksg              2/2     Running     0          2m17s
kube-system   pod/svclb-traefik-d1e5a933-mjqg9              2/2     Running     0          2m17s
kube-system   pod/svclb-traefik-d1e5a933-zbf7c              2/2     Running     0          2m17s
kube-system   pod/traefik-f4564c4f4-8cqnc                   1/1     Running     0          2m17s

NAMESPACE     NAME                     TYPE           CLUSTER-IP      EXTERNAL-IP                                                         PORT(S)                      AGE
default       service/kubernetes       ClusterIP      10.43.0.1       <none>                                                              443/TCP                      3m
kube-system   service/kube-dns         ClusterIP      10.43.0.10      <none>                                                              53/UDP,53/TCP,9153/TCP       2m57s
kube-system   service/metrics-server   ClusterIP      10.43.253.2     <none>                                                              443/TCP                      2m56s
kube-system   service/traefik          LoadBalancer   10.43.217.151   172.24.0.2,172.24.0.3,172.24.0.4,172.24.0.5,172.24.0.6,172.24.0.7   80:32061/TCP,443:30783/TCP   2m17s

NAMESPACE     NAME                                    DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
kube-system   daemonset.apps/svclb-traefik-d1e5a933   6         6         6       6            6           <none>          2m17s

NAMESPACE     NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
kube-system   deployment.apps/coredns                  1/1     1            1           2m57s
kube-system   deployment.apps/local-path-provisioner   1/1     1            1           2m57s
kube-system   deployment.apps/metrics-server           1/1     1            1           2m56s
kube-system   deployment.apps/traefik                  1/1     1            1           2m17s

NAMESPACE     NAME                                                DESIRED   CURRENT   READY   AGE
kube-system   replicaset.apps/coredns-6799fbcd5                   1         1         1       2m46s
kube-system   replicaset.apps/local-path-provisioner-6c86858495   1         1         1       2m46s
kube-system   replicaset.apps/metrics-server-54fd9b65b            1         1         1       2m46s
kube-system   replicaset.apps/traefik-f4564c4f4                   1         1         1       2m17s

NAMESPACE     NAME                                 COMPLETIONS   DURATION   AGE
kube-system   job.batch/helm-install-traefik       1/1           34s        2m54s
kube-system   job.batch/helm-install-traefik-crd   1/1           31s        2m54s
```

```bash
docker ps

CONTAINER ID   IMAGE                            COMMAND                  CREATED         STATUS         PORTS                             NAMES
6c97efafe87d   ghcr.io/k3d-io/k3d-proxy:5.6.3   "/bin/sh -c nginx-pr…"   6 minutes ago   Up 5 minutes   80/tcp, 0.0.0.0:46557->6443/tcp   k3d-test-assignment-serverlb
14b8d37e956d   rancher/k3s:v1.28.8-k3s1         "/bin/k3d-entrypoint…"   6 minutes ago   Up 5 minutes                                     k3d-test-assignment-agent-2
9d898c72b183   rancher/k3s:v1.28.8-k3s1         "/bin/k3d-entrypoint…"   6 minutes ago   Up 5 minutes                                     k3d-test-assignment-agent-1
17a6fb8f2efb   rancher/k3s:v1.28.8-k3s1         "/bin/k3d-entrypoint…"   6 minutes ago   Up 5 minutes                                     k3d-test-assignment-agent-0
fafe735c5686   rancher/k3s:v1.28.8-k3s1         "/bin/k3d-entrypoint…"   6 minutes ago   Up 5 minutes                                     k3d-test-assignment-server-2
e6dbdca9118f   rancher/k3s:v1.28.8-k3s1         "/bin/k3d-entrypoint…"   6 minutes ago   Up 6 minutes                                     k3d-test-assignment-server-1
a2a8200404d9   rancher/k3s:v1.28.8-k3s1         "/bin/k3d-entrypoint…"   6 minutes ago   Up 6 minutes                                     k3d-test-assignment-server-0
```

```bash
kubectl get nodes --show-labels

NAME                           STATUS   ROLES                       AGE   VERSION        LABELS
k3d-test-assignment-agent-0    Ready    <none>                      17m   v1.28.8+k3s1   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=k3s,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k3d-test-assignment-agent-0,kubernetes.io/os=linux,node.kubernetes.io/instance-type=k3s,type=worker
k3d-test-assignment-agent-1    Ready    <none>                      17m   v1.28.8+k3s1   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=k3s,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k3d-test-assignment-agent-1,kubernetes.io/os=linux,node.kubernetes.io/instance-type=k3s,type=worker
k3d-test-assignment-agent-2    Ready    <none>                      17m   v1.28.8+k3s1   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=k3s,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k3d-test-assignment-agent-2,kubernetes.io/os=linux,node.kubernetes.io/instance-type=k3s,type=worker
k3d-test-assignment-server-0   Ready    control-plane,etcd,master   17m   v1.28.8+k3s1   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=k3s,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k3d-test-assignment-server-0,kubernetes.io/os=linux,node-role.kubernetes.io/control-plane=true,node-role.kubernetes.io/etcd=true,node-role.kubernetes.io/master=true,node.kubernetes.io/instance-type=k3s,type=control
k3d-test-assignment-server-1   Ready    control-plane,etcd,master   17m   v1.28.8+k3s1   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=k3s,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k3d-test-assignment-server-1,kubernetes.io/os=linux,node-role.kubernetes.io/control-plane=true,node-role.kubernetes.io/etcd=true,node-role.kubernetes.io/master=true,node.kubernetes.io/instance-type=k3s
k3d-test-assignment-server-2   Ready    control-plane,etcd,master   17m   v1.28.8+k3s1   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=k3s,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k3d-test-assignment-server-2,kubernetes.io/os=linux,node-role.kubernetes.io/control-plane=true,node-role.kubernetes.io/etcd=true,node-role.kubernetes.io/master=true,node.kubernetes.io/instance-type=k3s
```
