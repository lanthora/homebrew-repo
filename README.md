# Homebrew 仓库

参考官方文档了解 [Homebrew](https://brew.sh/) 和[第三方仓库](https://docs.brew.sh/Taps).

本项目是一个第三方仓库.使用以下命令添加本仓库.这步出现问题请参考 Homebrew 的官方文档.

```bash
brew tap lanthora/repo
```

这个仓库维护着组网工具 [Candy](https://github.com/lanthora/candy), 通过以下命令安装.

```bash
brew install candy
```

安装成功后会提示服务启动命令,应该与以下命令相同.

```bash
sudo brew services start lanthora/repo/candy
```

服务使用的配置文件路径为 `/opt/homebrew/etc/candy.conf`, 日志路径为 `/opt/homebrew/var/log/candy.log`, 不同版本 Mac 可能有所差异.

此时,你应该已经成功加入了我们的网络.这个仓库仅维护 Mac 与其他系统安装上的差异,不关注软件使用细节,具体使用请参考 [Candy](https://github.com/lanthora/candy).

