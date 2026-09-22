@echo off
title Stop Personal Site
echo Stopping processes on port 4321...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":4321" ^| findstr "LISTENING"') do (
  echo Stopping PID %%a
  taskkill /F /PID %%a >nul 2>nul
)
echo.
echo Done. If still running inside Cursor, press Ctrl+C there.
pause
