#!/bin/bash

# Dubz Banking Development Environment Setup Script
# This script sets up the complete development environment for the personal finance app

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_status "🏦 Setting up Dubz Banking Development Environment..."

# Check if Python 3.11+ is available
print_status "Checking Python version..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    REQUIRED_VERSION="3.11"
    
    if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" = "$REQUIRED_VERSION" ]; then
        print_success "Python $PYTHON_VERSION found ✓"
    else
        print_error "Python 3.11+ required, found $PYTHON_VERSION"
        exit 1
    fi
else
    print_error "Python3 not found. Please install Python 3.11+"
    exit 1
fi

# Create virtual environment for backend
print_status "Setting up backend virtual environment..."
cd backend
if [ ! -d "venv" ]; then
    python3 -m venv venv
    print_success "Backend virtual environment created"
else
    print_warning "Backend virtual environment already exists"
fi

# Activate backend virtual environment and install dependencies
print_status "Installing backend dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -e ../.[dev]  # Install project with dev dependencies
deactivate

print_success "Backend dependencies installed ✓"
cd ..

# Create virtual environment for frontend
print_status "Setting up frontend virtual environment..."
cd frontend
if [ ! -d "venv" ]; then
    python3 -m venv venv
    print_success "Frontend virtual environment created"
else
    print_warning "Frontend virtual environment already exists"
fi

# Activate frontend virtual environment and install dependencies
print_status "Installing frontend dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate

print_success "Frontend dependencies installed ✓"
cd ..

# Create virtual environment for scripts
print_status "Setting up scripts virtual environment..."
cd scripts
if [ ! -d "venv" ]; then
    python3 -m venv venv
    print_success "Scripts virtual environment created"
else
    print_warning "Scripts virtual environment already exists"
fi

# Activate scripts virtual environment and install dependencies
print_status "Installing scripts dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate

print_success "Scripts dependencies installed ✓"
cd ..

# Create .env file from template if it doesn't exist
print_status "Setting up environment configuration..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    print_success "Environment file created from template"
    print_warning "Please review and update .env file with your configuration"
else
    print_warning ".env file already exists"
fi

# Install pre-commit hooks if pre-commit is available
print_status "Setting up pre-commit hooks..."
cd backend
source venv/bin/activate
if command -v pre-commit &> /dev/null; then
    if [ -f "../.pre-commit-config.yaml" ]; then
        pre-commit install
        print_success "Pre-commit hooks installed ✓"
    else
        print_warning "Pre-commit config not found, skipping hook installation"
    fi
else
    print_warning "Pre-commit not installed, skipping hook setup"
fi
deactivate
cd ..

# Create data directories if they don't exist
print_status "Setting up data directories..."
mkdir -p data/imports
mkdir -p reports/{weekly,monthly,quarterly,yearly}
print_success "Data directories ready ✓"

# Test the setup
print_status "Testing development environment setup..."

# Test backend
cd backend
source venv/bin/activate
if python -c "import fastapi, sqlalchemy, uvicorn" 2>/dev/null; then
    print_success "Backend dependencies test passed ✓"
else
    print_error "Backend dependencies test failed"
fi
deactivate
cd ..

# Test frontend
cd frontend
source venv/bin/activate
if python -c "import streamlit, plotly, pandas" 2>/dev/null; then
    print_success "Frontend dependencies test passed ✓"
else
    print_error "Frontend dependencies test failed"
fi
deactivate
cd ..

# Test scripts
cd scripts
source venv/bin/activate
if python -c "import schedule" 2>/dev/null; then
    print_success "Scripts dependencies test passed ✓"
else
    print_error "Scripts dependencies test failed"
fi
deactivate
cd ..

echo ""
print_success "🎉 Development environment setup complete!"
echo ""
print_status "Next steps:"
echo "  1. Review and update .env file with your configuration"
echo "  2. Start the backend: cd backend && source venv/bin/activate && python -m uvicorn app.main:app --reload"
echo "  3. Start the frontend: cd frontend && source venv/bin/activate && streamlit run app.py"
echo "  4. Run tests: cd backend && source venv/bin/activate && pytest"
echo ""
print_status "Happy coding! 🚀"