"""
Streamlit frontend for Dubz Banking personal finance app.
"""
import streamlit as st
import requests
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration
API_BASE_URL = os.getenv("API_BASE_URL", "http://localhost:8000")

# Page configuration
st.set_page_config(
    page_title="Dubz Banking",
    page_icon="💰",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Main app
def main():
    st.title("💰 Dubz Banking")
    st.markdown("Personal Finance Management")
    
    # Sidebar navigation
    st.sidebar.title("Navigation")
    page = st.sidebar.selectbox(
        "Choose a page",
        ["Dashboard", "Transactions", "Investments", "Savings Goals", "Reports"]
    )
    
    # Test API connection
    try:
        response = requests.get(f"{API_BASE_URL}/health", timeout=5)
        if response.status_code == 200:
            st.sidebar.success("✅ API Connected")
        else:
            st.sidebar.error("❌ API Error")
    except Exception as e:
        st.sidebar.error(f"❌ API Disconnected: {str(e)}")
    
    # Page content
    if page == "Dashboard":
        st.header("Dashboard")
        st.info("Dashboard coming soon...")
        
    elif page == "Transactions":
        st.header("Transactions")
        st.info("Transaction management coming soon...")
        
    elif page == "Investments":
        st.header("Investments")
        st.info("Investment tracking coming soon...")
        
    elif page == "Savings Goals":
        st.header("Savings Goals")
        st.info("Savings goals coming soon...")
        
    elif page == "Reports":
        st.header("Reports")
        st.info("Reporting coming soon...")


if __name__ == "__main__":
    main()