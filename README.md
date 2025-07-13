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

### Installation

1. Clone the repository:
```bash
git clone https://github.com/wnorowskie/dubz-banking.git
cd dubz-banking
```

2. Set up the backend:
```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Set up the frontend:
```bash
cd ../frontend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
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
│   └── requirements.txt
├── frontend/            # Streamlit frontend
│   ├── pages/          # Multi-page app pages
│   ├── components/     # Reusable UI components
│   ├── app.py          # Main Streamlit app
│   └── requirements.txt
├── scripts/            # Report generation scripts
├── data/               # Database and CSV imports
├── reports/            # Generated reports
└── tests/             # Integration tests
```

### Testing

Run the test suite:
```bash
cd backend
pytest
```

### Contributing

1. Create a feature branch following the pattern: `epic#/feature#/description`
2. Make your changes
3. Run tests to ensure everything works
4. Submit a pull request

## API Documentation

Once the backend is running, visit `http://localhost:8000/docs` for interactive API documentation.

## License

This project is for personal use.