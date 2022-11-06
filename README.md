# qqmusic-docker

容器化的 qqmusic.  

## 运行

```
# 生成构建镜像需要的环境变量
./init.sh

# 启动容器, 会自动打开 qqmusic
docker-compose up -d
```

需要注意的是依赖 pulseaudio, 你可能需要安装 pulseaudio 或者兼容层 (例如:  pipewire-pulse)
