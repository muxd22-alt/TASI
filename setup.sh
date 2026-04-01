#!/bin/bash
# TASI Alpha Cell - Setup Script
# This script helps you set up the dashboard for local development

set -e

echo "=============================================="
echo "  TASI Alpha Cell - Setup"
echo "=============================================="
echo ""

# Check Python version
echo "Checking Python version..."
python_version=$(python3 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2)
required_version="3.8"

if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "❌ Python 3.8+ required, found: $python_version"
    exit 1
fi
echo "✓ Python $python_version detected"
echo ""

# Create virtual environment
echo "Creating virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi
echo ""

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt
echo "✓ Dependencies installed"
echo ""

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "Creating .env template..."
    cat > .env << EOF
# NewsAPI Key (optional - get free key at https://newsapi.org/register)
NEWSAPI_KEY=your_api_key_here

# Optional: Set to 'true' to enable debug logging
DEBUG=false
EOF
    echo "✓ .env template created (please add your NEWSAPI_KEY)"
else
    echo "✓ .env already exists"
fi
echo ""

# Copy sample data for testing
if [ ! -f "docs/data.json" ]; then
    echo "Copying sample data for testing..."
    cp docs/data.sample.json docs/data.json
    echo "✓ Sample data copied to docs/data.json"
else
    echo "✓ data.json already exists"
fi
echo ""

# Summary
echo "=============================================="
echo "  Setup Complete!"
echo "=============================================="
echo ""
echo "Next steps:"
echo "  1. (Optional) Add your NEWSAPI_KEY to .env"
echo "     Get a free key at: https://newsapi.org/register"
echo ""
echo "  2. Run the data fetcher:"
echo "     source venv/bin/activate"
echo "     python scripts/fetch_data.py"
echo ""
echo "  3. View the dashboard:"
echo "     - Open docs/index.html in your browser"
echo "     - Or run: python -m http.server 8000 -d docs"
echo "     - Then visit: http://localhost:8000"
echo ""
echo "=============================================="
