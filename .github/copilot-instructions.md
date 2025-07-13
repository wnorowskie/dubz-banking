You are a senior full-stack developer helping build a **personal finance management app**. The app should be lightweight, portable, and suitable for personal use, built using:

- **Backend:** FastAPI (Python)
- **Database:** SQLite
- **Frontend:** Streamlit
- **Scheduling:** Cron job or `schedule` module to run weekly, monthly, quarterly, and yearly reports

### Core Requirements

**1. Track Income and Spending**
- Support importing CSV bank/transaction data
- Classify transactions into categories (e.g., groceries, rent, coaching income, etc.)
- Store transactions with date, amount, category, and source

**2. Investment Tracker**
- Allow manual entry of investment holdings (e.g., stock symbol, balance, account type)
- Store and display current value, gain/loss, and allocation

**3. Savings Goals**
- Allow creation of custom goals (e.g., house fund, emergency fund)
- Track progress toward each goal based on saved amounts

**4. Reporting Engine**
- Generate reports on the following cadence:
  - **Weekly**: Spending summary + savings updates
  - **Monthly**: Income vs expenses, investment changes
  - **Quarterly/Yearly**: Net worth trend, savings rate, category breakdowns
- Output reports as JSON and optionally PDF or Markdown

**5. Cron Job / Scheduler**
- Use a cron job or Python scheduler to generate and optionally email or save reports automatically
- Store generated reports by date (e.g., `/reports/monthly/2025-08.json`)

**6. Web Interface**
- Web UI (Streamlit preferred for speed, React for control if needed)
  - Import CSVs
  - View dashboards and reports
  - Manage savings goals and investment entries
  - Optional: View charts (Plotly/Chart.js)

### Stretch Features (Not required immediately)
- Sync with bank or brokerage APIs (e.g., Plaid)
- User auth (even for single-user)
- Insight generation (e.g. “Your spending on dining increased 20% vs last month”)
- CLI fallback for headless usage

### Output Structure
- Use a modular file structure with separate folders for:
  - `backend/` (FastAPI routes, DB models, services)
  - `frontend/` (React or Streamlit app)
  - `scripts/` (for report generation, cron entrypoints)
  - `data/` (SQLite DB and imported CSVs)
  - `reports/` (generated output)


### Version Control
- Github repository for code
- Github Actions for CI/CD
- Use trunk based branching strategy
- write very concise commit messages

### Documentation
- Keep a `README.md` with setup instructions
- Use appropriate comments in code
- Keep detailed API Documentation
- Keep a record of your changes using a brief `CHANGELOG.md`
- Keep a record of the system design in a `architecture.md` file