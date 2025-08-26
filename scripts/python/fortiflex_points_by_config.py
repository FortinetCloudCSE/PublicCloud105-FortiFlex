"""
    FortiFlex API
    John McDonough (@movinalot)
    Edited by Jeff Kopko (@skiboyjcmu)
    Fortinet

    Scanned by FortiDevSec
"""

# pylint: disable=too-many-arguments, line-too-long

import json
import os
import sys
import logging
import requests
import getpass
from datetime import datetime

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

# FortiCloud and FortiFlex API Endpoints
FORTIFLEX_API_BASE_URI = "https://support.fortinet.com/ES/api/fortiflex/v2/"
FORTICARE_AUTH_URI = "https://customerapiauth.fortinet.com/api/v1/oauth/token/"

COMMON_HEADERS = {"Content-type": "application/json", "Accept": "application/json"}


def requests_post(resource_url, json_body, headers):
    """Requests Post"""

    logging.debug(resource_url)
    logging.debug(json_body)
    logging.debug(headers)

    try:
        result = requests.post(
            resource_url, json=json_body, headers=headers, timeout=20
        )
    except requests.exceptions.RequestException as error:
        raise SystemExit(error) from error
    if result.ok:
        return_value = json.loads(result.content)
    else:
        logging.debug(result)
        logging.debug(result.content)
        return_value = None
    return return_value


def get_token(username, password, client_id, grant_type):
    """Get Authentication Token"""

    # logging.debug(username, password, client_id, grant_type)
    logging.debug("--> Retieving FortiFlex API Token...")

    body = {
        "username": username,
        "password": password,
        "client_id": client_id,
        "grant_type": grant_type,
    }

    results = requests_post(FORTICARE_AUTH_URI, body, COMMON_HEADERS)
    return results


def programs_list(access_token):
    """Retrieve FortiFlex Programs List - V2"""

    logging.debug(access_token)
    logging.debug("--> Retrieving FortiFlex Programs...")

    uri = FORTIFLEX_API_BASE_URI + "programs/list"
    headers = COMMON_HEADERS.copy()
    headers["Authorization"] = f"Bearer {access_token}"

    body = {}

    results = requests_post(uri, body, headers)
    return results


def configs_list(access_token, program_serial_number, account_id=None):
    """List FortiFlex Configurations - V2"""
    logging.debug("--> List FortiFlex Configurations...")

    uri = FORTIFLEX_API_BASE_URI + "configs/list"
    headers = COMMON_HEADERS.copy()
    headers["Authorization"] = f"Bearer {access_token}"

    body = {
        "programSerialNumber": program_serial_number,
    }

    # accountId is optional
    if account_id:
        body["accountId"] = account_id

    results = requests_post(uri, body, headers)
    return results


def entitlements_points(
    access_token,
    program_serial_number,
    start_date,
    end_date,
    config_id=None,
    serial_number=None,
    account_id=None,
):
    """Get FortiFlex Entitlements Points - V2"""
    logging.debug("--> Get FortiFlex Entitlements Points...")

    uri = FORTIFLEX_API_BASE_URI + "entitlements/points"
    headers = COMMON_HEADERS.copy()
    headers["Authorization"] = f"Bearer {access_token}"

    body = {
        "programSerialNumber": program_serial_number,
        "startDate": start_date,
        "endDate": end_date,
    }

    # config_id alone will retrieve all entitlement point consumption for the config
    # config_id and serial_number will retrieve that entitlement's point consumption
    # account_id and config_id is the same as just config_id
    # account_id alone will retrieve all entitlement point consumption for the account

    if config_id:
        body["configId"] = config_id

    if serial_number:
        body["serialNumber"] = serial_number

    if account_id:
        body["accountId"] = account_id

    results = requests_post(uri, body, headers)
    return results




def _prompt_date(label: str, initial: str | None = None) -> str:
    """Prompt for a date in YYYY-MM-DD and validate format."""
    while True:
        prompt = f"{label} (YYYY-MM-DD)" + (f" [{initial}]" if initial else "") + ": "
        value = input(prompt).strip()
        if not value and initial:
            value = initial
        try:
            datetime.strptime(value, "%Y-%m-%d")
            return value
        except ValueError:
            print("Invalid date format. Please use YYYY-MM-DD.")


