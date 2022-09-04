# 开发者指南

### 生成 `.cls` 文件

```Bash
make cls
```

### 生成宏包手册

```Bash
make doc
```

### 本地开发

运行以下命令，系统将会在 `bithesis.dtx` 更新后自动编译新的 `.cls` 文件，并拷贝到 `templates` 目录下的相应模板中。

```Bash
# 请首先确保 entr 正确安装
make dev
```

### 单元测试和回归测试

运行 `make test` 将对所有的模板进行编译测试（同样被用于 Github Action）。

运行 `make regression-test` 进行回归测试，该命令将比较目前已发布的最新版本和本地版本生成的 PDF 的差异。
使用前请确保 `diff-pdf`、`zsh` 已经安装。

### Release 工作流

![Release Workflow](./assets/release_workflow.png)
