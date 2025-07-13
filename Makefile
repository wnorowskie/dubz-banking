# Dubz Banking Development Makefile
# Common development tasks for the personal finance application

.PHONY: help setup clean test lint format check install install-dev run-backend run-frontend run-scripts

# Default target
help:
	@echo "Dubz Banking Development Commands"
	@echo "================================"
	@echo "Setup commands:"
	@echo "  setup         Set up complete development environment"
	@echo "  install       Install production dependencies"
	@echo "  install-dev   Install development dependencies"
	@echo ""
	@echo "Development commands:"
	@echo "  run-backend   Start the FastAPI backend server"
	@echo "  run-frontend  Start the Streamlit frontend"
	@echo "  run-scripts   Run the report generation scripts"
	@echo ""
	@echo "Code quality commands:"
	@echo "  test          Run all tests"
	@echo "  lint          Run linting (flake8)"
	@echo "  format        Format code (black, isort)"
	@echo "  check         Run all checks (lint + format check)"
	@echo ""
	@echo "Cleanup commands:"
	@echo "  clean         Clean up build artifacts and cache files"

# Setup the complete development environment
setup:
	@echo "Setting up development environment..."
	./setup_dev.sh

# Install production dependencies
install:
	@echo "Installing production dependencies..."
	cd backend && python -m pip install -e ..
	cd frontend && python -m pip install -r requirements.txt
	cd scripts && python -m pip install -r requirements.txt

# Install development dependencies
install-dev:
	@echo "Installing development dependencies..."
	cd backend && python -m pip install -e '..[dev]'
	cd frontend && python -m pip install -r requirements.txt
	cd scripts && python -m pip install -r requirements.txt

# Run the FastAPI backend server
run-backend:
	@echo "Starting FastAPI backend server..."
	cd backend && source venv/bin/activate && python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

# Run the Streamlit frontend
run-frontend:
	@echo "Starting Streamlit frontend..."
	cd frontend && source venv/bin/activate && streamlit run app.py --server.port 8501

# Run report generation scripts
run-scripts:
	@echo "Running report generation..."
	cd scripts && source venv/bin/activate && python report_generator.py

# Run all tests
test:
	@echo "Running tests..."
	cd backend && source venv/bin/activate && python -m pytest tests/ -v --cov=app --cov-report=html --cov-report=term-missing

# Run linting
lint:
	@echo "Running linting..."
	cd backend && source venv/bin/activate && flake8 app/ tests/
	cd scripts && source venv/bin/activate && flake8 *.py

# Format code
format:
	@echo "Formatting code..."
	cd backend && source venv/bin/activate && black app/ tests/
	cd backend && source venv/bin/activate && isort app/ tests/
	cd scripts && source venv/bin/activate && black *.py
	cd scripts && source venv/bin/activate && isort *.py

# Check code quality (lint + format check)
check:
	@echo "Checking code quality..."
	cd backend && source venv/bin/activate && black --check app/ tests/
	cd backend && source venv/bin/activate && isort --check-only app/ tests/
	cd backend && source venv/bin/activate && flake8 app/ tests/
	cd scripts && source venv/bin/activate && black --check *.py
	cd scripts && source venv/bin/activate && isort --check-only *.py
	cd scripts && source venv/bin/activate && flake8 *.py

# Clean up build artifacts and cache files
clean:
	@echo "Cleaning up..."
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".coverage" -delete
	find . -type d -name "htmlcov" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +
	find . -type f -name ".coverage" -delete