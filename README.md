# School Immunization Consent System (SIP-APP)

## About
SIP-APP is a full-stack electronic consent management system. 
The goal of this project is to transition the School Immunization Program (SIP) from a paper-based vaccine consent process to an electronic consent (eConsent) approach in order to streamline consent management, improve SIP vaccination rates among students, reduce resource consumption, and align with the increased adoption of e-health solutions.

This project is being built incrementally: starting with core consent form 
functionality (MVP), then expanding to include role-based staff portals for 
nurses and admins, authentication, and full database integration. See the 
**Status** section below for current progress.

## Problem

The current paper-based consent process for SIP is resource-intensive: 
staff spend significant time distributing, collecting, 
organizing, and storing forms — diverting time from clinical work.

- Forms are often incomplete or incorrect, requiring follow-up and 
  re-collection cycles
- No real-time visibility into consent status — tracking relies on manual 
  logs/spreadsheets
- Physical form return delays consent confirmation before clinics
- Storing sensitive health records on paper increases risk of loss or 
  unauthorized access

## Solution

SIP-APP digitizes this process with an electronic consent (eConsent) system — 
allowing parents to submit complete, validated consent forms online, and 
giving school health staff a centralized portal to manage submissions, 
track consent status, and reduce manual follow-up.

## Tech Stack
**Frontend:** HTML, CSS, JavaScript
**Backend:** Node.js, Express.js  
**Database:** PostgreSQL (planned)
**Authentication:** Passport.js (planned)

## Status

🚧 **This project is actively in development. **

- [x] Parent consent form — Student Information section
- [x] Parent consent form — Vaccination History section
- [x] Parent consent form — Health History section
- [x] Parent consent form — Consent section
- [x] Express server with `/submit-form` endpoint
- [ ] PostgreSQL database connection
- [ ] Nurse portal
- [ ] Admin portal
- [ ] Role-based authentication

## Project Structure
SCHOOL-IMMUNIZATION-CONSENT-SYSTEM/
├── frontend/
│   └── parent/
│       ├── parent-consent-form.html
│       └── style.css
├── backend/
│   └── server.js
└── README.md