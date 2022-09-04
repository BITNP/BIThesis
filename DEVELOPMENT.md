# 开发者指南

## 任务管理

我们采用 [Github Projects](https://github.com/BITNP/BIThesis/projects) 进行任务管理。
你可以每次选择其中的一个小的 TODO 进行开发；来帮助项目一点一点前进。

## 开发命令

Makefile 主要针对 Linux 和 MacOS 开发者；如果你使用 Windows 开发，可能需要手动执行 Makefile 中具体的命令。

当然，也欢迎你贡献更通用的开发脚本。

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

## 参考资料

TODO

## 单元测试和回归测试

运行 `make test` 将对所有的模板进行编译测试（同样被用于 Github Action）。

运行 `make regression-test` 进行回归测试，该命令将比较目前已发布的最新版本和本地版本生成的 PDF 的差异。
使用前请确保 `diff-pdf`、`zsh` 已经安装。

## Release 工作流

![Release Workflow](./assets/release_workflow.png)
