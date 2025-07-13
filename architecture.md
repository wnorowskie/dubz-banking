# Dubz Banking Architecture

## Overview

Dubz Banking is a personal finance management application built with a modern, lightweight architecture designed for local deployment and personal use.

## Architecture Components

### Backend (FastAPI)
- **Framework**: FastAPI with Python 3.11+
- **Database**: SQLite for simplicity and portability
- **ORM**: SQLAlchemy for database operations
- **API Documentation**: Automatic OpenAPI/Swagger documentation
- **Authentication**: Future implementation (not in MVP)

### Frontend (Streamlit)
- **Framework**: Streamlit for rapid UI development
- **Visualization**: Plotly for charts and graphs
- **Data Processing**: Pandas for data manipulation
- **State Management**: Streamlit's built-in session state

### Database Design
- **SQLite**: Single file database for portability
- **Tables**: 
  - transactions (financial transactions)
  - categories (transaction categories)
  - accounts (bank accounts/sources)
  - investments (investment holdings)
  - savings_goals (financial goals)
  - reports (report metadata)

### Reporting System
- **Report Generator**: Python scripts for automated report generation
- **Scheduler**: Cron-based or Python schedule module
- **Output Formats**: JSON (primary), with future PDF/Markdown support
- **Storage**: File-based storage in reports/ directory

## Data Flow

1. **Transaction Import**: CSV files uploaded through Streamlit UI
2. **Data Processing**: FastAPI backend processes and stores transactions
3. **Categorization**: Automatic or manual transaction categorization
4. **Report Generation**: Scheduled scripts generate periodic reports
5. **Visualization**: Streamlit frontend displays data and reports

## Security Considerations

- **Local Deployment**: App runs locally for security
- **Data Storage**: All data stored locally in SQLite
- **Environment Variables**: Sensitive configuration via .env files
- **CORS**: Configured for local frontend-backend communication

## Deployment

### Local Development
- Backend: `uvicorn app.main:app --reload`
- Frontend: `streamlit run app.py`
- Database: SQLite file in data/ directory

### Production (Future)
- Docker containerization
- Nginx reverse proxy
- Automated backups
- Environment-specific configurations

## Technology Stack

### Backend
- **FastAPI**: Modern, fast web framework
- **SQLAlchemy**: SQL toolkit and ORM
- **Alembic**: Database migrations
- **Pydantic**: Data validation
- **pytest**: Testing framework

### Frontend
- **Streamlit**: Rapid web app development
- **Plotly**: Interactive visualizations
- **Pandas**: Data manipulation
- **Requests**: API communication

### Development Tools
- **Black**: Code formatting
- **Flake8**: Code linting
- **pytest**: Testing
- **GitHub Actions**: CI/CD pipeline

## Future Enhancements

- **Authentication**: User login system
- **API Integration**: Bank/brokerage API connections
- **Mobile App**: React Native mobile interface
- **Cloud Deployment**: AWS/GCP deployment options
- **Advanced Analytics**: ML-based insights and predictions

## Development Workflow

1. **Feature Development**: Branch per feature/epic
2. **Testing**: Comprehensive unit and integration tests
3. **Code Review**: Pull request review process
4. **Documentation**: Inline comments and architectural docs
5. **Deployment**: Automated CI/CD pipeline

This architecture provides a solid foundation for a personal finance application while maintaining simplicity and extensibility for future enhancements.