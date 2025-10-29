# 🧱 **Flutter Clean Modular GetX Starter**

> A **production-ready Flutter boilerplate** built with **Clean Architecture + Modular GetX pattern**, designed for scalability, security, and maintainability across enterprise-grade projects.

---

## 🧭 **Overview**

`flutter_clean_modular_getx_starter` is a **complete Flutter starter kit** built on:

* 🧩 **Clean Modular Architecture**
* ⚙️ **GetX** (for state, routing, and dependency injection)
* 🧰 **Dio + Secure Storage + DotEnv**
* 🧪 **Unit test & CI/CD ready**
* 📱 **Fully responsive UI (mobile, tablet, desktop)**
* 🔐 **Secure, scalable, and obfuscation-ready**

This boilerplate is designed for long-term maintainability, feature modularization, and team collaboration — ready for production and CI/CD pipelines.

---

## 🧬 **Architecture Overview**

```
lib/
│
├── main.dart
│
├── core/
│   ├── bindings/             # Global dependency injection
│   ├── constants/            # App-wide constants (colors, strings, config)
│   ├── routes/               # GetX routing setup
│   ├── services/             # API, Auth, and Secure Storage
│   ├── theme/                # Light/Dark themes, text styles
│   └── utils/                # Helpers, validators, responsiveness
│
├── data/
│   ├── models/               # Data models (User, Response)
│   ├── providers/            # API provider (Dio abstraction)
│   └── repositories/         # Clean domain layer (Auth, BaseRepository)
│
├── presentation/             # Feature modules
│   ├── splash/               # Splash screen
│   ├── auth/                 # Login/Register modules
│   ├── home/                 # Home screen
│   └── widgets/              # Shared UI components
│
└── config/
    └── environment.dart      # Environment loader (.env)
```

---

## 🧩 **Key Features**

| Category                 | Description                                                               |
| ------------------------ | ------------------------------------------------------------------------- |
| **Architecture**         | Modular Clean GetX — each feature isolated (View, Controller, Binding).   |
| **Dependency Injection** | Handled via GetX Bindings (`InitialBinding`, `AppBinding`).               |
| **Routing**              | Centralized navigation via `AppRoutes` & `AppPages`.                      |
| **Networking**           | Secure API layer with Dio interceptors.                                   |
| **Authentication**       | `AuthService` + Secure Storage (encrypted token persistence).             |
| **Config Management**    | `.env` support using `flutter_dotenv`.                                    |
| **Theme System**         | Light/Dark theme with unified typography.                                 |
| **Utilities**            | Global helpers, validators, responsive UI.                                |
| **Testing Ready**        | Mockable services, clean controllers.                                     |
| **CI/CD Ready**          | GitHub Actions pipeline (`flutter analyze`, `flutter test`, `build apk`). |

---

## ⚙️ **Getting Started**

### 1️⃣ Prerequisites

* Flutter SDK ≥ **3.35.x**
* Dart ≥ **3.5**
* Android Studio / VSCode
* GitHub account (for CI/CD)
* A `.env` file (see below)

---

### 2️⃣ Clone Repository

```bash
git clone https://github.com/your-org/flutter_clean_modular_getx_starter.git
cd flutter_clean_modular_getx_starter
```

---

### 3️⃣ Install Dependencies

```bash
flutter pub get
```

---

### 4️⃣ Setup `.env`

Create a `.env` file in the project root:

```bash
APP_ENV=development
API_BASE_URL=https://api.example.com/v1
ENABLE_ANALYTICS=false
SENTRY_DSN=
```

> ⚠️ `.env` is ignored in `.gitignore` — keep credentials out of Git.

---

### 5️⃣ Run App

```bash
flutter run
```

---

### 6️⃣ Build for Release (with Obfuscation)

```bash
flutter build apk --release --obfuscate --split-debug-info=build/symbols
```

---

## 🧱 **Core Modules Explained**

| Folder           | Description                                                              |
| ---------------- | ------------------------------------------------------------------------ |
| `core/bindings/` | Handles dependency injection for global & feature-specific services.     |
| `core/services/` | Contains `ApiService`, `AuthService`, and `StorageService`.              |
| `core/theme/`    | Defines global `ThemeData` for light/dark modes.                         |
| `core/utils/`    | Includes reusable utilities like validators, helpers, responsive design. |
| `data/`          | Data access layer with models, providers, and repositories.              |
| `presentation/`  | UI + controllers + bindings for each feature module.                     |
| `config/`        | Manages environment variables.                                           |

---

## 🔐 **Security Features**

* `.env`-based secret management
* `flutter_secure_storage` for encrypted token storage
* `Dio` interceptors for JWT/Auth headers
* `kReleaseMode` flag disables logs in production
* Obfuscation + symbol split in release build
* Safe error handling via `Helpers.handleApiError()`

---

## 📱 **Responsive Design**

`core/utils/responsive.dart` handles breakpoints:

| Device  | Width Range      | Example           |
| ------- | ---------------- | ----------------- |
| Mobile  | `< 600px`        | Phones            |
| Tablet  | `600px – 1024px` | iPad, mid-screens |
| Desktop | `> 1024px`       | Large screens     |

Example:

```dart
final responsive = Responsive(context);
Text("Welcome", style: TextStyle(fontSize: responsive.scaleFont(16)));
```

---

## 🧪 **Testing**

Test files mirror the `/lib` structure inside `/test`.

Example command:

```bash
flutter test --coverage
```

Generate coverage report:

```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## ⚙️ **GitHub Actions CI/CD**

`.github/workflows/flutter_ci.yml` automates:

1. Linting (`flutter analyze`)
2. Tests with coverage (`flutter test --coverage`)
3. Builds obfuscated release APK
4. Uploads coverage artifacts

Trigger:

* On every **push** or **pull request** to `main` or `dev` branches.

---

## 💡 **Extending the Starter**

Easily add new modules:

```
lib/presentation/profile/
 ├── profile_view.dart
 ├── profile_controller.dart
 └── profile_binding.dart
```

Then, register route in:

```dart
AppPages.pages.add(GetPage(
  name: AppRoutes.profile,
  page: () => const ProfileView(),
  binding: ProfileBinding(),
));
```

---

## 🧩 **Recommended Packages (Optional)**

| Purpose                | Package                                    |
| ---------------------- | ------------------------------------------ |
| Crash & Error Tracking | `sentry_flutter` or `firebase_crashlytics` |
| Analytics              | `firebase_analytics`                       |
| State Persistence      | `get_storage`                              |
| UI Animation           | `flutter_animate`, `rive`                  |
| Internationalization   | `easy_localization`                        |

---

## 🧰 **Development Commands**

| Action          | Command                   |
| --------------- | ------------------------- |
| Run in debug    | `flutter run`             |
| Run in release  | `flutter run --release`   |
| Analyze code    | `flutter analyze`         |
| Test            | `flutter test`            |
| Build APK       | `flutter build apk`       |
| Build AppBundle | `flutter build appbundle` |

---

## 👨‍💻 **Maintainers & Credits**

**Author:** Sheikh Muhammad Sabih
**Email:** [sabih.sk1@gmail.com](mailto:sabih.sk1@gmail.com)

> Built with ❤️ for scalability, team collaboration, and real-world production environments.

---

## 🏁 **License**

This project is licensed under the **MIT License** — free to use and modify in personal and commercial projects.