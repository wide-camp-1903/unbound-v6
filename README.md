**動きません！DockerでIPv6ネットワークを使う方法を調べないといけない**
# WIP: unbound-v6
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

- **Host VMの方でインターフェイスを用意する**

`/etc/docker/daemon.json`
```
{
  "ipv6": true,
  "fixed-cidr-v6": "172:0::/64"
}
```
**fixed-cidr-v6は適宜編集(動作未確認)**

その後、dockerdを再起動
`$ sudo systemctl restart docker`
