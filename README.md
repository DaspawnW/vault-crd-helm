# Vault-CRD

This helm chart installs Vault-CRD version v1.2.2
https://vault.koudingspawn.de

## Prerequisites

### Configure Vault for Usage with Vault-CRD
Please follow the instructions on how to install Vault-CRD. You can specify which of the supported Authentication methods should be used:
https://vault.koudingspawn.de/install-vault-crd

### Configuration
Please change the values.yaml according to your setup
See here for the official documentation https://vault.koudingspawn.de/install-vault-crd#configuration-of-vault-crd

Parameter | Description | Default
--- | --- | ---
`vaultCRD.repository` | Image repository | `daspawnw/vault-crd`
`vaultCRD.tag` | Image tag | `1.1.0`
`vaultCRD.pullPolicy` | Image pull policy | `IfNotPresent`
`vaultCRD.vaultUrl` | Please specify here the URL to your Vault installation. Don't forget to set the /v1/ path e.g. http://localhost:8080/v1/ | `nil`
`vaultCRD.vaultAuth` | Specifies the used authentication method the following values are allowed: token / serviceAccount | `nil`
`vaultCRD.vaultToken` | Token with access to the resources that Vault-CRD shares from Vault to Kubernetes. Required if vaultAuth = token | `nil`
`vaultCRD.vaultRole` | If you use the Service Account approach for Vault authentication please specify here the Vault role. Required if vaultAuth = serviceAccount | `nil`
`vaultCRD.rbac` | Should it generate rbac resources | `true`
`vaultCRD.memory` | JVM Max memory in mb | `256`
`vaultCRD.memoryLimit` | Container max memory in mb should be 20% higher then jvm memory value | `307`


## How to
When used with serviceAccount:

```
helm install --name vault --namespace vault-crd ./vault-crd \
    --set vaultCRD.vaultUrl=http://localhost:8080/v1/ \
    --set vaultCRD.vaultAuth=serviceAccount \
    --set vaultCRD.vaultRole=test 
```

When used with Token:

```
helm install --name vault --namespace vault-crd ./vault-crd \
    --set vaultCRD.vaultUrl=http://localhost:8080/v1/ \
    --set vaultCRD.vaultToken=uuid 
```

## Issues

Please write issues to the main projects issues: https://github.com/DaspawnW/vault-crd/issues
