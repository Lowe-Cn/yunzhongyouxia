@echo off
chcp 65001 >nul
title Step2 - Create AccessKey
cd /d "%~dp0"

echo ========================================
echo  第 2 步：创建 AccessKey（上传用）
echo ========================================
echo.
echo 1. 我会打开 AccessKey 页面
echo 2. 建议：用「RAM 用户」创建，只开 AliyunOSSFullAccess
echo    小白也可先用主账号 AccessKey（能跑通再改 RAM）
echo 3. 复制 AccessKeyId 和 AccessKeySecret
echo 4. 把项目里的 oss.config.example 复制成 oss.config
echo 5. 用记事本打开 oss.config，填入：
echo      bucket=你的桶名
echo      accessKeyId=...
echo      accessKeySecret=...
echo    endpoint 保持 oss-cn-hongkong.aliyuncs.com 不动
echo 6. 双击运行「上传到OSS.bat」
echo.
echo 做完回复我：「上传好了」或把报错原文贴过来
echo.
start "" "https://ram.console.aliyun.com/manage/ak"
echo.
pause
