
Create the parameters file configmap:

```
kubectl create -n calrissian configmap params --from-file=params.yaml
```

Get the application package: 

```
curl -L https://github.com/eoap/mastering-app-package/releases/download/1.0.0/app-water-bodies-cloud-native.1.0.0.cwl > app-package.cwl
```

```
kubectl create -n calrissian configmap app-package --from-file=app-package.cwl
```

Run the Kubernetes job with: 

```
kubectl apply -n calrissian -f k8s-job.yaml
```

Monitor the job with: 

```
kubectl get pods -n calrissian -l job-name=water-bodies-detection -w
```