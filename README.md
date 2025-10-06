# 💼 Mini Job Portal App (Flutter)

A simple **Mini Job Portal App** built with **Flutter**.  
This app demonstrates user authentication, REST API integration, state management using Riverpod, and local data persistence with SQLite.

---

## 🚀 Features

### 🔐 Authentication
- Email + Password based **Sign Up** and **Login**
- User credentials stored securely in **SQLite**

### 📋 Job List Page
- Fetches job data from a public REST API  
  👉 `https://dummyjson.com/products`
- Displays Job Cards with:
  - **Title**
  - **Company Name**
  - **Location**
  - **Salary**
  - **Apply Button**

### 🧾 Job Detail Page
- Clicking on a Job Card loads full job details from the API dynamically.

### 💾 Saved Jobs
- User can tap “Apply” or “Save” to add the job to local storage (**SQLite**)
- Saved jobs are displayed in the **Saved Jobs** tab

### 👤 Profile Page
- Shows **Dummy User Info**
- Displays:
  - User Name
  - Email
  - Total Saved Jobs Count (fetched from SQLite)

---

## 🧭 App Flow

1. **Login Screen** → Sign Up / Login → Redirect to Home  
2. **Home (Job List)** → Fetch & display jobs from API  
3. **Detail Page** → Show full job info  
4. **Saved Jobs Tab** → Display locally saved jobs  
5. **Profile Tab** → Dummy user info + Saved job count  

---

## 🧰 Tech Stack

| Component | Technology |
|------------|-------------|
| **Frontend Framework** | Flutter |
| **State Management** | Riverpod |
| **Local Database** | SQLite |
| **API Source** | [DummyJSON](https://dummyjson.com/products) |
| **Language** | Dart |

---

## ⚙️ Installation & Run Guide
**🔹 Get Dependencies**  
   flutter pub get  
**🔹 Run the App**  
   flutter run  
**🔹 Build Release APK**  
   flutter build apk --release

### 🔹 Clone the Repository
```bash
git clone https://github.com/TamimHq/mini-job-portal-flutter.git
cd mini-job-portal-flutter
```
## 📱 Download APK
You can download the latest working APK build of the **Mini Job Portal App** from the link below:

👉 [**Download Latest Release (APK)**](https://github.com/TamimHq/mini-job-portal-flutter/releases/latest)  

### 🧑‍💻 Developer
**Name:** Tamim Haque  
**Phone No:** +8801783136035
