@echo off
echo 正在启动 SuperLinkSale...
echo.

if not exist "venv" (
    echo 未检测到虚拟环境，正在创建...
    python -m venv venv
)

echo 激活虚拟环境...
call venv\Scripts\activate.bat

echo 安装依赖...
pip install -r requirements.txt

echo.
echo 启动服务器...
echo 访问地址: http://localhost:18080
echo 管理后台: http://localhost:18080/admin
echo 默认密码: admin123
echo.

uvicorn backend.main:app --reload --host 0.0.0.0 --port 18080
