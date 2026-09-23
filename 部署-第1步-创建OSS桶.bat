@echo off
chcp 65001 >nul
title Step1 - Create HK OSS Bucket
cd /d "%~dp0"

echo ========================================
echo  第 1 步：创建香港 OSS 桶 + 开静态网站
echo ========================================
echo.
echo 我会打开阿里云 OSS 控制台。请按下面做：
echo.
echo  1. 登录后点「Bucket 列表」-「创建 Bucket」
echo  2. Bucket 名称：自己起一个全球唯一的，例如 yunzhongyouxia-web
echo  3. 地域：必须选「中国香港」
echo  4. 读写权限：选「公共读」（静态网站要能公开访问）
echo  5. 其他保持默认，创建
echo.
echo 创建完成后，进入该 Bucket：
echo  6. 左侧「数据管理」-「静态页面」
echo  7. 开启静态网站托管
echo     - 默认首页：index.html
echo     - 默认 404 页：404.html
echo  8. 保存
echo.
echo 做完后回到这个对话回复我两样东西：
echo  - 桶名（Bucket 名称）
echo  - 「静态网站已开」
echo.
echo 正在打开控制台...
start "" "https://oss.console.aliyun.com/bucket"
echo.
pause
