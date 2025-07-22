# Integrity Pay Project

## Overview
Integrity Pay is a banking application comprising a frontend built with Flutter and a backend powered by Node.js. It provides secure banking operations, seamless user interactions, and integrations for SMS and email notifications.

---

## Table of Contents
1. [Features](#features)
2. [Setup Instructions](#setup-instructions)
   - [Frontend (Flutter)](#frontend-setup)
   - [Backend (Node.js)](#backend-setup)
3. [Environment Variables](#environment-variables)
4. [API Integrations](#api-integrations)
5. [Dependencies](#dependencies)
6. [Additional Notes](#additional-notes)

---

## Features
### Frontend
- User-friendly interface for banking operations.
- Cross-platform compatibility for Android and iOS.
- Secure authentication and transaction management.

### Backend
- Secure API endpoints for user and transaction management.
- SMS and email notification integration.
- Scalable architecture using Node.js and PostgreSQL.

---

## Setup Instructions

### Frontend Setup
1. **Requirements**:
   - Flutter SDK: [Download Flutter](https://flutter.dev)
   - Dart SDK (Included with Flutter)
   - IDE: VS Code or Android Studio

2. **Setup**:
   - Clone the repository:
     ```bash
     git clone [repository_url]
     ```
   - Navigate to the frontend directory:
     ```bash
     cd integrity-pay-frontend
     ```
   - Install dependencies:
     ```bash
     flutter pub get
     ```
   - Create an `.env` file in the `assets` folder with:
     ```plaintext
     API_URL=https://integrity-main-server-api.onrender.com
     ```
   - Run the application:
     ```bash
     flutter run
     ```

### Backend Setup
1. **Requirements**:
   - Node.js: [Download Node.js](https://nodejs.org)
   - npm (Node Package Manager)
   - PostgreSQL: [Setup PostgreSQL](https://www.postgresql.org)

2. **Setup**:
   - Clone the repository:
     ```bash
     git clone [repository_url]
     ```
   - Navigate to the backend directory:
     ```bash
     cd integrity-pay-backend
     ```
   - Install dependencies:
     ```bash
     npm install
     ```
   - Create a `.env` file in the root directory with:
     ```plaintext
     DB_HOST=aws-0-us-east-2.pooler.supabase.com
     DB_PORT=5432
     DB_NAME=postgres
     DB_USER=postgres.hbwsqxrhotggzeauuqyv
     DB_PASSWORD=IntegrityDB!@.>.
     JWT_SECRET=G$D8jx7T!G2vA@qY8xZ4p!3sU3rE1w2
     OTP_EXPIRY_MINUTES=10
     MAILGUN_API_KEY=7cc9f77d23adffb52ac69ae92540dfa9-6df690bb-f4d32142
     MAILGUN_DOMAIN=sandbox3b2673b97d264e0f9652b83c4873b0cd.mailgun.org
     POSTMARK_API_KEY=2015e678-0cf2-468a-875c-714eb49889b2
     ```
   - Start the server:
     ```bash
     npm start
     ```



## Environment Variables

### Backend

`DB_HOST=aws-0-us-east-2.pooler.supabase.com`
`DB_PORT=5432`
`DB_NAME=postgres`
`DB_USER=postgres.hbwsqxrhotggzeauuqyv`
`DB_PASSWORD=IntegrityDB!@.>.`
`JWT_SECRET=G$D8jx7T!G2vA@qY8xZ4p!3sU3rE1w2`
`OTP_EXPIRY_MINUTES=10`
`MAILGUN_API_KEY=7cc9f77d23adffb52ac69ae92540dfa9-6df690bb-f4d32142`
`MAILGUN_DOMAIN=sandbox3b2673b97d264e0f9652b83c4873b0cd.mailgun.org`
`POSTMARK_API_KEY=2015e678-0cf2-468a-875c-714eb49889b2`


### Frontend
`API_URL=https://integrity-main-server-api.onrender.com`



API Integrations
Twilio
Usage: SMS notifications.
Login Credentials:
Email: tech@integritypay.com.ng
Use the "Forgot Password" feature to reset the password.
Postmark
Usage: Email notifications.
API Key: 2015e678-0cf2-468a-875c-714eb49889b2.
Mailgun
Usage: Email notifications.
Credentials:
MAILGUN_API_KEY: 7cc9f77d23adffb52ac69ae92540dfa9-6df690bb-f4d32142
MAILGUN_DOMAIN: sandbox3b2673b97d264e0f9652b83c4873b0cd.mailgun.org
Dependencies
Frontend (Flutter)
Core: Flutter SDK
Packages:
pinput: ^5.0.0
smart_auth: ^2.0.0
flutter_dotenv: ^5.2.1
flutter_secure_storage: ^9.2.2
intl: ^0.19.0
jwt_decode: ^0.3.1
connectivity_plus: ^6.1.0
go_router: ^14.6.0
Backend (Node.js)
Core: Node.js
Database: PostgreSQL (Supabase)
Integrations: Mailgun, Postmark



Additional Notes
Ensure all environment variables are set before running the applications.
For further assistance, contact [Your Support Email].
This project has been delivered with a copy retained by the author due to non-payment. The rights to use, modify, or redistribute remain conditional on full payment.
