#!/bin/bash

echo "正在启动 SuperLinkSale..."
echo ""

PID=$(lsof -ti:18080)
if [ ! -z "$PID" ]; then
    echo "检测到服务正在运行 (PID: $PID)，正在停止..."
    kill -9 $PID
    sleep 1
    echo "服务已停止"
fi

if [ ! -d "venv" ]; then
    echo "未检测到虚拟环境，正在创建..."
    python3 -m venv venv
fi

echo "激活虚拟环境..."
source venv/bin/activate

echo "安装依赖..."
pip install -r requirements.txt

echo ""
echo "启动服务器..."
echo "访问地址: http://localhost:18080"
echo "管理后台: http://localhost:18080/admin"
echo "默认密码: welcome"
echo ""

nohup uvicorn backend.main:app --reload --host 0.0.0.0 --port 18080 > logs/server.log 2>&1 &

echo "服务已在后台启动，日志输出到 logs/server.log"
echo "查看日志: tail -f logs/server.log"
