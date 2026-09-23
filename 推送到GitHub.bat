@echo off
chcp 65001 >nul
title Push to GitHub (publish)
cd /d "%~dp0"

echo ========================================
echo  This pushes website code to GitHub.
echo  Use when you are ready to publish / sync
echo  the live site content (not every day).
echo ========================================
echo.
echo Pushing master -> github ...
git push github master
if errorlevel 1 (
  echo.
  echo [ERROR] Push failed. Check network / login.
  echo Tip: GitHub may be slow; retry later.
  pause
  exit /b 1
)

echo.
echo Done. GitHub is updated.
echo Reminder: actual China hosting upload is still 上传到OSS.bat
pause
