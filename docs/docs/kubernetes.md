# Kubernetes test Assignment

The principle of this test is to verify your capabilities to start and manage a typical kubernetes service. 

In this assessment you will have to start a Distributed Database ([Cassandra](https://cassandra.apache.org/)) and configure it by looking what is required for a production usage. The last part of this assessment will test you technical understanding of running a production stateful service.

All those tests will be done with a [Kubernetes](https://kubernetes.io/) cluster. Therefore you will start a Kubernetes Cluster using [k3d](https://k3d.io) and run a cassandra kubernetes test.


**All the tests should result in command and outputs saved to a file. (PRO TIP: you can also use a jupyter notebook to run the commands)**

## Start a Kubernetes Cluster
### Prerequisites
***You can look at [homebrew](https://brew.sh) for the installation of some of following tools***

- You need to have [Docker](https://www.docker.com/) installed on your machine
- You need to have [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed on your machine: `brew install kubernetes-cli`
- You need to have [k3d](https://k3d.io) installed on your machine: `brew install k3d`
- You need to have [Helm](https://helm.sh) installed on your machine: `brew install helm`



**CAUTION: Make sure to configure docker to use at least 6Gb of memory.**

### Start a Kubernetes Cluster
```bash
$ k3d cluster create test-assignment \
		--servers 3 --agents 3 \
		--k3s-server-arg '--node-label=type=control' \
		--k3s-agent-arg '--node-label=type=worker'

INFO[0000] Prep: Network
INFO[0000] Re-using existing network 'k3d-test-assignment' (e3f26a3846de7e8058ea33545273d16fee8f0e96fd20fea494725b382ca792fa)
INFO[0000] Created volume 'k3d-test-assignment-images'
INFO[0000] Creating initializing server node
INFO[0000] Creating node 'k3d-test-assignment-server-0'
INFO[0001] Creating node 'k3d-test-assignment-server-1'
INFO[0002] Creating node 'k3d-test-assignment-server-2'
INFO[0002] Creating node 'k3d-test-assignment-agent-0'
INFO[0002] Creating node 'k3d-test-assignment-agent-1'
INFO[0002] Creating node 'k3d-test-assignment-agent-2'
INFO[0002] Creating LoadBalancer 'k3d-test-assignment-serverlb'
INFO[0002] Starting cluster 'test-assignment'
INFO[0002] Starting the initializing server...
INFO[0002] Starting Node 'k3d-test-assignment-server-0'
INFO[0003] Starting servers...
INFO[0004] Starting Node 'k3d-test-assignment-server-1'
INFO[0024] Starting Node 'k3d-test-assignment-server-2'
INFO[0041] Starting agents...
INFO[0041] Starting Node 'k3d-test-assignment-agent-0'
INFO[0048] Starting Node 'k3d-test-assignment-agent-1'
INFO[0056] Starting Node 'k3d-test-assignment-agent-2'
INFO[0063] Starting helpers...
INFO[0063] Starting Node 'k3d-test-assignment-serverlb'
INFO[0064] (Optional) Trying to get IP of the docker host and inject it into the cluster as 'host.k3d.internal' for easy access
INFO[0066] Successfully added host record to /etc/hosts in 7/7 nodes and to the CoreDNS ConfigMap
INFO[0066] Cluster 'test-assignment' created successfully!
INFO[0066] --kubeconfig-update-default=false --> sets --kubeconfig-switch-context=false
INFO[0066] You can now use it like this:
kubectl config use-context k3d-test-assignment
kubectl cluster-info
```

### Verify the Cluster
```bash
$ kubectl cluster-info
Kubernetes control plane is running at https://0.0.0.0:53722
CoreDNS is running at https://0.0.0.0:53722/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://0.0.0.0:53722/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

```bash
$ kubectl get all -A
NAMESPACE     NAME                                          READY   STATUS      RESTARTS   AGE
kube-system   pod/coredns-7448499f4d-mlrx8                  1/1     Running     0          83s
kube-system   pod/helm-install-traefik-crd-22mxw            0/1     Completed   0          83s
kube-system   pod/helm-install-traefik-g8cns                0/1     Completed   0          83s
kube-system   pod/local-path-provisioner-5ff76fc89d-p95k5   1/1     Running     0          83s
kube-system   pod/metrics-server-86cbb8457f-mx5dn           1/1     Running     0          83s
kube-system   pod/svclb-traefik-9gj8r                       2/2     Running     0          36s
kube-system   pod/svclb-traefik-jz8r7                       2/2     Running     0          28s
kube-system   pod/svclb-traefik-qdpl6                       2/2     Running     0          47s
kube-system   pod/svclb-traefik-snnrj                       2/2     Running     0          47s
kube-system   pod/svclb-traefik-tczx5                       2/2     Running     0          47s
kube-system   pod/svclb-traefik-wn2d6                       2/2     Running     0          47s
kube-system   pod/svclb-traefik-x56qk                       2/2     Running     0          20s
kube-system   pod/svclb-traefik-x6cb9                       2/2     Running     0          45s
kube-system   pod/traefik-97b44b794-km7nf                   1/1     Running     0          47s

NAMESPACE     NAME                     TYPE           CLUSTER-IP     EXTERNAL-IP                                                                               PORT(S)                      AGE
default       service/kubernetes       ClusterIP      10.43.0.1      <none>                                                                                    443/TCP                      100s
kube-system   service/kube-dns         ClusterIP      10.43.0.10     <none>                                                                                    53/UDP,53/TCP,9153/TCP       96s
kube-system   service/metrics-server   ClusterIP      10.43.108.12   <none>                                                                                    443/TCP                      94s
kube-system   service/traefik          LoadBalancer   10.43.89.168   172.25.0.2,172.25.0.3,172.25.0.4,172.25.0.5,172.25.0.6,172.25.0.7,172.25.0.8,172.25.0.9   80:32625/TCP,443:31157/TCP   47s

NAMESPACE     NAME                           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
kube-system   daemonset.apps/svclb-traefik   8         8         8       8            8           <none>          47s
show more (open the raw output data in a text editor) ...

kube-system   replicaset.apps/traefik-97b44b794                   1         1         1       47s

NAMESPACE     NAME                                 COMPLETIONS   DURATION   AGE
kube-system   job.batch/helm-install-traefik       1/1           37s        93s
kube-system   job.batch/helm-install-traefik-crd   1/1           36s        93s
```

## Test 1: Start a cassandra cluster using helm
Cassandra is a distributed NoSQL database. It is a highly scalable, highly available, eventually consistent database.

Your goal is to create a Cassandra cluster using [Helm](https://helm.sh).

To align with the different existing charts, you will have to start the `Bitnami/cassandra` chart. Running on the version `8.0.2` of the chart.

**This Cassandra cluster will be composed:**
- dedicated namespace called `cassandra`
- 3 seed nodes
- 3 nodes in total
- Maximum unavailable pods of 2 (when rolling update for e.g.)
- 0.1 CPU cores guaranteed and 64MB RAM guaranteed and 1 CPU Cores and 2GB RAM Maximum, Caution the JVM need to be configuerd based on Maximum resources
- Prevent 2 pods from being in the same kubernetes node
- Prevent cassandra nodes to run on server nodes


In order to facilitate the deployment of the cluster with k3s we will **Intentionally** disable the storage on local disk.

***All the configuration variables must appear in the commends you are running even if they are set as default.***

**Verify the health of the cluster**
TIP: There is a dedicated tool that can control the Health of the cluster in one command.

## Test 2: Run some CSQL statements
- Create a *`keyspace`* called `store` with replication factor 3.
- Create a *`table`* called `shopping_cart` with the following columns: `userid text PRIMARY KEY, item_count int, last_update_timestamp timestamp`.
- Insert test data into the `shopping_cart` table.
- Show the data you have inserted.

## Test 3: Administration of Kubernetes nodes + Cassandra availability test
The role of this test is to make sure that the cassandra cluster is highly available and the data is not lost when there is a node failure.

**FIRST STEP**: in order to not lose the password you need to run these commands: 
- run via CQLSH: `ALTER KEYSPACE system_auth WITH REPLICATION= {'class' : 'SimpleStrategy','replication_factor' : 3 };`
- And run the following command: `nodetool repair --full system_auth`

**Kubernetes node administration:**
- Disable scheduling of pods on the node `k3d-test-assignment-agent-1` (TIP: look the correct kubectl command)
- Safely evict all the pods from the node `k3d-test-assignment-agent-1` (TIP: look the correct kubectl command)
- Delete the k3s agent node named `k3d-test-assignment-agent-1` (TIP: look the correct kubectl command and the `k3d` command)
- Check that there is a cassandra pod (which was running on `k3d-test-assignment-agent-1`) that is in pending state and can not be scheduled, **Explain why**.

**Cassandra High availability:**
- Check if we have lost the data we inserted in the previous step *TIP: you can run SELECT query*
- Get the health of the cassandra cluster with `nodetool`
- Start a new k3s agent node called `k3d-test-assignment-agent-4` and wait until the cassandra pod is scheduled.
- OPTIONAL: Check the cassandra cluster `nodetool status` and show that the new node that we just started contains a part of the data.
- OPTIONAL: Remove the cassandra node that is Down (via `nodetool`) and check the percentage of Data owned by each node (TIP use `nodetool`).
