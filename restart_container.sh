#!/bin/bash

# 容器名称
CONTAINER_NAME="my_container"

# 创建重启脚本
echo "#!/bin/bash
docker restart \$CONTAINER_NAME" > /usr/local/bin/restart_container.sh

# 赋予执行权限
chmod +x /usr/local/bin/restart_container.sh

# 添加 cron 任务
(crontab -l 2>/dev/null; echo "0 * * * * /usr/local/bin/restart_container.sh") | crontab -

echo "Cron job for restarting Docker container '$CONTAINER_NAME' every hour has been set up."