def _prompt_nonempty(label: str, secret: bool = False) -> str:
    """Prompt until a non-empty value is provided. Supports secret input."""
    while True:
        if secret:
            value = getpass.getpass(f"{label}: ").strip()
        else:
            value = input(f"{label}: ").strip()
        if value:
            return value
        print("This field cannot be empty. Please try again.")


def _print_menu():
    """Display the interactive menu."""
    print("\n==============================")
    print("Title: Retrieve FortiFlex Point")
    print("==============================")
    print("1) Calculate point consumption for a single config")
    print("2) Calculate an Entitlement's Point Consumption")
    print("3) Calculate the Point Consumption for an entire Account")
    print("4) Change Date range")
    print("5) Exit")


if __name__ == "__main__":
    # Initial input collection
    print("==============================")
    print("Title: Retrieve FortiFlex Point")
    print("==============================\n")

    # Allow env defaults but prompt user
    default_user = os.getenv("FORTIFLEX_ACCESS_USERNAME", "")
    default_pass = os.getenv("FORTIFLEX_ACCESS_PASSWORD", "")
    default_client_id = os.getenv("API_CLIENT_ID", "flexvm")
    default_grant_type = os.getenv("API_GRANT_TYPE", "password")

    username = input(f"1. FortiFlex API Username{f' [{default_user}]' if default_user else ''}: ").strip() or default_user
    while not username:
        username = _prompt_nonempty("1. FortiFlex API Username")

    # Always read password securely; do not echo. If env var exists, offer to use it.
    if default_pass:
        use_env = (input("Use password from environment? [y/N]: ").strip().lower() == "y")
    else:
        use_env = False
    password = default_pass if use_env else _prompt_nonempty("2. FortiFlex API Password", secret=True)

    start_date = _prompt_date("3. Starting Date Range")
    end_date = _prompt_date("4. Ending Date Range")
    program_serial_number = _prompt_nonempty("5. FortiFlex Program Serial Number")

    # Get token once
    api_token = get_token(username, password, default_client_id, default_grant_type)
    if not api_token or "access_token" not in api_token:
        sys.exit("Error: could not retrieve API access token. Check your credentials and network connectivity.")
    api_access_token = api_token["access_token"]
    logging.debug("Obtained access token for FortiFlex API")

    # Menu loop
    while True:
        _print_menu()
        choice = input("Choose an option [1-5]: ").strip()

        # Shared kwargs
        kwargs = {
            "access_token": api_access_token,
            "program_serial_number": program_serial_number,
            "start_date": start_date,
            "end_date": end_date,
        }

        if choice == "1":
            # Single config
            cfg = _prompt_nonempty("Enter ConfigId")
            # attempt to coerce to int when appropriate; API accepts either
            try:
                cfg_val = int(cfg)
            except ValueError:
                cfg_val = cfg
            resp = entitlements_points(**kwargs, config_id=cfg_val)
        elif choice == "2":
            # Entitlement (Config + Serial)
            cfg = _prompt_nonempty("Enter ConfigId")
            try:
                cfg_val = int(cfg)
            except ValueError:
                cfg_val = cfg
            serial = _prompt_nonempty("Enter Serial_Number")
            resp = entitlements_points(**kwargs, config_id=cfg_val, serial_number=serial)
        elif choice == "3":
            # Entire Account
            account = _prompt_nonempty("Enter Account_ID")
            try:
                acct_val = int(account)
            except ValueError:
                acct_val = account
            resp = entitlements_points(**kwargs, account_id=acct_val)
        elif choice == "4":
            # Change date range
            start_date = _prompt_date("Starting Date Range", initial=start_date)
            end_date = _prompt_date("Ending Date Range", initial=end_date)
            print("Date range updated.")
            continue
        elif choice == "5":
            print("Exiting. Goodbye!")
            break
        else:
            print("Invalid choice. Please enter a number between 1 and 5.")
            continue

        if resp is None:
            print("\nRequest failed or returned no data. Check inputs and try again.\n")
        else:
            print("\n===== API Response =====")
            print(json.dumps(resp, indent=2))
            print("========================\n")
