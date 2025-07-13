"""
Scheduler for automated report generation.
Can be run as a cron job or using the schedule module.
"""
import schedule
import time
import logging
from datetime import datetime
from report_generator import (
    generate_weekly_report,
    generate_monthly_report,
    generate_quarterly_report,
    generate_yearly_report,
    save_report
)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('scheduler.log'),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)


def run_weekly_report():
    """Run weekly report generation."""
    logger.info("Starting weekly report generation...")
    try:
        report = generate_weekly_report()
        filepath = save_report(report, "weekly")
        logger.info(f"Weekly report generated successfully: {filepath}")
    except Exception as e:
        logger.error(f"Error generating weekly report: {str(e)}")


def run_monthly_report():
    """Run monthly report generation."""
    logger.info("Starting monthly report generation...")
    try:
        report = generate_monthly_report()
        filepath = save_report(report, "monthly")
        logger.info(f"Monthly report generated successfully: {filepath}")
    except Exception as e:
        logger.error(f"Error generating monthly report: {str(e)}")


def run_quarterly_report():
    """Run quarterly report generation."""
    logger.info("Starting quarterly report generation...")
    try:
        report = generate_quarterly_report()
        filepath = save_report(report, "quarterly")
        logger.info(f"Quarterly report generated successfully: {filepath}")
    except Exception as e:
        logger.error(f"Error generating quarterly report: {str(e)}")


def run_yearly_report():
    """Run yearly report generation."""
    logger.info("Starting yearly report generation...")
    try:
        report = generate_yearly_report()
        filepath = save_report(report, "yearly")
        logger.info(f"Yearly report generated successfully: {filepath}")
    except Exception as e:
        logger.error(f"Error generating yearly report: {str(e)}")


def setup_schedule():
    """Set up the report generation schedule."""
    # Schedule weekly reports (every Sunday at 9 AM)
    schedule.every().sunday.at("09:00").do(run_weekly_report)
    
    # Schedule monthly reports (1st of each month at 9 AM)
    schedule.every().month.at("09:00").do(run_monthly_report)
    
    # Schedule quarterly reports (1st of January, April, July, October at 9 AM)
    # Note: This is a simplified implementation
    schedule.every().day.at("09:00").do(run_quarterly_report)
    
    # Schedule yearly reports (January 1st at 9 AM)
    schedule.every().year.at("09:00").do(run_yearly_report)
    
    logger.info("Report generation schedule configured")


if __name__ == "__main__":
    setup_schedule()
    
    logger.info("Report scheduler started. Press Ctrl+C to stop.")
    
    try:
        while True:
            schedule.run_pending()
            time.sleep(60)  # Check every minute
    except KeyboardInterrupt:
        logger.info("Scheduler stopped by user")
    except Exception as e:
        logger.error(f"Scheduler error: {str(e)}")