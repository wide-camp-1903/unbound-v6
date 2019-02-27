# unbound-v6
- https://hub.docker.com/r/widecamp1903/unbound-v6
- internal-serverでIPv6向けのフルサービスリゾルバを提供

## ESXi側
- `/etc/netplan/50-cloud-init.yaml` を編集してアドレスを固定

## デプロイ
- **まずはDockerをIPv6で動くようにしないとダメ**
- まずは`docker-compose.yml`の待受アドレスを環境に合わせて修正
```
% make init
% make run
```
