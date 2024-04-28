
```bash
 helm repo add bitnami-azure https://marketplace.azurecr.io/helm/v1/repo

"bitnami-azure" has been added to your repositories
```

```bash
 helm repo update

Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "ingress-nginx" chart repository
...Successfully got an update from the "jetstack" chart repository
...Successfully got an update from the "bitnami-azure" chart repository
Update Complete. ⎈Happy Helming!⎈
```

```bash
 helm search repo bitnami-azure/cassandra --versions

NAME                    CHART VERSION   APP VERSION     DESCRIPTION
bitnami-azure/cassandra 9.7.3           4.0.7           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.7.2           4.0.6           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.7.1           4.0.6           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.6.1           4.0.6           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.5.0           4.0.6           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.3.2           4.0.5           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.12          4.0.5           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.11          4.0.5           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.10          4.0.5           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.9           4.0.5           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.8           4.0.5           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.7           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.6           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.5           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.4           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.3           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.2           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.2.0           4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.23          4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.22          4.0.4           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.19          4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.18          4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.14          4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.13          4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.11          4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.10          4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.9           4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.8           4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.7           4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.6           4.0.3           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.5           4.0.1           Apache Cassandra is an open source distributed ...
bitnami-azure/cassandra 9.1.4           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.1.3           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.1.1           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.1.0           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.12          4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.11          4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.10          4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.9           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.8           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.6           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.5           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 9.0.4           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 8.0.5           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 8.0.4           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 8.0.3           4.0.0           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 8.0.2           4.0.0           Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 7.7.3           3.11.11         Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 7.7.2           3.11.11         Apache Cassandra is a free and open-source dist...
bitnami-azure/cassandra 7.7.1           3.11.10         Apache Cassandra is a free and open-source dist...
```

```bash
# I download chart with out installing it for testing
helm fetch bitnami-azure/cassandra --version "8.0.2"
```
```bash
 kubectl create namespace cassandra
namespace/cassandra created
```

```bash
helm install cassandra bitnami-azure/cassandra --version "8.0.2" -n cassandra -f cassandra-values.yaml

NAME: cassandra
LAST DEPLOYED: Sat Apr 27 23:49:29 2024
NAMESPACE: cassandra
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

Cassandra can be accessed through the following URLs from within the cluster:

  - CQL: cassandra.cassandra.svc.cluster.local:9042

To get your password run:

   export CASSANDRA_PASSWORD=$(kubectl get secret --namespace "cassandra" cassandra -o jsonpath="{.data.cassandra-password}" | base64 --decode)

Check the cluster status by running:

   kubectl exec -it --namespace cassandra $(kubectl get pods --namespace cassandra -l app=cassandra,release=cassandra -o jsonpath='{.items[0].metadata.name}') nodetool status

To connect to your Cassandra cluster using CQL:

1. Run a Cassandra pod that you can use as a client:

   kubectl run --namespace cassandra cassandra-client --rm --tty -i --restart='Never' \
   --env CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
    \
   --image marketplace.azurecr.io/bitnami/cassandra:4.0.0-debian-10-r3 -- bash

2. Connect using the cqlsh client:

   cqlsh -u cassandra -p $CASSANDRA_PASSWORD cassandra

To connect to your database from outside the cluster execute the following commands:

   kubectl port-forward --namespace cassandra svc/cassandra 9042:9042 &
   cqlsh -u cassandra -p $CASSANDRA_PASSWORD 127.0.0.1 9042
```

```bash
#Custom values can be past directly

helm install cassandra bitnami-azure/cassandra \
  --version "8.0.2" \
  -n cassandra \
  --set replicaCount=3 \
  --set cluster.seedCount=3 \
  --set pdb.maxUnavailable=2 \
  --set pdb.minAvailable=1 \
  --set jvm.extraOpts="-Xms256m -Xmx2G" \
  --set resources.requests.cpu="100m" \
  --set resources.requests.memory="64Mi" \
  --set resources.limits.cpu="1" \
  --set resources.limits.memory="2Gi" \
  --set podAntiAffinityPreset="hard" \
  --set nodeSelector.type="worker" \
  --set persistence.enabled=false
```

```bash
kubectl ns cassandra

Context "k3d-test-assignment" modified.
Active namespace is "cassandra".
```

```bash
 kubectl get all

NAME              READY   STATUS    RESTARTS   AGE
pod/cassandra-0   1/1     Running   0          4m28s
pod/cassandra-1   1/1     Running   0          3m18s
pod/cassandra-2   1/1     Running   0          2m14s

NAME                         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                               AGE
service/cassandra            ClusterIP   10.43.198.37   <none>        9042/TCP,8080/TCP                     4m28s
service/cassandra-headless   ClusterIP   None           <none>        7000/TCP,7001/TCP,7199/TCP,9042/TCP   4m28s

NAME                         READY   AGE
statefulset.apps/cassandra   3/3     4m28s
```

```bash
 kubectl exec pod/cassandra-0 -- nodetool status

Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address    Load       Tokens  Owns (effective)  Host ID                               Rack
UN  10.42.5.3  73.49 KiB  256     60.0%             4e63dc18-6870-4ce4-b3fc-6a802794815e  rack1
UN  10.42.3.3  73.45 KiB  256     74.0%             b3fd4fe9-a9b2-44a6-b826-fe0d1d99df2d  rack1
UN  10.42.4.3  73.42 KiB  256     66.0%             e548c921-c108-4a63-a41e-35aae0e85920  rack1
```
