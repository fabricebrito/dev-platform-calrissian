# calrissian development platform

CWL on kubernetes on your local minikube including:

- A service account `calrissian-sa`
- Roles and role bindings to run `calrissian` and Kubernetes jobs
- A persistent volume claim in RWX mode 
- A deployment with a pod with the volume mounted on `/calrissian` for: 
    - running `calrissian` via command line tool
    - submiting Kubernetes jobs using `kubectl`

## Requirements

* A minikube cluster
* Docker
* the `skaffold` CLI 

## Start the calrissian development platform

* Clone the repository.
* Run `skaffold dev` in a terminal
* Wait for the deployment to stabilize.

Then: 

* you can submit jobs using `kubectl`
* you can open a shell session on the pod `calrissian-session-xxxx`
* you can attach a Visual Studio Code session on the pod `calrissian-session-xxxx`


Run the example found in the `example` folder, there's a README with the steps.

