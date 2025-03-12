# Eventra

Eventra is a modern events management application designed to help users discover, book, and manage events seamlessly. With features like localization, theme customization, and a user-friendly interface, Eventra ensures a personalized experience for both users and administrators.

---

## Features

### General Features
- **Localization**: Supports multiple languages for a global audience.
- **Theme Customization**: Users can switch between light and dark themes for a personalized experience.

### User Features
- **Upcoming Events**: Discover and explore upcoming events in your area or globally.
- **Calendar View**: View events in a calendar layout for easy planning.
- **Notifications**: Get timely reminders and updates about your booked events.
- **Booking Events**: Book tickets for events with a few simple clicks.
- **Profile Page**: Manage your personal information, bookings, and preferences.

### Admin Features
- **CRUD Operations for Events**: Create, Read, Update, and Delete events effortlessly.
- **Event Management**: Manage event details, tickets, and schedules.
- **User Management**: View and manage user accounts and bookings.

---

## Tech Stack

- **Frontend**: Flutter (Dart) - For building a cross-platform, responsive, and beautiful user interface.
- **Backend**: Firebase - A comprehensive backend solution for real-time data, authentication, and notifications.
- **Database**: Firestore - A NoSQL cloud database for storing and syncing event data in real-time.
- **Authentication**: Firebase Authentication - For secure user authentication using email/password, Google Sign-In, or other providers.
- **Notifications**: Firebase Cloud Messaging (FCM) - For sending push notifications to users about event updates and reminders.
- **State Management**: Flutter Bloc - For clean and scalable state management.
- **Localization**: Flutter Localization (i18n) - For supporting multiple languages in the app.
- **Theming**: Flutter Theme Customization - For enabling light and dark theme support.

---

## Packages Used

### Core Functionality
- **`go_router`**: A powerful routing package for Flutter that simplifies navigation and deep linking.
- **`local_auth`**: Provides biometric authentication (fingerprint, face ID) for enhanced security.
- **`qr_flutter`**: A package to generate and display QR codes within the app.
- **`url_launcher`**: Allows launching external URLs, such as event links or websites, in a browser.
- **`image_picker`**: Enables users to pick images from the gallery or camera for profile pictures or event uploads.
- **`ai_barcode_scanner`**: A barcode and QR code scanner for event ticket validation or other use cases.
- **`shared_preferences`**: Stores simple key-value pairs locally for persistent app settings or user preferences.
- **`google_maps_flutter`**: Integrates Google Maps for location-based features in the app.

### Helper Packages
- **`intl`**: Provides internationalization and localization support, including date/time formatting.
- **`lottie`**: Adds Lottie animations to make the app more engaging and visually appealing.
- **`fluttertoast`**: Displays toast messages for quick user feedback.
- **`flutter_animate`**: Adds animations to widgets for a smoother and more dynamic user experience.
- **`flutter_screenutil`**: Helps with responsive design by adapting UI elements to different screen sizes.
- **`omni_datetime_picker`**: A customizable date and time picker for event scheduling.
- **`flutter_native_splash`**: Creates a native splash screen for a polished app launch experience.

### UI Enhancements
- **`icons_plus`**: Adds a wide variety of icons to enhance the app’s visual design.
- **`awesome_dialog`**: Displays beautiful and customizable dialogs for alerts, confirmations, or messages.
- **`cupertino_icons`**: Provides Cupertino-style icons for a consistent iOS design.
- **`introduction_screen`**: Creates an onboarding screen to guide new users through the app’s features.
- **`syncfusion_flutter_calendar`**: A feature-rich calendar widget for displaying events in different views (day, week, month).

### State Management
- **`flutter_bloc`**: A state management library that implements the BLoC (Business Logic Component) pattern for clean and scalable code.

### Firebase Integration
- **`firebase_auth`**: Handles user authentication using Firebase, including email/password and social logins.
- **`google_sign_in`**: Enables Google Sign-In for easy user authentication.
- **`firebase_core`**: Initializes Firebase services in the app.
- **`cloud_firestore`**: A NoSQL database for storing and syncing event data in real-time.
- **`firebase_storage`**: Stores and retrieves files (e.g., event images) in Firebase Cloud Storage.
- **`firebase_messaging`**: Sends and receives push notifications for event updates and reminders.

---

## Getting Started

### Prerequisites
- Flutter SDK (v3.6.0 or higher)
- Firebase account (for backend services)
- Android Studio or VS Code (for development)

### Installation
1. Clone the repository:
   ```bash
  https://github.com/devJimmy990/eventra.git
