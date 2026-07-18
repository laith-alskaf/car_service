<div align="center">

# 🚗 Car Service App

**A full-featured Flutter mobile application for car maintenance, smart parking, and repair services — connecting drivers with service providers in real time.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![GetX](https://img.shields.io/badge/GetX-State_Management-8B5CF6?style=for-the-badge)](https://pub.dev/packages/get)
[![Firebase](https://img.shields.io/badge/Firebase-FCM_Notifications-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Presentation](https://img.shields.io/badge/Presentation-View_PDF-EA4335?style=for-the-badge&logo=google-drive&logoColor=white)](https://drive.google.com/file/d/1Rjn1LTpQdQ8RsdIz5QHHQBmoz75SWSUs/view?usp=drive_link)
[![Download APK](https://img.shields.io/badge/Download%20APK-Google%20Drive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)](https://drive.google.com/drive/folders/1PTTms0S6cwumAz42Ib0R8BlxhqOSv6e1)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Presentation](#-presentation)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Project Architecture](#-project-architecture)
- [Prerequisites](#-prerequisites)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Key Modules](#-key-modules)
- [Localization](#-localization)
- [Download](#-download)
- [Contributing](#-contributing)

---

## 🎯 Presentation

A full project presentation (in Arabic) is available on Google Drive, covering the app's concept, architecture, features, and user flows:

> 📄 **[View Project Presentation (PDF)](https://drive.google.com/file/d/1Rjn1LTpQdQ8RsdIz5QHHQBmoz75SWSUs/view?usp=drive_link)**

---

## 🌟 Overview

**Car Service App** is a cross-platform mobile application built with Flutter that provides a comprehensive car care ecosystem. It enables car owners to:

- 📍 **Find & book smart parking spots** near their current location using real-time GPS
- 🔧 **Request car repair services** from nearby professional service centers
- 🧼 **Schedule cleaning and maintenance** appointments with ease
- 📊 **Track service history** and manage all bookings from one dashboard
- 🔔 **Receive real-time notifications** for order status updates via Firebase Cloud Messaging

The platform includes a dedicated **Admin Panel** for service providers to manage orders, parking spots, and customer requests efficiently.

---

## ✨ Features

### 👤 User-Facing Features

| Feature | Description |
|---|---|
| **Authentication** | Registration with email verification, login, and secure password reset flow |
| **Smart Parking** | GPS-based detection of nearest parking lots, slot selection, timer tracking, and booking cancellation |
| **Car Repair** | Choose problem type (Mechanical, Electrical, Other), find nearest repair centers on map |
| **Service Booking** | Full booking flow with time-slot picker and order confirmation |
| **Billing** | View pricing, payment details, and billing summaries per order |
| **Service History** | Full audit trail of past parking and repair orders with delete option |
| **Profile Management** | Edit personal information and car details (model, type, plate number) |
| **Push Notifications** | Receive real-time order status updates via Firebase FCM |
| **Offline Detection** | Graceful connectivity monitoring and user feedback when offline |
| **Localization** | Full Arabic and English language support with dynamic locale switching |

### 🛠️ Admin Panel Features

| Feature | Description |
|---|---|
| **Dashboard** | Analytics overview for orders, revenue, and activity |
| **Order Management** | View and manage all user repair and service orders |
| **Parking Management** | Add and configure parking lots and individual spots |
| **Calendar View** | Schedule-based visualization of bookings |
| **Profile** | Admin account settings and configuration |

---

## 🛠️ Tech Stack

### Core

| Technology | Purpose |
|---|---|
| **Flutter 3.x / Dart 3.x** | Cross-platform mobile UI framework |
| **GetX** | State management, dependency injection, and routing |
| **Dartz** | Functional programming with `Either` for robust error handling |

### Networking & Data

| Package | Purpose |
|---|---|
| `http` | REST API communication |
| `hive` | Lightweight local storage for user session and tokens |
| `socket_io_client` | Real-time WebSocket communication |
| `cached_network_image` | Efficient remote image loading and caching |

### Location & Maps

| Package | Purpose |
|---|---|
| `google_maps_flutter` | Interactive map rendering and service center display |
| `geocoding` | Reverse geocoding for human-readable location names |
| `location` | Real-time GPS location tracking |

### Firebase

| Package | Purpose |
|---|---|
| `firebase_core` | Firebase SDK initialization |
| `firebase_messaging` | Push notification delivery via FCM |
| `awesome_notifications` | Rich local notification rendering |

### UI & UX

| Package | Purpose |
|---|---|
| `flutter_screenutil` | Responsive layout scaling for all screen sizes |
| `carousel_slider` | Featured content carousels on home screen |
| `fl_chart` | Admin analytics charts and graphs |
| `animate_do` | Smooth entrance animations |
| `bot_toast` | Non-intrusive toast and loading overlay messages |
| `pin_code_fields` | OTP input for email verification |
| `percent_indicator` | Visual progress indicators |
| `flutter_stepindicator` | Multi-step booking flow progress tracker |
| `fancy_bottom_navigation_plus` | Animated bottom navigation bar |
| `flutter_spinkit` | Loading spinners |
| `flutter_svg` | SVG asset rendering |

### Media & Files

| Package | Purpose |
|---|---|
| `image_picker` | Camera and gallery image selection |
| `file_picker` | Document and file attachment support |

---

## 🏗️ Project Architecture

The project follows a **layered architecture** pattern with clear separation of concerns:

```
lib/
├── app/                    # Application-level configuration
│   ├── app_config.dart     # Global app constants and configuration
│   ├── my_app.dart         # Root widget (GetMaterialApp + ScreenUtil setup)
│   └── my_app_controller.dart
│
├── core/                   # Shared business logic and infrastructure
│   ├── data/
│   │   ├── models/         # API response models and local data models
│   │   ├── network/        # HTTP client, headers, base URL, and endpoints
│   │   └── repositories/   # Data access layer (API calls abstracted)
│   ├── enums/              # App-wide enumerations
│   ├── services/           # Platform services (connectivity, location, notifications)
│   ├── translation/        # i18n strings and locale configuration
│   └── utils/              # Shared utility functions and helpers
│
└── ui/                     # Presentation layer
    ├── views/              # User-facing screens
    │   ├── splash_screen_view/
    │   ├── login_view/
    │   ├── sign_up_view/
    │   ├── forget_password_view/
    │   └── home/           # Main bottom-tab screens
    │       ├── home_view/
    │       ├── parking_view/
    │       ├── repair_view/
    │       ├── billing_view/
    │       ├── history_view/
    │       ├── profile_view/
    │       └── map/
    ├── admin_view/         # Admin panel screens
    │   ├── admin_dashboard/
    │   ├── add_park/
    │   ├── all_order_detiels/
    │   ├── all_parking_order/
    │   ├── calendar_view_admin/
    │   └── admin_profile_view/
    └── shared/             # Reusable UI widgets and components
```

**Data Flow:**

```
UI Layer (Views) → GetX Controllers → Repository Layer → Network/Storage Layer → API / Hive
```

All network responses are wrapped in an `Either<String, T>` type from `dartz`, ensuring errors are handled explicitly at every layer without exceptions propagating uncontrolled.

---

## 📦 Prerequisites

Before running this project, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.3.1 <4.0.0`
- [Dart SDK](https://dart.dev/get-dart) `>=3.3.1`
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter extension
- A configured Android Emulator or a physical Android device
- A [Google Maps API Key](https://developers.google.com/maps/documentation/android-sdk/get-api-key) with Maps SDK for Android enabled
- A [Firebase project](https://console.firebase.google.com/) with Android app registered

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/laith-alskaf/car_service.git
cd car_service
```

### 2. Configure Google Maps

Add your Google Maps API key to `android/app/src/main/AndroidManifest.xml`:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY" />
```

### 3. Configure Firebase

1. Go to your [Firebase Console](https://console.firebase.google.com/) and create a project.
2. Register your Android app with your package name.
3. Download the `google-services.json` file and place it in:

```
android/app/google-services.json
```

### 4. Configure the Backend Base URL

Open `lib/core/data/network/network_config.dart` (or the relevant config file) and update the base URL to point to your backend server:

```dart
static const String baseUrl = 'https://your-api-server.com/api/';
```

### 5. Install Dependencies

```bash
flutter pub get
```

### 6. Run the Application

```bash
# For debug mode
flutter run

# For a specific device
flutter run -d <device_id>

# To list available devices
flutter devices
```

### 7. Build for Release (Android)

```bash
flutter build apk --release
# or for App Bundle
flutter build appbundle --release
```

---

## 📁 Project Structure

```
car_service/
├── android/                    # Android platform code
├── ios/                        # iOS platform code
├── assets/
│   ├── images/                 # PNG, JPG, and SVG illustrations and icons
│   ├── bottom_bar/             # Bottom navigation bar assets
│   └── fonts/
│       └── BalooBhaijaan2/     # Custom Arabic-friendly font (Bold & Regular)
├── lib/                        # Dart source code (see Architecture section)
├── test/                       # Unit and widget tests
├── pubspec.yaml                # Project dependencies and asset declarations
├── firebase.json               # Firebase hosting/functions configuration
└── analysis_options.yaml       # Dart linting rules
```

---

## 🔑 Key Modules

### Authentication Flow
1. User registers with name, email, car details, and password
2. An email verification code is sent (PIN entry screen)
3. On success, a JWT token is stored locally in Hive
4. Protected routes check token validity before allowing access

### Parking Booking Flow
1. App fetches user's GPS coordinates via `location` package
2. REST API returns nearest available parking lots
3. User selects a lot → sees available spots on a grid
4. User picks a date, duration → order summary is shown
5. On confirmation, a real-time parking timer begins

### Repair Service Flow
1. User selects problem category (Mechanical / Electrical / Other)
2. API returns a list of specific issues within that category
3. User selects the issue → nearest repair centers are shown on Google Maps
4. User confirms a center → order is created and tracked in history

### Notification System
- Firebase Cloud Messaging (FCM) token is stored on registration
- Backend triggers push notifications on order status changes
- `awesome_notifications` handles foreground notification rendering

---

## 🌐 Localization

The app supports **Arabic (ar)** and **English (en)** locales using GetX's built-in translation system.

- Translation keys are defined under `lib/core/translation/languages/`
- Language preference is persisted locally via Hive
- The locale is resolved at app startup in `my_app.dart`

To switch languages, update the stored language key (`'ar'` or `'en'`) in app storage, and the app will rebuild with the correct locale.

---

## 📥 Download

The latest release of **Car Service App** is available for direct download from Google Drive:

<div align="center">

[![Download APK](https://img.shields.io/badge/Download%20APK-Google%20Drive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)](https://drive.google.com/drive/folders/1PTTms0S6cwumAz42Ib0R8BlxhqOSv6e1)

</div>

> **Note:** This APK targets Android devices. For iOS, see the [Getting Started](#-getting-started) section for local build instructions using Xcode.

---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve the project:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'feat: add your feature description'`
4. Push the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

Please follow the existing code style and ensure all new code passes `flutter analyze` with no warnings.

---

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Built with ❤️ using Flutter**

[⬆️ Back to Top](#-car-service-app) • [🐙 GitHub](https://github.com/laith-alskaf/car_service) • [📥 Download APK](https://drive.google.com/drive/folders/1PTTms0S6cwumAz42Ib0R8BlxhqOSv6e1) • [📄 Presentation](https://drive.google.com/file/d/1Rjn1LTpQdQ8RsdIz5QHHQBmoz75SWSUs/view?usp=drive_link) • [📧 Report an Issue](https://github.com/laith-alskaf/car_service/issues)

</div>
