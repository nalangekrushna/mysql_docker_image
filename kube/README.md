// before starting this tutorial please go through the tutorial from website/kube/README.md 
// Assuming you have completed deployment part there you can start working here.

// pv and pvc for db volume.
// for local storage class dynamic provisioning is not supported. So we will do manual provisioning.
// for AWS EBS storage class we will use dynamic provisioning.

// consider using service account for pods to access db, also create non root user to access the db with less // privileges. for now going with default service account and root user for db.

// first create pv
kubectl apply -f db-pv-local.yaml

// then create pvc 
kubectl apply -f db-pvc-local.yaml

// then create db secrets.
kubectl apply -f db-secrets-opaque.yaml

// then create db configmap
kubectl apply -f db-init-cfg.yaml

// create db statefulset
kubectl apply -f db-sts.yaml

// create a service to access db from website
kubectl apply -f db-clusterip-svc.yaml

// need to resolve 1045 Plugin caching_sha2_password could not be loaded: issue from
// code only for now just login and create user using quick fix provided below.

FAQ
1. 1045 Plugin caching_sha2_password could not be loaded
option a (difficutl, non-secure)
    kubectl exec -it db-deploy-558b46f485-4ddbh -n dev -- mysql -uroot -p 
    // enter password toor
    ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'toor';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
option b (recommended, non-secure)
// In sts containers add this
args: ["--default-authentication-plugin=mysql_native_password"]

2. 1049 Unknown database 'website'
It means initialization script has not run.
