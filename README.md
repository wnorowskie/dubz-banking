# Dubz Banking

Personal finance management application built with FastAPI and Streamlit.

## Features

- **Transaction Management**: Import and categorize bank transactions from CSV files
- **Investment Tracking**: Manual entry and tracking of investment holdings
- **Savings Goals**: Create and track progress toward financial goals
- **Automated Reporting**: Weekly, monthly, quarterly, and yearly financial reports
- **Web Interface**: Clean, intuitive Streamlit-based UI

## Quick Start

### Prerequisites

- Python 3.11 or higher
- pip package manager

### Automated Setup (Recommended)

1. Clone the repository:
```bash
git clone https://github.com/wnorowskie/dubz-banking.git
cd dubz-banking
```

2. Run the setup script:
```bash
./setup_dev.sh
```

This will automatically:
- Create virtual environments for backend, frontend, and scripts
- Install all dependencies
- Set up environment configuration
- Configure pre-commit hooks
- Test the installation

### Manual Setup

If you prefer manual setup or the script doesn't work on your system:

1. Set up the backend:
```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -e '..[dev]'  # Install with development dependencies
```

2. Set up the frontend:
```bash
cd ../frontend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Set up the scripts:
```bash
cd ../scripts
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

4. Create environment file:
```bash
cd ..
cp .env.example .env
# Edit .env file with your configuration
```

### Running the Application

1. Start the backend API:
```bash
cd backend
python -m uvicorn app.main:app --reload
```

2. Start the frontend (in a new terminal):
```bash
cd frontend
streamlit run app.py
```

3. Open your browser and navigate to `http://localhost:8501`

## Development

### Common Development Tasks

We provide several ways to run common development tasks:

#### Using Make (Recommended)
```bash
make help          # Show all available commands
make setup         # Set up development environment
make run-backend   # Start the FastAPI backend
make run-frontend  # Start the Streamlit frontend
make test          # Run all tests
make lint          # Run code linting
make format        # Format code with black and isort
make clean         # Clean up build artifacts
```

#### Manual Commands
```bash
# Start backend
cd backend && source venv/bin/activate && uvicorn app.main:app --reload

# Start frontend  
cd frontend && source venv/bin/activate && streamlit run app.py

# Run tests
cd backend && source venv/bin/activate && pytest

# Format code
cd backend && source venv/bin/activate && black app/ tests/
```

### Development Environment

- **Code Formatting**: Black (88 character line length)
- **Linting**: Flake8 with isort for import sorting
- **Type Checking**: MyPy (optional)
- **Testing**: Pytest with coverage reporting
- **Pre-commit Hooks**: Automated code quality checks

### Virtual Environments

Each component has its own virtual environment:
- `backend/venv/` - FastAPI backend dependencies
- `frontend/venv/` - Streamlit frontend dependencies  
- `scripts/venv/` - Report generation dependencies

### Project Structure

```
dubz-banking/
├── backend/              # FastAPI backend
│   ├── app/
│   │   ├── models/      # Database models
│   │   ├── routes/      # API endpoints
│   │   ├── services/    # Business logic
│   │   └── main.py      # FastAPI app
│   ├── tests/           # Backend tests
│   └── venv/            # Backend virtual environment
├── frontend/            # Streamlit frontend
│   ├── pages/          # Multi-page app pages
│   ├── components/     # Reusable UI components
│   ├── app.py          # Main Streamlit app
│   ├── requirements.txt
│   └── venv/           # Frontend virtual environment
├── scripts/            # Report generation scripts
│   ├── report_generator.py
│   ├── scheduler.py
│   ├── requirements.txt
│   └── venv/           # Scripts virtual environment
├── data/               # Database and CSV imports
├── reports/            # Generated reports
├── tests/             # Integration tests
├── setup_dev.sh       # Development setup script
├── Makefile           # Development task runner
├── pyproject.toml     # Project configuration
└── .pre-commit-config.yaml  # Pre-commit hooks
```

### Testing

Run the test suite:
```bash
make test
# OR manually:
cd backend && source venv/bin/activate && pytest
```

### Contributing

1. Create a feature branch following the pattern: `epic#/feature#/description`
2. Make your changes
3. Run code quality checks: `make check`
4. Run tests to ensure everything works: `make test`
5. Submit a pull request

### Environment Variables

Copy `.env.example` to `.env` and configure:
```bash
cp .env.example .env
```

Key variables:
- `DATABASE_URL`: SQLite database path
- `API_BASE_URL`: Backend API URL for frontend
- `DEBUG`: Enable debug mode

## API Documentation

Once the backend is running, visit `http://localhost:8000/docs` for interactive API documentation.

## License

This project is for personal use.