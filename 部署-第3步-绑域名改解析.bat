@echo off
chcp 65001 >nul
title Step3 - Bind domain and HTTPS
cd /d "%~dp0"

echo ========================================
echo  第 3 步：绑域名 + HTTPS + 改解析
echo ========================================
echo.
echo 【A. 在 OSS 里绑域名】
echo  1. 打开你的香港 Bucket
echo  2. 左侧「传输管理」-「域名管理」（有的界面叫「绑定域名」）
echo  3. 绑定域名：www.yunzhongyouxia.cloud
echo  4. 按提示申请/选用免费证书，开启 HTTPS
echo  5. 记下页面显示的 CNAME 目标
echo     （一般类似：你的桶名.oss-website-cn-hongkong.aliyuncs.com
echo       或以「域名管理」里写的为准）
echo.
echo 【B. 改 DNS 解析】
echo  1. 打开：https://dns.console.aliyun.com/
echo  2. 找到 yunzhongyouxia.cloud
echo  3. 找到主机记录 www 那一条（现在应指向 Vercel）
echo  4. 改成 CNAME，记录值填 OSS 给你的 CNAME 目标
echo  5. 保存，等 1～10 分钟生效
echo.
echo 做完回复我：「解析改好了」
echo 我再帮你验收 https://www.yunzhongyouxia.cloud/
echo.
start "" "https://oss.console.aliyun.com/bucket"
start "" "https://dns.console.aliyun.com/"
echo.
pause
