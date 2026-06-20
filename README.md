# School Immunization Consent System (SIP-APP)

## About
SIP-APP is a full-stack electronic consent management system. 
The goal of this project is to transition the School Immunization Program (SIP) from a paper-based vaccine consent process to an electronic consent (eConsent) approach in order to streamline consent management, improve SIP vaccination rates among students, reduce resource consumption, and align with the increased adoption of e-health solutions.

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