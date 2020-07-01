# run

> run quick command

## install

```bash
git clone git@github.com:BUGLAN/run.git
cd run
chmod a+x ./install.sh
./install.sh
```

## quick start

1. create file named `.runrc`

```bash
touch ~/.runrc
```

2. add command in .runrc

```
[uac]
oc port-forward svc/mp-wx-user 2011:8090 &
oc port-forward svc/fid 2900:8080
```

3. run quick command

```bash
run.sh uac
```

## notice

> The config and version command is build-in
