@echo off
chcp 65001 >nul
title Push to Gitee (daily)
cd /d "%~dp0"

echo Pushing master -> origin (Gitee)...
git push origin master
if errorlevel 1 (
  echo.
  echo [ERROR] Push failed. Check network / login.
  pause
  exit /b 1
)

echo.
echo Done. Daily code is on Gitee.
pause
