
# Syncplant<sup>back</sup>  Chart packaged by sciyon

[Syncplant<sup>back</sup>](http://www.sciyon.com/) 是syncplant后端微服务，主要包括网关、鉴权、日志、组织机构、基础平台等微服务。
## TL;DR

```bash
$ helm repo add syncplant http://10.88.12.26:80/chartrepo/charts
$ helm install my-release syncplant/syncplant-backend-++
```

## Introduction

该chart提供了一种部署syncplant后端微服务的一种方式，使用这个chart在rancher中可以快速的部署微服务。

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure

## Installing the Chart

使用名称 `syncplan-pf`部署chart:

```bash
$ helm install syncplan-pf syncplant/syncplant-backend
```

这个helm命令将使用默认配置部署syncplant微服务，

> **Tip**: 使用 `helm list`可以列出所有的实例

## Uninstalling the Chart

 卸载 `syncplan-pf` deployment:

```bash
$ helm delete syncplan-pf
```
这个命令将移除k8s中所有通过这个chart部署的实例。

## Parameters
下面列表将列出syncplant-backend所有的配置参数和他们的默认值。

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
| `syncplant.port`                        | k8s中容器的端口号，默认为8080                                                                                                                       | `8080`                                                  | 否
| `syncplant.configMap`                   | 微服务的通用配置configMap名称，默认为syncplant-backend-configMap                                                                                    | `syncplant-backend-configMap`                           | 否

若想通过命令指定配置参数，则在`helm install`时使用 `--set key=value[,key=value]` . 例如,

```bash
$ helm install syncplant \
  --set spring.application.name=syncplant-pf \
    syncplant/syncplant-backend
```

上面的命令将设置微服务的名称为 `syncplant-pf`。

>NOTE：一旦chart被部署后，所有的配置参数将无法修改，若想调整参数，则需要更新这个chart.


#### 微服务名称
该chart会被用于syncplant后端微服务在k8s中部署，因此`nameOverride`参数必须保证微服务级别的唯一。我们建议微服务部署时候任然使用一下列表的微服务名称：

| 微服务名称                                | 描述                                                                                                                                               |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------
| `syncplant-frame-gateway`                 | syncplant网关微服务                                                                                                               
| `syncplant-frame-auth`                    | syncplant鉴权微服务,负责syncplant的用户鉴权                                                                                                                                     
| `syncplant-system-pf`                     | syncplant基础平台微服务,该微服务为基础微服务。                                                                                                                                      
| `syncplant-system-log`                    | syncplant日志微服务，包括用户操作日志。                                                                                                                                     
| `syncplant-system-org`                    | syncplant组织机构微服务                                                                                                                               
| `syncplant-system-resource`               | syncplant资源微服务                                                                                                                               