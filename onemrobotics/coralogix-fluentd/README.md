# Coralogix Fluentd Helm Chart for Kubernetes

This is a modified version of the official `FluentD` image with integration support for *Coralogix*, multiprocessing, and K8S.

## Introduction

This chart bootstraps a [FluentD Coralogix](https://github.com/coralogix/fluentd-coralogix-image) daemonset on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) Package Manager.

## Prerequisites

- `Kubernetes` 1.6+ with Beta APIs enabled.
- `Helm` 2.9+ Package Manager installed (For installation instructions please visit [Get Helm!](https://helm.sh)).

## Installing the Chart

```bash
$ helm repo add coralogix https://jfrog.coralogix.com/artifactory/helm
$ helm repo update
$ helm install --name my-release \
  --set PRIVATE_KEY=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX \
  --set APP_NAME=your-app-name \
  --set SUB_SYSTEM=sub-system-name
    coralogix/coralogix-fluentd
```

## Notes: 

1. The commands above deploy *Fluentd-Coralogix* on the `Kubernetes` cluster in the default configuration. 
The [configuration](#configuration) section lists the parameters that can be configured during the installation.

2. For helm 3.0 and above the --name option has been deprecated, so the command above would start like this:

```bash
$ helm install my-release \
```
 
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the `Kubernetes` components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `Fluentd Coralogix` chart and their default values.

| Parameter                                  | Description                                                                                                    | Default                                        |
|--------------------------------------------|----------------------------------------------------------------------------------------------------------------|------------------------------------------------|
| `PRIVATE_KEY`                              | Coralogix Private Key                                                                                          | `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`         |
| `APP_NAME`                                 | Coralogix Application Name                                                                                     | `$kubernetes.namespace_name`                   |
| `SUB_SYSTEM`                               | Coralogix Subsystem name                                                                                       | `$kubernetes.container_name`                   |
| `ENDPOINT`                                 | Coralogix API URL (`api.coralogix.com`, `api.app.coralogix.in`, `api.coralogix.us`)                            | `api.coralogix.com`                            |
| `coralogix.log_key_name`                   | Name of field in record which will be sent to Coralogix                                                        | None                                           |
| `coralogix.timestamp_key_name`             | Field with will be used in Coralogix as timestamp of log record                                                | None                                           |
| `coralogix.is_json`                        | Convert data to JSON                                                                                           | `true`                                         |
| `coralogix.force_compression`              | Compress data                                                                                                  | `false`                                        |
| `coralogix.debug`                  | Enable debug mode                                                                                                      | `false`                                        |
| `coralogix.proxy.host`             | Proxy host                                                                                                            | `None`                                         |
| `coralogix.proxy.port`             | Proxy port                                                                                                            | `None`                                         |
| `coralogix.proxy.user`             | Proxy user                                                                                                            | `None`                                         |
| `coralogix.proxy.password`         | Proxy password                                                                                                        | `None`                                         |
| `container.image.repository`               | Image repository                                                                                               | `docker.io/coralogixrepo/fluentd-coralogix-image` |
| `container.image.tag`                      | Image tag                                                                                                      | `1.1.8`                                        |
| `container.image.pullPolicy`       | Image pull policy                                                                                                      | `Always`                                       |
| `container.resources.limits.cpu`           | CPU resource limits                                                                                            | `100m`                                         |
| `container.resources.limits.memory`        | Memory resource limits                                                                                         | `400Mi`                                        |
| `container.resources.requests.cpu`         | CPU resource requests                                                                                          | `100m`                                         |
| `container.resources.requests.memory`      | Memory resource requests                                                                                       | `400Mi`                                        |
| `rbac.create`                      | If `true`, create and use RBAC resources                                                                               | `false`                                        |
| `tolerations`                              | List of node taints to tolerate (requires Kubernetes >= 1.6)                                                   | `node-role.kubernetes.io/master`: `NoSchedule` |
| `service.fluentd.enabled`                  | Enable FluentD forward service                                                                                 | `true`                                         |
| `service.fluentd.port`                     | FluentD port                                                                                                   | `24224`                                        |
| `service.http.enabled`                     | Enable HTTP collector service                                                                                  | `true`                                         |
| `service.http.port`                        | HTTP port                                                                                                      | `9880`                                         |
| `service.syslog.enabled`                   | Enable Syslog collector service                                                                                | `true`                                         |
| `service.syslog.port`                      | Syslog port                                                                                                    | `5140`                                         |
| `service.graylog.enabled`                  | Enable Graylog collector service                                                                               | `true`                                         |
| `service.graylog.port`                     | Graylog port                                                                                                   | `12201`                                        |
| `service.clusterIP`                        | ClusterIP for service enabled                                                                                  | `None`                                         |


### RBAC

By default the chart will not install the associated RBAC rolebinding,
using beta annotations.

You can determine if your cluster supports this by running the following command:

```console
$ kubectl api-versions | grep rbac
```

You also need to have the following parameter on the api server. See the
following document for how to enable [RBAC](https://kubernetes.io/docs/admin/authorization/rbac/).

```
--authorization-mode=RBAC
```

If the output contains `"beta"` or both `"alpha"` and `"beta"` you can enable RBAC.

### Enable RBAC role/rolebinding creation

To enable the creation of RBAC resources, do the following:

```console
$ helm install --name my-release stable/fluentd-coralogix --set rbac.create=true ...
```
