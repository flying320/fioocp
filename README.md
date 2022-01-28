# fioocp
FIO for Openshift

The Dockerfile generates an Alpine image with FIO installed.


$ oc apply -f deployment_fiopod.yaml 

persistentvolumeclaim/fiodatapvc created
persistentvolumeclaim/fioconfpvc created
deployment.apps/ddfiodeployment created


