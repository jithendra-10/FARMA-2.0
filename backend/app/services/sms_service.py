import os
from twilio.rest import Client
from dotenv import load_dotenv

load_dotenv()

account_sid = os.getenv("TWILIO_ACCOUNT_SID")
auth_token = os.getenv("TWILIO_AUTH_TOKEN")
twilio_number = os.getenv("TWILIO_PHONE_NUMBER")

client = Client(account_sid, auth_token)

def send_otp(phone_number: str, otp: str):
    """
    Sends an OTP to the specified phone number using Twilio.
    """
    try:
        message = client.messages.create(
            body=f"Your Farm Advisory App Verification Code is: {otp}",
            from_=twilio_number,
            to=phone_number
        )
        print(f"OTP sent to {phone_number}: SID {message.sid}")
        return True
    except Exception as e:
        print(f"Failed to send OTP: {str(e)}")
        # For Hackathon/Dev purposes, print the OTP so we can proceed even if SMS fails
        print(f"DEV MODE: OTP for {phone_number} is {otp}")
        return False
