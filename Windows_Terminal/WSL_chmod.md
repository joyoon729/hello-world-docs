# WSL_chmod



## Problem

`git config --global credential.helper 'cache --timeout=21600'

git 로그인정보를 `credential` 정보를 저장해둘 시 `~/.cache/git/credential` 의 접근 권한이 777 로 되어있어서 다른 사용자가 접근 할 수 있어 위험하다는 메세지를 띄우며 git 명령이 abort 된다.



하지만 WSL 로는 Windows 파일 시스템에 대해 chmod 명령이 먹히질 않는다. (명령어 입력은 되나 적용이 안됨)

<br>

---

<br>



## troubleshooting

**Windows 파일 시스템에 대한 접근권한 얻는다.**

```bash
sudo unmount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata
```



**`~/.cache/git/credential` 의 권한을 700으로 변경**

```bash
sudo chmod 700 ~/.cache/git/credential
```

여기까지 하면 root 계정에 대해선 계정정보를 필요로 하는 git 명령어 사용 가능하다.

하지만 user 계정에 대해서는 `credential` 디렉토리에 접근이 불가능해서 항상 `sudo git pull` 식으로 해야 한다.

때문에 `credential` 디렉토리의 소유권을 user 계정으로 바꾼다.



**계정 joyoon 으로 소유권 바꾸기**

```bash
sudo chown joyoon ~/.cache/git/credential
```

