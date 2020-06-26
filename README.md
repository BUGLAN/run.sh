# run
run quick command

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
[hello]
echo hello world
```

3. run quick command

```bash
run.sh hello
```

## notice

> The config and version command is build-in