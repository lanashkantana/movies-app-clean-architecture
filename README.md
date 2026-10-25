# 🎬 Movies App — Flutter Clean Architecture

A Flutter movies app built with **Clean Architecture** and **BLoC**, powered by the [TMDB API](https://developer.themoviedb.org/docs). Browse what's now playing, popular and top-rated movies, then open any movie to see its details and recommendations.

## ✨ Features

- 🎞️ **Now Playing** carousel, plus **Popular** and **Top Rated** lists
- 📄 **Movie details**: backdrop, genres, release year, rating, runtime and overview
- 🎯 **Recommendations** grid for every movie
- ⏳ Loading placeholders (shimmer), cached images and smooth entrance animations
- ⚠️ Error states handled functionally with `Either<Failure, T>`

## 🏗️ Architecture

The project follows Clean Architecture with three layers. Dependencies point inward only: **presentation → domain ← data**.

```
lib/
├── core/
│   ├── error/            # Exceptions & Failures
│   ├── network/          # API constants & error message model
│   ├── services/         # Dependency injection (GetIt) — services_locator.dart
│   ├── usecase/          # Base use case contract
│   └── utils/            # Constants & enums
├── movies/
│   ├── data/
│   │   ├── datasource/   # Remote data source (Dio)
│   │   ├── models/       # JSON models (fromJson) extending domain entities
│   │   └── repository/   # Repository implementation
│   ├── domain/
│   │   ├── entities/     # Pure Dart objects
│   │   ├── repository/   # Abstract repository contract
│   │   └── usecases/     # One use case per action
│   └── presentation/
│       ├── components/   # Reusable UI widgets (Now Playing, Popular, Top Rated)
│       ├── controller/   # BLoCs: events, states, bloc classes
│       └── screens/      # Movies screen & Movie details screen
└── main.dart
```

### How a request flows

```
UI ──event──▶ BLoC ──▶ UseCase ──▶ Repository (contract)
                                        │
                              Repository (implementation)
                                        │
                              Remote Data Source (Dio) ──▶ TMDB API
```

1. The UI dispatches an **event** to a BLoC.
2. The BLoC calls a **use case** from the domain layer.
3. The use case talks to the **repository contract**; the data layer implements it.
4. The repository returns `Either<Failure, T>`, and the BLoC emits a new **state** (`loading`, `loaded` or `error`).

## 🛠️ Tech Stack

| Purpose | Package |
| --- | --- |
| State management | `flutter_bloc`, `bloc` |
| Networking | `dio` |
| Dependency injection | `get_it` |
| Functional error handling | `dartz` (`Either`) |
| Value equality | `equatable` |
| UI & animations | `cached_network_image`, `carousel_slider`, `shimmer`, `animate_do`, `google_fonts` |

## 🚀 Getting Started

**Prerequisites:** Flutter SDK (Dart `^3.9.0`) and a free [TMDB API key](https://www.themoviedb.org/settings/api).

```bash
# 1. Clone the repository
git clone https://github.com/lanashkantana/movies-app-clean-architecture.git
cd movies-app-clean-architecture

# 2. Install dependencies
flutter pub get

# 3. Add your TMDB API key in lib/core/network/api_constance.dart

# 4. Run the app
flutter run
```

## 👩‍💻 Author

**Lana** — [@lanashkantana](https://github.com/lanashkantana)
