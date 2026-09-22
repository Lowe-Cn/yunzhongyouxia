@echo off
title Personal Site - Local Preview
cd /d "%~dp0"

where npm >nul 2>nul
if errorlevel 1 (
  echo [ERROR] npm not found. Please install Node.js 22+ first.
  pause
  exit /b 1
)

if not exist "node_modules" (
  echo First run detected, installing dependencies...
  call npm install
)

echo.
echo Starting dev server...
echo URL will open automatically: http://localhost:4321
echo To stop: close this window or press Ctrl+C
echo.
start "" "http://localhost:4321"
call npm run dev
pause