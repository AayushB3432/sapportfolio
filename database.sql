-- ============================================================
-- SAP S/4HANA & Full-Stack Portfolio Database Schema
-- Developer: Aayush Bhagwat
-- Database Engine: MySQL 8.0+
-- ============================================================

CREATE DATABASE IF NOT EXISTS sap_portfolio_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sap_portfolio_db;

-- ------------------------------------------------------------
-- 1. Users Table (Admin authentication)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(50) DEFAULT 'admin',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 2. Projects Table (Full-stack & SAP Learning Projects)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  category ENUM('Full-Stack', 'SAP Learning', 'Practice') DEFAULT 'Full-Stack',
  description TEXT NOT NULL,
  badge_label VARCHAR(50) DEFAULT 'Full-Stack Project',
  technologies VARCHAR(255) NOT NULL,
  features TEXT NOT NULL,
  github_url VARCHAR(255) DEFAULT '#',
  live_demo_url VARCHAR(255) DEFAULT '#',
  featured BOOLEAN DEFAULT TRUE,
  display_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 3. Skills Table (SAP & Technical Skills)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS skills (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category ENUM('SAP', 'Frontend', 'Backend', 'Database', 'Programming', 'Tools', 'Cloud') NOT NULL,
  proficiency_level VARCHAR(50) NOT NULL,
  percentage INT DEFAULT 50,
  status_tag VARCHAR(50) DEFAULT 'Learning',
  icon_name VARCHAR(50) DEFAULT 'Code',
  display_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 4. Certifications Table
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS certifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  issuer VARCHAR(150) NOT NULL,
  issue_date VARCHAR(50) DEFAULT 'In Progress',
  credential_url VARCHAR(255) DEFAULT '#',
  status VARCHAR(50) DEFAULT 'Currently Pursuing',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 5. Experience Table (Internships & SAP Learning Journey)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS experience (
  id INT AUTO_INCREMENT PRIMARY KEY,
  company_org VARCHAR(200) NOT NULL,
  role_title VARCHAR(200) NOT NULL,
  period VARCHAR(100) NOT NULL,
  type ENUM('Internship', 'SAP Learning Journey', 'Project') DEFAULT 'Internship',
  responsibilities TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 6. Education Table
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS education (
  id INT AUTO_INCREMENT PRIMARY KEY,
  degree VARCHAR(200) NOT NULL,
  institution VARCHAR(200) NOT NULL,
  location VARCHAR(100) NOT NULL,
  expected_graduation VARCHAR(50) NOT NULL,
  details VARCHAR(255) DEFAULT ''
);

-- ------------------------------------------------------------
-- 7. Contact Messages Table
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS contact_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  subject VARCHAR(200) NOT NULL,
  message TEXT NOT NULL,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 8. Newsletter Subscribers Table
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(150) NOT NULL UNIQUE,
  subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- SEED DATA INGESTION
-- ============================================================

-- Seed Default Admin User (Password: admin123 hashed using bcrypt)
INSERT INTO users (username, email, password_hash, role) VALUES
('admin', 'admin@example.com', '$2a$10$w8T0M4lC7yO9Gj7wE1.0g.b4rJ6/S.fM1R2V7N1k9H8j9K0L1M2N3', 'admin')
ON DUPLICATE KEY UPDATE username=username;

-- Seed Projects
INSERT INTO projects (title, category, description, badge_label, technologies, features, github_url, live_demo_url, featured, display_order) VALUES
('QR Code Authentication System for Secure Access Control', 'Full-Stack', 'A secure authentication system using QR codes with encryption/hash-based verification for controlled access.', 'Full-Stack Project', 'HTML, CSS, JavaScript, PHP, MySQL, QR Code, Encryption', 'QR generation, Authentication, Secure verification, Database integration, Access control', 'https://github.com/aayush-bhagwat/qr-code-auth', 'https://demo.aayushbhagwat.com/qr-auth', TRUE, 1),
('Online Quiz and Examination System', 'Full-Stack', 'Web-based examination platform for conducting online quizzes and managing questions, users and results.', 'Full-Stack Project', 'HTML, CSS, JavaScript, PHP, MySQL', 'User authentication, Online examination, Question management, Automatic scoring, Result management', 'https://github.com/aayush-bhagwat/online-quiz-system', 'https://demo.aayushbhagwat.com/quiz', TRUE, 2),
('Placement Management System', 'Full-Stack', 'An application for managing student placement information, company details, applications and placement records.', 'Full-Stack Project', 'React/HTML/CSS, Node.js/PHP, MySQL', 'Student management, Company management, Job postings, Application tracking, Placement statistics', 'https://github.com/aayush-bhagwat/placement-management', 'https://demo.aayushbhagwat.com/placement', TRUE, 3),
('Medigo – Hospital Management System', 'Full-Stack', 'A digital hospital management application for managing patients, doctors, appointments and healthcare records.', 'Full-Stack Project', 'HTML, CSS, JavaScript, PHP, MySQL', 'Patient management, Doctor management, Appointment management, Database management', 'https://github.com/aayush-bhagwat/medigo-hospital-system', 'https://demo.aayushbhagwat.com/medigo', TRUE, 4),

-- SAP Learning Projects
('SAP S/4HANA Business Process Exploration', 'SAP Learning', 'In-depth academic exploration of Order-to-Cash (O2C) and Procure-to-Pay (P2P) enterprise cycles in S/4HANA.', 'Learning Project', 'SAP S/4HANA, Enterprise Structure, Fiori Launchpad', 'Process flow mapping, Organizational unit setup, Business partner creation, Document flow analysis', 'https://github.com/aayush-bhagwat/sap-s4hana-learning', '#', FALSE, 5),
('SAP ABAP CRUD Application', 'SAP Learning', 'Hands-on practice building interactive reports and data manipulation using ABAP Dictionary and Open SQL.', 'Practice Project', 'SAP ABAP, ABAP Dictionary, Open SQL, SE11/SE38', 'Table definitions, Selection screens, Data fetching, Internal table processing, ALV grid report display', 'https://github.com/aayush-bhagwat/sap-abap-crud', '#', FALSE, 6),
('SAP HANA Database Practice', 'SAP Learning', 'Academic practice querying in-memory HANA database tables, execution plan review, and modeling concepts.', 'Practice Project', 'SAP HANA, SQLScript, HANA Studio', 'Column store tables, SQLScript procedures, Calculation views basics, Data indexing', 'https://github.com/aayush-bhagwat/sap-hana-practice', '#', FALSE, 7),
('CDS View Practice', 'SAP Learning', 'Core Data Services (CDS) view creation for data modeling, association joining, and annotations.', 'Practice Project', 'CDS Views, ABAP Development Tools (ADT), Open SQL', 'Basic views, Composite views, Association joins, OData annotation prep', 'https://github.com/aayush-bhagwat/sap-cds-views', '#', FALSE, 8),
('SAP Fiori / UI5 Demo Application', 'SAP Learning', 'Modern Fiori master-detail layout application built with SAPUI5 JavaScript framework concepts.', 'Academic Project', 'SAPUI5, JavaScript, XML Views, MVC Architecture', 'XML view design, Data binding, Component layout, Responsive table control', 'https://github.com/aayush-bhagwat/sap-fiori-demo', '#', FALSE, 9),
('OData Service Practice', 'SAP Learning', 'Building and consuming OData V2 services in SAP Gateway for frontend integration.', 'Practice Project', 'SAP Gateway, SEGW, OData, REST', 'Entity type definition, GET/POST method implementation, Service registration', 'https://github.com/aayush-bhagwat/sap-odata-practice', '#', FALSE, 10);

-- Seed Skills
INSERT INTO skills (name, category, proficiency_level, percentage, status_tag, display_order) VALUES
('SAP S/4HANA', 'SAP', 'Learning', 65, 'Learning', 1),
('SAP ERP Concepts', 'SAP', 'Hands-on Practice', 75, 'Hands-on Practice', 2),
('SAP ABAP', 'SAP', 'Learning', 60, 'Learning', 3),
('ABAP Dictionary', 'SAP', 'Hands-on Practice', 70, 'Hands-on Practice', 4),
('Internal Tables & Reports', 'SAP', 'Hands-on Practice', 70, 'Hands-on Practice', 5),
('Open SQL & Debugging', 'SAP', 'Hands-on Practice', 65, 'Hands-on Practice', 6),
('SAP Fiori & SAPUI5', 'SAP', 'Currently Learning', 55, 'Currently Learning', 7),
('OData Services', 'SAP', 'Currently Learning', 50, 'Currently Learning', 8),
('SAP Business Technology Platform (BTP)', 'SAP', 'Academic Knowledge', 45, 'Academic Knowledge', 9),
('SAP HANA & CDS Views', 'SAP', 'Learning', 55, 'Learning', 10),

('HTML5 & CSS3', 'Frontend', 'Strong', 90, 'Strong', 11),
('JavaScript (ES6+)', 'Frontend', 'Intermediate', 80, 'Intermediate', 12),
('React.js', 'Frontend', 'Intermediate', 75, 'Intermediate', 13),
('Bootstrap', 'Frontend', 'Intermediate', 85, 'Intermediate', 14),

('Node.js', 'Backend', 'Intermediate', 75, 'Intermediate', 15),
('Express.js', 'Backend', 'Intermediate', 75, 'Intermediate', 16),
('PHP', 'Backend', 'Intermediate', 70, 'Intermediate', 17),
('REST APIs', 'Backend', 'Intermediate', 80, 'Intermediate', 18),

('MySQL', 'Database', 'Intermediate', 80, 'Intermediate', 19),
('SQL Querying', 'Database', 'Strong', 85, 'Strong', 20),
('Firebase', 'Database', 'Hands-on Practice', 65, 'Hands-on Practice', 21),

('Java', 'Programming', 'Intermediate', 75, 'Intermediate', 22),

('Git & GitHub', 'Tools', 'Intermediate', 85, 'Intermediate', 23),
('Postman API', 'Tools', 'Intermediate', 80, 'Intermediate', 24),
('VS Code & XAMPP', 'Tools', 'Strong', 90, 'Strong', 25),

('AWS Fundamentals', 'Cloud', 'Academic Knowledge', 55, 'Academic Knowledge', 26),
('Netlify & Vercel', 'Cloud', 'Hands-on Practice', 80, 'Hands-on Practice', 27);

-- Seed Certifications
INSERT INTO certifications (title, issuer, issue_date, credential_url, status) VALUES
('SAP S/4HANA Learning Fundamentals', 'SAP Learning Hub / Self-Study', '2026', '#', 'Academic Pursuing'),
('SAP ABAP Development Foundations', 'Self-Paced Practice & Courses', '2026', '#', 'Hands-on Practice'),
('Java Programming Masterclass', 'Academic / Online Platform', '2025', '#', 'Completed'),
('Full-Stack Web Development (PHP & Node.js)', 'Self-Paced / Academic', '2025', '#', 'Completed'),
('AWS Cloud Practitioner Essentials', 'AWS Training & Certification', '2026', '#', 'Pursuing');

-- Seed Experience
INSERT INTO experience (company_org, role_title, period, type, responsibilities) VALUES
('Cognifyz Technologies', 'Front-End Development Intern', 'Feb 2026 – Mar 2026', 'Internship', 'Developed responsive web pages using HTML5, CSS3, JavaScript, and Bootstrap. Integrated RESTful APIs, implemented client-side form validation, and optimized UI for mobile, tablet, and desktop screens.'),
('SAP Technical Learning Journey', 'Student Developer & Learner', '2026 – Present', 'SAP Learning Journey', 'Studying SAP S/4HANA enterprise architecture, ABAP programming fundamentals (SE11, SE38, Open SQL), Core Data Services (CDS Views), SAP HANA database concepts, Fiori UI5 fundamentals, and OData service generation.');

-- Seed Education
INSERT INTO education (degree, institution, location, expected_graduation, details) VALUES
('B.E. in Computer Engineering', 'D.Y. Patil Technical Campus', 'Pune, Maharashtra', '2027', 'Specializing in enterprise software systems, database management, software engineering, and web technology applications.');
