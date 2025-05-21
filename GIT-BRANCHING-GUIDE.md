# 🧭 Git Branch Naming Convention Guide

Establishing a consistent and descriptive Git branch naming convention enhances clarity and efficiency in your development workflow. This guide outlines best practices to help you implement effective branch naming strategies.

---

## 📌 Branch Naming Guidelines

### 1. Use Clear Prefixes to Indicate Purpose

Start branch names with a prefix that denotes the type of work:

- `feature/` – New features
- `bugfix/` – Bug fixes
- `hotfix/` – Urgent fixes in production
- `release/` – Release preparation
- `refactor/` – Code refactoring
- `test/` – Testing-related changes
- `doc/` – Documentation updates

*Example:*

- `feature/user-authentication`
- `bugfix/login-error`

### 2. Incorporate Issue or Ticket Numbers

If you're using a project management tool like Jira or Trello, including the ticket number can enhance traceability:

- `feature/JIRA-1234-add-login`
- `bugfix/ISSUE-567-resolve-crash`

### 3. Use Hyphens for Readability

Separate words with hyphens to improve readability:

- `feature/add-user-profile`
- `hotfix/fix-payment-bug`

### 4. Keep Branch Names Concise and Descriptive

Aim for brevity while conveying the purpose:

- ✅ `feature/email-verification`
- ❌ `feature/add-new-user-registration-workflow-with-email-verification`

### 5. Include Author Identifier (Optional)

In collaborative environments, adding your name or initials can help identify ownership:

- `feature/john-doe/add-user-profile`
- `bugfix/jd/fix-login-error`

### 6. Avoid Special Characters and Spaces

Stick to lowercase letters, numbers, hyphens, and slashes. Avoid spaces and special characters to prevent issues with Git commands.
