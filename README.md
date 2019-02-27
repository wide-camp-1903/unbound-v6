# unbound-v6
- https://hub.docker.com/r/widecamp1903/unbound-v6
- internal-serverでIPv6向けのフルサービスリゾルバを提供

## ESXi側
- `/etc/netplan/50-cloud-init.yaml` を編集してアドレスを固定

## デプロイ
`unbound/unbound.conf`の待受アドレスを環境に合わせて修正
```
% make init
% make run
```

## Future work
### ネットワーク名前空間をホストと共有しないやり方を探したい
1. `/etc/docker/daemon.json`を編集しHost VMの方でインターフェイスを用意する．`fixed-cidr-v6`は適宜

```
{
  "ipv6": true,
  "fixed-cidr-v6": "172:0::/64"
}
```

2. その後、dockerdを再起動
```
% sudo systemctl restart docker
```
