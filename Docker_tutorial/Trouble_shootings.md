# Trouble shootings

native Docker on WSL 2 사용 중 직면한 문제들에 대한 trouble shooting 을 기록.

<br>

<br>

---

## Problem

docker run 할때 이미지를 못찾아 오는 문제

```bash
$ docker run ubuntu:16.04
...
Error response from daemon .... i/o timeout
```

### trouble shooting

```bash
$ docker-machine ssh default
$ sudo vi /etc/resolv.conf
```

resolv.conf 의 nameserver 를 `8.8.8.8` 로 바꿔준다.

### reference

[https://github.com/docker/for-mac/issues/1317](https://github.com/docker/for-mac/issues/1317)

<br>

---

## Problem

`/etc/resolv.conf` 의 nameserver 를 바꿔놔도 터미널을 재실행 할때마다 default nameserver 로 초기화된다.

### trouble shooting

`sudo vi /etc/wsl.conf`

아래 항목 작성.

```
[network]
generateResolvConf = false
```

<br>

```bash
$ sudo rm /etc/resolv.conf
$ sudo vi /etc/resolv.conf
```

아래 항목 작성.

```
nameserver 8.8.8.8
```

### reference

[https://github.com/Microsoft/WSL/issues/1908](https://github.com/Microsoft/WSL/issues/1908)

<br>

---

