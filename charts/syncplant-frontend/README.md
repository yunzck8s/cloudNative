
# Syncplant<sup>front</sup>  Chart packaged by sciyon

[Syncplant<sup>front</sup>](http://www.sciyon.com/) 是syncplant微服务前端。
## TL;DR

```bash
$ helm repo add syncplant http://10.88.12.26:80/chartrepo/charts
$ helm install my-release syncplant/syncplant-front-++
```

## Introduction

该chart提供了一种部署syncplan微服务前端的一种方式，使用这个chart在rancher中可以快速的部署微服务前端。

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure

## Installing the Chart

使用名称 `syncplan-web`部署chart:

```bash
$ helm install syncplan-web syncplant/syncplant-web
```

这个helm命令将使用默认配置部署syncplant微服务，

> **Tip**: 使用 `helm list`可以列出所有的实例

## Uninstalling the Chart

 卸载 `syncplan-web` deployment:

```bash
$ helm delete syncplan-web
```
这个命令将移除k8s中所有通过这个chart部署的实例。

## Parameters
下面列表将列出syncplant-front所有的配置参数和他们的默认值。

#### Common parameters

| 参数名称                                | 描述                                                                                                                                                | 默认值                                                  | 是否必填                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|---------------------------------------------------------
| `image.repository`                      | syncplant-backend后端镜像仓库                                                                                                                       | `syncplant/syncplant-pf`                                | 是
| `image.tag`                             | syncplant后端镜像的Tag，一般指版本号                                                                                                                | `{TAG_NAME}`                                            | 是
| `image.pullPolicy`                      | 镜像拉取的策略                                                                                                                                      | `IfNotPresent`                                          | 否
| `imagePullSecrets`                      | 镜像拉取的秘钥                                                                                                                                      | `null`                                                  | 否
| `nameOverride`                          | k8s中负载的名称                                                                                                                                     | `null`                                                  | 是
| `replicaCount`                          | k8s中运行容器的副本数                                                                                                                               | `2`                                                     | 否
| `resources`                             | k8s中容器所占用的资源                                                                                                                               | `{Memory: "256Mi", CPU: "100m"}`                        | 否

若想通过命令指定配置参数，则在`helm install`时使用 `--set key=value[,key=value]` . 例如,

```bash
$ helm install syncplant \
  --set spring.application.name=syncplant-web \
    syncplant/syncplant-backend
```

上面的命令将设置前端的名称为 `syncplant-web`。

>NOTE：一旦chart被部署后，所有的配置参数将无法修改，若想调整参数，则需要更新这个chart.
`syncplant-system-resource`               | syncplant资源微服务                                                                                                                               