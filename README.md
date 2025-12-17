# 短链接管理系统 (SuperLinkSale)

体验地址: [https://slink.catsapi.com](https://slink.catsapi.com)
admin密码：welcome

<div align="center">

🚀 一个超级酷炫的短链接管理系统 🚀

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.104+-green.svg)](https://fastapi.tiangolo.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

## ✨ 界面特色

### 🎨 超酷炫的视觉效果
- **粒子动画背景**: 首页采用 Canvas 粒子连线动画，科技感十足
- **Aurora 极光效果**: 短链预览页面使用动态极光背景，视觉冲击力强
- **渐变色设计**: 全站采用紫色系渐变配色，现代化设计语言
- **玻璃态卡片**: 磨砂玻璃效果的卡片设计，半透明质感
- **流畅动画**: 所有交互都配有流畅的过渡动画和悬停效果

### 🎯 用户体验
- **响应式设计**: 完美适配桌面端和移动端
- **暗色主题**: 护眼的深色主题，适合长时间使用
- **即时反馈**: 所有操作都有实时的视觉反馈
- **数字动画**: 统计数字采用动态滚动效果
- **倒计时跳转**: 短链预览页面自动倒计时跳转，可取消

## 功能特性

- 🔐 **密码保护**: 后台管理需要密码验证（密码配置在 .env 文件中）
- 📝 **模板管理**: 预设文案模板，快速填充链接内容
- ⏰ **过期时间**: 支持设置短链接失效时间，默认永久有效
- 🎨 **简洁界面**: 简单易用的前端管理界面
- 💾 **本地存储**: 使用 SQLite 数据库，无需额外安装数据库服务
- 📊 **数据统计**: 实时追踪点击数据和链接表现
- 🔗 **短链预览**: 访问短链时先显示预览页面，展示链接信息

## 技术栈

- **后端**: Python 3.8+ + FastAPI
- **数据库**: SQLite
- **前端**: HTML + CSS + JavaScript (原生)

## 项目结构

```
superlinksale/
├── backend/
│   ├── main.py              # FastAPI 应用入口
│   ├── models.py            # 数据库模型
│   ├── schemas.py           # Pydantic 模型
│   ├── database.py          # 数据库连接
│   ├── auth.py              # 认证相关
│   └── utils.py             # 工具函数
├── frontend/
│   ├── index.html           # 前端页面
│   ├── admin.html           # 管理后台
│   └── static/
│       ├── css/
│       └── js/
├── data/
│   └── links.db             # SQLite 数据库文件（自动生成）
├── .env                     # 环境配置文件
├── requirements.txt         # Python 依赖
└── README.md                # 项目说明
```

## 🚀 快速开始

### 方式一：使用启动脚本（推荐）

**Windows 用户:**
```bash
start.bat
```

**Linux/Mac 用户:**
```bash
chmod +x start.sh
./start.sh
```

启动脚本会自动完成以下操作：
1. 创建 Python 虚拟环境（如果不存在）
2. 安装所有依赖包
3. 启动开发服务器

### 方式二：手动安装

#### 1. 克隆项目

```bash
git clone https://github.com/yourusername/superlinksale.git
cd superlinksale
```

#### 2. 创建虚拟环境

```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Linux/Mac
source venv/bin/activate
```

#### 3. 安装依赖

```bash
pip install -r requirements.txt
```

#### 4. 配置环境变量

复制 `.env.example` 为 `.env` 并修改配置：

```env
# 管理后台密码（必须修改）
ADMIN_PASSWORD=your_secure_password

# JWT 密钥（建议修改为随机字符串）
SECRET_KEY=your-super-secret-key-change-this-in-production-min-32-characters

# 短链接域名（可选）
BASE_URL=http://localhost:18080

# 数据库路径（可选）
DATABASE_URL=sqlite:///./data/links.db
```

#### 5. 运行项目

```bash
# 开发模式（带热重载）
uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000

# 生产模式
uvicorn backend.main:app --host 0.0.0.0 --port 8000
```

#### 6. 访问应用

- 🏠 **首页**: http://localhost:18080
- 🔧 **管理后台**: http://localhost:18080/admin
- 📚 **API 文档**: http://localhost:18080/docs
- 📖 **ReDoc**: http://localhost:18080/redoc

**默认管理员密码**: `admin123` （请在 .env 中修改）

## 📖 使用说明

### 🏠 首页功能

首页展示了项目的核心特性和统计数据：
- 实时显示生成的短链接总数
- 实时显示总点击量统计
- 粒子动画背景营造科技氛围
- 浮动卡片展示功能特点

### 🔧 管理后台

#### 登录
1. 访问 `http://localhost:18080/admin` 进入管理后台
2. 输入在 `.env` 中配置的 `ADMIN_PASSWORD`
3. 登录成功后，token 会保存在浏览器本地存储中

#### 短链接管理
- **创建链接**: 点击"创建短链接"按钮
  - 输入原始 URL（必填）
  - 添加标题和描述（可选）
  - 选择模板快速填充内容
  - 设置过期时间（留空则永久有效）

- **编辑链接**: 点击表格中的"编辑"按钮修改链接信息
- **删除链接**: 点击"删除"按钮移除短链接
- **查看统计**: 表格中显示每个链接的点击次数

#### 模板管理
- **创建模板**: 保存常用的标题和描述文案
- **应用模板**: 创建短链接时，从下拉菜单选择模板，自动填充内容
- **编辑/删除**: 随时更新或移除不需要的模板

### 🔗 短链接访问

#### 方式一：直接跳转
访问 `http://localhost:18080/{short_code}`，直接跳转到目标 URL

#### 方式二：预览页面
访问 `http://localhost:18080/l/{short_code}`，显示酷炫的预览页面：
- 展示链接标题和描述
- 显示短链接代码（可一键复制）
- 显示点击统计
- 3 秒倒计时自动跳转（可取消）
- Aurora 极光动画背景

## API 文档

启动项目后访问：
- Swagger UI: `http://localhost:18080/docs`
- ReDoc: `http://localhost:18080/redoc`

### 主要接口

#### 认证
- `POST /api/auth/login` - 管理员登录

#### 短链接
- `POST /api/links` - 创建短链接
- `GET /api/links` - 获取短链接列表
- `GET /api/links/{short_code}` - 获取短链接详情
- `PUT /api/links/{short_code}` - 更新短链接
- `DELETE /api/links/{short_code}` - 删除短链接
- `GET /{short_code}` - 短链接重定向

#### 模板
- `POST /api/templates` - 创建模板
- `GET /api/templates` - 获取模板列表
- `GET /api/templates/{id}` - 获取模板详情
- `PUT /api/templates/{id}` - 更新模板
- `DELETE /api/templates/{id}` - 删除模板

## 数据库结构

### links 表
- `id`: 主键
- `short_code`: 短链接码（唯一）
- `original_url`: 原始链接
- `title`: 标题
- `description`: 描述
- `expire_at`: 过期时间（NULL 表示永久）
- `click_count`: 点击次数
- `created_at`: 创建时间
- `updated_at`: 更新时间

### templates 表
- `id`: 主键
- `name`: 模板名称
- `title`: 标题模板
- `description`: 描述模板
- `notes`: 备注模板
- `created_at`: 创建时间

## 开发说明

### 添加新功能

1. 在 `models.py` 中定义数据库模型
2. 在 `schemas.py` 中定义 API 数据结构
3. 在 `main.py` 中添加路由和业务逻辑
4. 更新前端页面调用新接口

### 数据库迁移

项目启动时会自动创建数据库表，如需手动重置：

```bash
# 删除数据库文件
rm data/links.db

# 重新启动项目，自动创建新表
uvicorn backend.main:app --reload
```

## 注意事项

### ⚠️ 安全建议
- 首次运行前**务必修改** `.env` 中的 `ADMIN_PASSWORD` 和 `SECRET_KEY`
- 生产环境建议使用 HTTPS
- 不要将 `.env` 文件提交到 Git 仓库
- 定期备份 `data/links.db` 数据库文件
- 短链接码生成后不可修改（只能删除重建）

### 💡 性能优化
- SQLite 适合中小规模部署（日均 < 10 万次访问）
- 大规模部署建议切换到 PostgreSQL 或 MySQL
- 可以配置 CDN 加速静态资源
- 生产环境使用 Gunicorn + Nginx 部署

### 🐛 常见问题

**Q: 忘记管理员密码怎么办？**
A: 修改 `.env` 文件中的 `ADMIN_PASSWORD`，重启服务即可

**Q: 短链接访问 404？**
A: 检查数据库是否正常创建，确认 `data` 目录有写入权限

**Q: 粒子动画卡顿？**
A: 可以修改 `frontend/static/js/index.js` 中的 `particleCount` 减少粒子数量

**Q: 如何部署到服务器？**
A: 参考下方的部署指南

## 📦 部署指南

### 使用 Gunicorn（生产环境）

```bash
# 安装 Gunicorn
pip install gunicorn

# 启动服务
gunicorn backend.main:app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
```

### 使用 Docker

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

```bash
# 构建镜像
docker build -t superlinksale .

# 运行容器
docker run -d -p 8000:8000 -v $(pwd)/data:/app/data --env-file .env superlinksale
```

### Nginx 反向代理配置

```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /static {
        alias /path/to/superlinksale/frontend/static;
        expires 30d;
    }
}
```

## 🛣️ 路线图

- [ ] 自定义短链接代码
- [ ] 链接分组和标签
- [ ] 二维码生成
- [ ] 访问日志和详细统计
- [ ] 批量导入/导出
- [ ] API 密钥管理
- [ ] 多用户支持
- [ ] 链接密码保护

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 License

MIT License

---

<div align="center">
Made with ❤️ by SuperLinkSale Team

⭐ 如果这个项目对你有帮助，请给个 Star 支持一下！
</div>
