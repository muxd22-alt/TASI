@echo off
REM TASI Alpha Cell - Setup Script (Windows)
REM This script helps you set up the dashboard for local development

echo ==============================================
echo   TASI Alpha Cell - Setup
echo ==============================================
echo.

REM Check Python version
echo Checking Python version...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://python.org
    exit /b 1
)
echo ✓ Python detected
echo.

REM Create virtual environment
echo Creating virtual environment...
if not exist "venv" (
    python -m venv venv
    echo ✓ Virtual environment created
) else (
    echo ✓ Virtual environment already exists
)
echo.

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo Installing dependencies...
python -m pip install --upgrade pip
pip install -r requirements.txt
echo ✓ Dependencies installed
echo.

REM Create .env file if it doesn't exist
if not exist ".env" (
    echo Creating .env template...
    (
        echo # NewsAPI Key ^(optional - get free key at https://newsapi.org/register^)
        echo NEWSAPI_KEY=your_api_key_here
        echo.
        echo # Optional: Set to 'true' to enable debug logging
        echo DEBUG=false
    ) > .env
    echo ✓ .env template created ^(please add your NEWSAPI_KEY^)
) else (
    echo ✓ .env already exists
)
echo.

REM Copy sample data for testing
if not exist "docs\data.json" (
    echo Copying sample data for testing...
    copy docs\data.sample.json docs\data.json
    echo ✓ Sample data copied to docs\data.json
) else (
    echo ✓ data.json already exists
)
echo.

REM Summary
echo ==============================================
echo   Setup Complete!
echo ==============================================
echo.
echo Next steps:
echo   1. ^(Optional^) Add your NEWSAPI_KEY to .env
echo      Get a free key at: https://newsapi.org/register
echo.
echo   2. Run the data fetcher:
echo      venv\Scripts\activate
echo      python scripts\fetch_data.py
echo.
echo   3. View the dashboard:
echo      - Open docs\index.html in your browser
echo      - Or run: python -m http.server 8000 --directory docs
echo      - Then visit: http://localhost:8000
echo.
echo ==============================================

pause
