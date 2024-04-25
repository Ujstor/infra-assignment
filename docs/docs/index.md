# Test assignments

This test Assignment is divided into two parts:

- The first Part will asses you infrastructure skill and the second Part will assess your Kubernetes skill

During this assignment, you will have to Write a `README.md` file with all the commands that are necessary to achieve the instruction and **their output** (you can also use a Jupyter notebook).

```python
!k3d cluster create test-assignment --servers 3 --agents 3 --k3s-server-arg '--node-label=type=control' --k3s-agent-arg '--node-label=type=worker' --k3s-agent-arg '--node-label=type=worker'
```

```python
!kubectl get all -A
```

```python
!kubectl cluster-info
```
