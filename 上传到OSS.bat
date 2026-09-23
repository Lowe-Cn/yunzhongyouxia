@echo off
chcp 65001 >nul
title Deploy to Aliyun OSS (Hong Kong)
cd /d "%~dp0"

set "OSSUTIL=%~dp0tools\ossutil\ossutil64.exe"
set "CONFIG=%~dp0oss.config"

if not exist "%OSSUTIL%" (
  echo [ERROR] Missing tools\ossutil\ossutil64.exe
  echo Re-download from: https://help.aliyun.com/zh/oss/developer-reference/install-ossutil
  pause
  exit /b 1
)

if not exist "%CONFIG%" (
  echo [ERROR] oss.config not found.
  echo 1. Copy oss.config.example to oss.config
  echo 2. Fill bucket / accessKeyId / accessKeySecret
  echo 3. Run this bat again
  pause
  exit /b 1
)

where npm >nul 2>nul
if errorlevel 1 (
  echo [ERROR] npm not found. Install Node.js 22+ first.
  pause
  exit /b 1
)

echo.
echo [1/2] Building site...
call npm run build
if errorlevel 1 (
  echo [ERROR] Build failed.
  pause
  exit /b 1
)

echo.
echo [2/2] Uploading dist\ to OSS...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\deploy-oss.ps1"
if errorlevel 1 (
  echo [ERROR] Upload failed.
  pause
  exit /b 1
)

echo.
echo Done. After DNS points to OSS, open https://www.yunzhongyouxia.cloud/
pause
