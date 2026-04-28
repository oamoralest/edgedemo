@echo off
setlocal

set PORT=%1
if "%PORT%"=="" set PORT=8000
set ROOT_DIR=%~dp0

if not exist "%ROOT_DIR%index.html" (
  echo Could not find index.html in: %ROOT_DIR%
  exit /b 1
)

echo Starting Edge AI demo from: %ROOT_DIR%
echo Local URL: http://localhost:%PORT%
echo Press Ctrl+C to stop.

start "" "http://localhost:%PORT%"

where py >nul 2>nul
if %ERRORLEVEL%==0 (
  cd /d "%ROOT_DIR%"
  py -3 -m http.server %PORT%
  exit /b %ERRORLEVEL%
)

where python >nul 2>nul
if %ERRORLEVEL%==0 (
  cd /d "%ROOT_DIR%"
  python -m http.server %PORT%
  exit /b %ERRORLEVEL%
)

echo Python not found. Please install Python 3.
exit /b 1
