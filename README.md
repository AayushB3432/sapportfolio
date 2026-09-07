# SAP S/4HANA & Full-Stack Developer Portfolio
**Developer:** Aayush Bhagwat | Computer Engineering Student (B.E. 2027)  
**Location:** Pune, Maharashtra, India  

---

## 🌟 Overview

A professional, modern, responsive full-stack portfolio application tailored for an **SAP S/4HANA Student & Aspiring Technical Consultant**. The portfolio presents a high-end enterprise aesthetic with a dark midnight-blue visual language, glassmorphism card layouts, light/dark theme toggling, recruiter-friendly skill dashboards, interactive roadmaps, and full-stack REST API backend integration with MySQL database storage and a secure JWT-authenticated Admin Panel.

---

## 🛠️ Technology Stack

### Frontend
- **Framework**: React.js 18 + Vite
- **Styling**: Vanilla CSS system with Glassmorphism, CSS Variables, Theme switching (Dark/Light), Responsive Flexbox/Grid
- **Icons**: Lucide React & FontAwesome Icons
- **HTTP Service**: Axios with request interceptors & offline fallback

### Backend
- **Runtime**: Node.js + Express.js
- **Database**: MySQL 8.0+ (`mysql2/promise` connection pool with auto-initialization & memory fallback mode)
- **Security**: JWT (`jsonwebtoken`) authentication, `bcryptjs` password hashing, `cors`, `dotenv`
- **Validation**: Strict input validation & parameterized SQL queries

---

## 📁 Repository Directory Structure

```text
portfolio/
├── database.sql                  # Complete MySQL schema & seed data
├── index.html                    # HTML5 template with SEO & Meta tags
├── package.json                  # Frontend Vite dependencies & scripts
├── vite.config.js                # Vite configuration & proxy settings
├── vercel.json                   # Vercel deployment configuration
├── netlify.toml                  # Netlify deployment & redirect rules
├── render.yaml                   # Render Blueprint Infrastructure-as-Code
├── robots.txt                    # Search engine crawler permissions
├── sitemap.xml                   # SEO sitemap
│
├── server/                       # Node.js + Express REST API Backend
│   ├── config/
│   │   └── db.js                 # MySQL Pool connection & memory DB fallback
│   ├── controllers/
│   │   ├── authController.js     # Admin JWT login & auth validation
│   │   ├── projectController.js  # CRUD for full-stack & SAP projects
│   │   ├── skillController.js    # CRUD for SAP & tech skills
│   │   ├── certController.js     # CRUD for certifications
│   │   ├── expController.js      # CRUD for experience & learning journey
│   │   ├── contactController.js  # Message submission & admin retrieval
│   │   └── newsletterController.js # Subscriber management
│   ├── middleware/
│   │   └── auth.js               # JWT Bearer token protection
│   ├── routes/
│   │   ├── authRoutes.js
│   │   ├── projectRoutes.js
│   │   ├── skillRoutes.js
│   │   ├── certRoutes.js
│   │   ├── expRoutes.js
│   │   ├── contactRoutes.js
│   │   └── newsletterRoutes.js
│   ├── .env.example              # Environment variables template
│   ├── package.json              # Backend Express server dependencies
│   └── server.js                 # Express server entry point
│
└── src/                          # React 18 Frontend Source Code
    ├── components/
    │   ├── Navbar.jsx            # Header with theme toggle & mobile drawer
    │   └── Footer.jsx            # Footer links, social handles & admin link
    ├── sections/
    │   ├── HeroSection.jsx       # Hero with role badges & stats panel
    │   ├── AboutSection.jsx      # Background & Career Objective
    │   ├── SapSkillsSection.jsx  # SAP skills with non-false experience badges
    │   ├── TechSkillsSection.jsx # Frontend, Backend, DB & Tools categories
    │   ├── ProjectsSection.jsx   # 4 core full-stack software projects
    │   ├── SapProjectsSection.jsx# 6 SAP hands-on practice projects
    │   ├── ExperienceSection.jsx # Internship & SAP Learning Journey timeline
    │   ├── EducationSection.jsx  # B.E. Computer Engineering degree details
    │   ├── CertificationsSection.jsx # Certifications cards & Add trigger
    │   ├── SapRoadmapSection.jsx # Step-by-step SAP Career Roadmap timeline
    │   ├── SkillDashboardSection.jsx # Recruiter honest skill matrix
    │   ├── ResumeSection.jsx     # Download & online resume preview modal
    │   └── ContactSection.jsx    # Validated contact form & newsletter box
    ├── pages/
    │   └── AdminPortal.jsx       # Secure Admin panel with JWT auth & CRUD tabs
    ├── services/
    │   └── api.js                # Axios REST API client
    ├── App.jsx                   # Main layout container
    ├── main.jsx                  # React application entry point
    └── index.css                 # Enterprise Glassmorphism CSS Design System
```

---

## 🚀 Live Deployment Guide

### Method A: Deploy Frontend to Vercel (1-Click Setup)
1. Push this repository to GitHub.
2. Sign in to [Vercel](https://vercel.com/) and click **"Add New Project"**.
3. Import your GitHub repository.
4. Vercel will automatically detect `vercel.json` and build settings (`npm run build`, output: `dist`).
5. Click **"Deploy"**. Your frontend site will be live instantly!

### Method B: Deploy Frontend to Netlify
1. Log in to [Netlify](https://www.netlify.com/).
2. Click **"Add new site" -> "Import an existing project"**.
3. Select your GitHub repository.
4. Netlify will automatically read `netlify.toml` for build settings and SPA routing.
5. Click **"Deploy site"**.

### Method C: Deploy Backend & Database to Render
1. Sign in to [Render](https://render.com/).
2. Click **"New +"** and select **"Blueprint"**.
3. Connect your GitHub repository containing `render.yaml`.
4. Render will automatically provision:
   - **Express Web Service**: Deploying `server/` on Node.js.
   - **MySQL Database**: Provisioning managed MySQL database `sap_portfolio_db`.
5. Once deployed, copy your Render web service URL (e.g. `https://sap-portfolio-backend.onrender.com`).
6. Set `VITE_API_URL=https://sap-portfolio-backend.onrender.com/api` in your Vercel/Netlify environment settings.

---

## ⚡ Quick Start & Local Setup

### 1. Database Setup (MySQL)
Run the SQL script from `database.sql`:
```bash
mysql -u root -p < database.sql
```

### 2. Backend Launch
```bash
cd server
cp .env.example .env
npm install
npm run dev   # Server runs on http://localhost:5000
```

### 3. Frontend Launch
```bash
npm install
npm run dev   # Vite runs on http://localhost:3000
```

---

## 🔐 Admin Dashboard Access
- **Modal / Route**: Open via the **Admin Portal** button in the header/footer.
- **Default Credentials**: `admin@example.com` / `admin123`
