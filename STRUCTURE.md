# SuperLinkSale 项目结构说明

```
superlinksale/
│
├── backend/                      # 后端代码目录
│   ├── __init__.py              # Python 包初始化文件
│   ├── main.py                  # FastAPI 应用主入口
│   ├── database.py              # 数据库连接和配置
│   ├── models.py                # SQLAlchemy 数据库模型
│   ├── schemas.py               # Pydantic 数据验证模型
│   ├── auth.py                  # JWT 认证相关功能
│   └── utils.py                 # 工具函数（短链码生成等）
│
├── frontend/                     # 前端代码目录
│   ├── index.html               # 🎨 首页（粒子动画 + 渐变设计）
│   ├── admin.html               # 🔧 管理后台页面
│   ├── preview.html             # 🌌 短链预览页面（Aurora 效果）
│   └── static/                  # 静态资源目录
│       ├── css/
│       │   ├── index.css        # 首页样式
│       │   ├── admin.css        # 管理后台样式
│       │   └── preview.css      # 预览页面样式
│       └── js/
│           ├── index.js         # 首页逻辑（粒子动画）
│           └── admin.js         # 管理后台逻辑
│
├── data/                        # 数据存储目录
│   ├── .gitkeep                # Git 占位文件
│   └── links.db                # SQLite 数据库（运行后自动生成）
│
├── .env                         # 🔒 环境变量配置（不提交到 Git）
├── .env.example                 # 环境变量示例文件
├── .gitignore                   # Git 忽略文件配置
├── requirements.txt             # Python 依赖包列表
├── start.bat                    # Windows 启动脚本
├── start.sh                     # Linux/Mac 启动脚本
├── LICENSE                      # MIT 开源协议
├── README.md                    # 完整项目文档
└── QUICKSTART.md                # 快速入门指南
```

## 📁 目录说明

### Backend（后端）

#### `main.py` - 应用主文件
- FastAPI 应用实例
- 所有 API 路由定义
- 静态文件挂载
- CORS 中间件配置

**主要路由：**
- `/` - 首页
- `/admin` - 管理后台
- `/l/{short_code}` - 短链预览页面
- `/{short_code}` - 短链直接跳转
- `/api/*` - RESTful API 接口

#### `database.py` - 数据库层
- SQLAlchemy 引擎配置
- 会话管理
- 数据库初始化

#### `models.py` - 数据模型
- `Link` - 短链接表模型
- `Template` - 模板表模型

#### `schemas.py` - 数据验证
- Pydantic 模型定义
- 请求/响应数据结构
- 数据验证规则

#### `auth.py` - 认证系统
- JWT Token 生成和验证
- 密码验证
- Bearer Token 认证

#### `utils.py` - 工具函数
- 短链接码生成（6位随机字符）

### Frontend（前端）

#### `index.html` - 首页
**特色：**
- Canvas 粒子动画背景
- 实时统计数据展示
- 渐变色设计
- 浮动卡片动画

#### `admin.html` - 管理后台
**功能：**
- 密码登录
- 短链接 CRUD
- 模板管理
- 数据统计看板

#### `preview.html` - 预览页面
**特色：**
- Aurora 极光动画背景
- 链接信息展示
- 倒计时自动跳转
- 一键复制短链接

### Static（静态资源）

#### CSS 文件
- **index.css**: 首页样式，包含粒子动画、渐变、响应式布局
- **admin.css**: 后台样式，包含侧边栏、表格、模态框、玻璃态卡片
- **preview.css**: 预览页面样式，包含 Aurora 动画、倒计时效果

#### JS 文件
- **index.js**: 粒子动画引擎、数据统计加载、平滑滚动
- **admin.js**: 认证逻辑、API 调用、CRUD 操作、模板应用

### Data（数据）

#### `links.db`
SQLite 数据库文件，包含两张表：
- **links**: 存储短链接数据
- **templates**: 存储文案模板

### 配置文件

#### `.env`
环境变量配置（**重要：不要提交到 Git**）
```env
ADMIN_PASSWORD=你的密码
SECRET_KEY=JWT密钥
BASE_URL=http://localhost:18080
DATABASE_URL=sqlite:///./data/links.db
```

#### `requirements.txt`
Python 依赖包：
- fastapi - Web 框架
- uvicorn - ASGI 服务器
- sqlalchemy - ORM
- python-dotenv - 环境变量
- python-jose - JWT
- pydantic - 数据验证

#### `.gitignore`
忽略文件：
- `__pycache__/` - Python 缓存
- `venv/` - 虚拟环境
- `.env` - 敏感配置
- `data/*.db` - 数据库文件

## 🔄 数据流向

### 创建短链接流程
```
用户 → admin.html → admin.js → POST /api/links 
→ main.py → models.Link → database 
→ 返回短链码 → 前端显示
```

### 访问短链接流程
```
用户 → /{short_code} → main.py → 查询 database 
→ 更新点击数 → RedirectResponse(original_url)
```

### 预览页面流程
```
用户 → /l/{short_code} → main.py → 查询 database 
→ 渲染 preview.html → 显示信息 → 倒计时跳转
```

## 🎨 设计系统

### 颜色变量（CSS Variables）
```css
--primary: #667eea      /* 主色紫 */
--secondary: #764ba2    /* 次色紫 */
--accent: #f093fb       /* 强调粉 */
--success: #4ade80      /* 成功绿 */
--bg-dark: #0f0f23      /* 深色背景 */
--bg-darker: #050510    /* 更深背景 */
```

### 设计元素
- **玻璃态（Glassmorphism）**: 半透明卡片 + 背景模糊
- **渐变（Gradients）**: 135度线性渐变
- **动画（Animations）**: 悬停、浮动、淡入、滚动
- **响应式（Responsive）**: 移动端适配

## 🔧 开发指南

### 添加新的 API 接口
1. 在 `schemas.py` 定义请求/响应模型
2. 在 `main.py` 添加路由函数
3. 使用 `Depends(verify_token)` 保护需要认证的接口

### 添加新的前端页面
1. 在 `frontend/` 创建 HTML 文件
2. 在 `frontend/static/css/` 创建对应 CSS
3. 在 `frontend/static/js/` 创建对应 JS
4. 在 `main.py` 添加路由返回 HTML

### 修改数据库模型
1. 修改 `models.py` 中的模型
2. 删除 `data/links.db`
3. 重启服务自动创建新表

## 📊 性能优化建议

- **数据库**: 中小规模使用 SQLite，大规模切换 PostgreSQL
- **静态资源**: 使用 CDN 加速
- **服务器**: Gunicorn + Nginx 部署
- **缓存**: 添加 Redis 缓存热门链接

## 🔒 安全建议

- ✅ 修改默认密码
- ✅ 使用 HTTPS（生产环境）
- ✅ 定期备份数据库
- ✅ 限制 API 访问频率
- ✅ 不要暴露 `.env` 文件

---

需要更多帮助？查看 [README.md](README.md) 或 [QUICKSTART.md](QUICKSTART.md)
