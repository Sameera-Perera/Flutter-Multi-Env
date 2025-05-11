# 🧱 Flutter Clean Architecture with BLoC

This guide outlines the structure and components of a Flutter application following the principles of Clean Architecture, utilizing the BLoC (Business Logic Component) pattern for state management.

---

## 📂 Project Structure Overview

The application is organized into the following layers:

- **core/**: Contains shared utilities, constants, and base classes used across the app.
- **domain/**: Houses the business logic, including entities, use cases, and repository interfaces.
- **data/**: Manages data sources, models, and repository implementations.
- **presentation/**: Handles the UI components, BLoC classes, and user interactions.

---

## 🧠 Core Layer

The `core` layer includes:

- **constants/**: Application-wide constant values.
- **errors/**: Custom exception classes and error handling mechanisms.
- **usecases/**: Base classes for use cases to ensure consistency.
- **utils/**: Utility functions and helpers used throughout the app.

---

## 🏗️ Domain Layer

The `domain` layer is the heart of the application, containing:

- **entities/**: Core data models that represent business objects.
- **repositories/**: Abstract classes defining the contracts for data operations.
- **usecases/**: Specific business logic operations that interact with repositories.

---

## 🗄️ Data Layer

The `data` layer implements the contracts defined in the domain layer:

- **models/**: Data models that extend domain entities and include serialization logic.
- **datasources/**: Classes responsible for fetching data from APIs, databases, etc.
- **repositories/**: Concrete implementations of the domain repository interfaces.

---

## 🎨 Presentation Layer

The `presentation` layer manages the user interface and state:

- **blocs/**: BLoC classes that handle state management and business logic.
- **pages/**: UI screens and widgets that present data to the user.
- **widgets/**: Reusable UI components.

---

## 🔄 BLoC Pattern Integration

The BLoC pattern is used to manage the state of the application:

1. **Events**: User interactions or other triggers are represented as events.
2. **BLoC**: Receives events and processes them, emitting new states.
3. **States**: The UI reacts to new states emitted by the BLoC.

This separation ensures a clear flow of data and enhances testability.

---

## 🧪 Test-Driven Development (TDD)

The application emphasizes writing tests before implementing functionality:

- **Unit Tests**: Test individual functions and classes in isolation.
- **Widget Tests**: Test UI components and their interactions.
- **Integration Tests**: Test the complete flow of the application.

This approach ensures reliability and facilitates maintenance.

---