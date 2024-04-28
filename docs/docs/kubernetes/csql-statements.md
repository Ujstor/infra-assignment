
```bash
pip install -U cqlsh

Collecting cqlsh
  Downloading cqlsh-6.1.3-py3-none-any.whl.metadata (6.6 kB)
Collecting cassandra-driver (from cqlsh)
  Downloading cassandra_driver-3.29.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (5.9 kB)
Requirement already satisfied: six in /home/ujstor/miniconda3/lib/python3.10/site-packages (from cqlsh) (1.16.0)
Collecting geomet<0.3,>=0.1 (from cassandra-driver->cqlsh)
  Downloading geomet-0.2.1.post1-py3-none-any.whl.metadata (1.0 kB)
Requirement already satisfied: click in /home/ujstor/miniconda3/lib/python3.10/site-packages (from geomet<0.3,>=0.1->cassandra-driver->cqlsh) (8.1.7)
Downloading cqlsh-6.1.3-py3-none-any.whl (110 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 110.9/110.9 kB 2.2 MB/s eta 0:00:00
Downloading cassandra_driver-3.29.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (18.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.9/18.9 MB 25.5 MB/s eta 0:00:00
Downloading geomet-0.2.1.post1-py3-none-any.whl (18 kB)
Installing collected packages: geomet, cassandra-driver, cqlsh
Successfully installed cassandra-driver-3.29.1 cqlsh-6.1.3 geomet-0.2.1.post1
```

```bash
export CASSANDRA_PASSWORD=$(kubectl get secret --namespace "cassandra" cassandra -o jsonpath="{.data.cassandra-password}" | base64 --decode)
 echo $CASSANDRA_PASSWORD
EwHaQjhdev
```

```bash
kubectl port-forward --namespace cassandra svc/cassandra 9042:9042 &
   cqlsh -u cassandra -p $CASSANDRA_PASSWORD 127.0.0.1 9042
[1] 205726
Forwarding from 127.0.0.1:9042 -> 9042

Warning: Using a password on the command line interface can be insecure.
Recommendation: use the credentials file to securely provide the password.

Handling connection for 9042
Handling connection for 9042
Handling connection for 9042
Handling connection for 9042
WARNING: cqlsh was built against 4.1.4, but this server is 4.0.0.  All features may not work!
Connected to cassandra at 127.0.0.1:9042
[cqlsh 6.1.0 | Cassandra 4.0.0 | CQL spec 3.4.5 | Native protocol v5]
Use HELP for help.
cassandra@cqlsh>
```

```bash
cassandra@cqlsh> CREATE KEYSPACE IF NOT EXISTS store  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
```

```bash
cassandra@cqlsh> USE store;
cassandra@cqlsh:store>
```

```bash
cassandra@cqlsh:store> CREATE TABLE IF NOT EXISTS shopping_cart (userid text PRIMARY KEY, item_count int, last_update_timestamp timestamp);
```

```bash
cassandra@cqlsh:store>INSERT INTO shopping_cart (userid, item_count, last_update_timestamp) VALUES ('James', 233, toTimestamp(now()));
cassandra@cqlsh:store>INSERT INTO shopping_cart (userid, item_count, last_update_timestamp) VALUES ('Alex', 124, toTimestamp(now()));
cassandra@cqlsh:store>INSERT INTO shopping_cart (userid, item_count, last_update_timestamp) VALUES ('Brian', 567, toTimestamp(now()));
```

```bash
cassandra@cqlsh:store> SELECT * FROM shopping_cart;

 userid | item_count | last_update_timestamp
--------+------------+---------------------------------
  Brian |        567 | 2024-04-28 17:37:48.950000+0000
  James |        233 | 2024-04-28 17:37:27.166000+0000
   Alex |        124 | 2024-04-28 17:37:39.900000+0000

(3 rows)
```
