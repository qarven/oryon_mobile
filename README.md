# Oryon Mobile

A new Flutter project.

## LINKS

- https://storyset.com/
- https://melos.invertase.dev/
- https://theme.ionicerrrrscode.com/generator
- https://www.figma.com/design/u54KmPf8rkg7koHkbqODRO/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3917-829&p=f&t=QF2RroiKXF1Xaie0-0

## Feature Module Architecture

Organize each feature under `features/<name>` using the following structure:

```text
features/<name>/
├── data/
│   ├── adapters/
│   ├── datasources/
│   └── models/
├── domain/
│   ├── entities/
│   ├── repositories/
│   ├── use_cases/
│   └── value_objects/
├── module.dart
├── presentation/
│   ├── bloc/
│   ├── pages/
│   └── widgets/
└── services/
```

### 1. Architecture Principles

Use a feature-first structure with clear separation of responsibilities. Each feature owns its business rules, data access implementation, dependency registration, and user interface.

Follow these principles:

- **Domain independence:** Business rules must not depend on Flutter, BLoC, databases, HTTP clients, or other infrastructure.
- **Dependency direction:** Outer layers may depend on inner layers, but inner layers must not depend on outer layers.
- **Explicit boundaries:** Use repository contracts to separate business logic from data access.
- **Minimal abstractions:** Add a class or layer only when it serves a concrete responsibility.
- **Feature ownership:** Keep feature-specific code inside its feature. Share code only when it is genuinely reusable.

### 2. Directory Responsibilities

#### `services/`

Holds infrastructure-facing services shared within the feature, such as session state and persisted flags. They wrap platform APIs rather than encoding business rules.

Services may depend on domain contracts and use cases. They must not become a second location for business rules already owned by the domain, and they must not reach into `data/` or `presentation/` directly.

#### `data/`

Implements data access and translates external data into representations used by the application.

- **`adapters/`** — Bridges incompatible interfaces or converts between external APIs, SDKs, infrastructure services, and domain contracts.
- **`datasources/`** — Reads and writes data through external systems, such as REST/gRPC/ConnectRPC APIs, local databases, files, or platform services.
- **`models/`** — Represents external or persisted data formats, including serialization and deserialization when needed.

Data implementations satisfy repository contracts defined in the domain layer.

Keep network requests, database queries, serialization, and infrastructure-specific error handling out of domain entities and use cases.

Do not create separate models for every entity automatically. Add data models when external or persisted representations differ from the domain representation or require their own serialization behavior.

#### `domain/`

Contains the feature's business rules and the contracts required to execute them. Keep this layer independent of infrastructure and UI frameworks.

- **`entities/`** — Represents business concepts with identity and lifecycle, where applicable. Entities enforce their own invariants.
- **`repositories/`** — Defines abstract contracts for accessing or persisting domain data. Implementations belong in `data/`.
- **`use_cases/`** — Represents specific business actions, such as retrieving a profile, submitting an order, or updating preferences. Each use case should have a clear purpose.
- **`value_objects/`** — Represents values defined by their contents rather than identity, such as an email address or a validated monetary amount.

Keep business validation and rules in the domain when they are independent of UI and infrastructure.

Avoid creating a use case for every trivial method. Add one when it provides meaningful business behavior, orchestration, or a clear application boundary.

#### `presentation/`

Contains UI components and presentation state management.

- **`bloc/`** — Contains BLoCs, events, states, or Cubits that manage presentation state and respond to user actions.
- **`pages/`** — Contains route-level screens that compose widgets and connect user interactions to presentation logic.
- **`widgets/`** — Contains reusable UI components scoped to the feature.

Presentation code may depend on domain use cases and presentation-specific helpers. It must not access datasources or database clients directly.

Keep widgets focused on rendering and interaction. Move substantial business rules out of BLoCs and widgets into the domain layer.

#### `module.dart`

Defines the feature's composition boundary and dependency registration.

Use it to register the feature's dependencies and expose the entry points required by the rest of the application, following the project's existing dependency-injection and routing conventions.

Keep feature wiring here rather than scattering registration across unrelated files.

Do not turn `module.dart` into a general-purpose service locator or a place for business logic.

### 3. Dependency Rules

Use the following dependency direction:

```text
presentation ──► domain
data ──────────► domain

module.dart ───► wires the feature's dependencies
```

The domain layer must not import `data`, `presentation`, or `services/`.

More specifically:

1. Presentation calls domain use cases rather than accessing datasources directly.
2. Use cases depend on domain entities and repository contracts.
3. Data implementations implement domain repository contracts.
4. Datasources handle infrastructure access and return data in appropriate external or data-layer representations.
5. Adapters translate between interfaces or representations when necessary.
6. Dependency registration connects abstractions to their implementations at the feature boundary.

The arrows represent allowed compile-time dependencies, not runtime call order. Runtime calls may flow back through an injected abstraction without reversing the dependency rule.

### 4. Typical Request Flow

For a feature that retrieves data from an API, the flow is:

```text
Page
  ↓
BLoC / Cubit
  ↓
Use case
  ↓
Domain repository contract
  ↑
Data repository implementation
  ↓
Datasource
  ↓
External API
```

The repository implementation is injected into the use case through the domain repository contract.

The datasource response is mapped into the representation required by the domain. The result then flows back through the use case and BLoC to update the UI.

For simpler operations, follow the existing project conventions and avoid adding unnecessary classes.

### 5. Implementation Guidelines

When adding or modifying a feature:

- Inspect neighboring features and follow their established conventions.
- Keep changes scoped to the feature unless a shared contract or component genuinely needs updating.
- Prefer existing packages and shared utilities over introducing dependencies.
- Do not duplicate domain rules across BLoCs, services, and use cases.
- Avoid unnecessary interfaces, adapters, mappers, and wrapper classes.
- Keep public exports and dependency registration explicit.
- Do not hand-edit generated files; update their source and use the established generation workflow.
- Update existing tests when the change affects them. Do not create new tests unless the user explicitly requests them.
- Run relevant existing checks and report any checks that were not run.

**Rule of thumb:** Put business rules in `domain/`, infrastructure implementations in `data/`, UI state and widgets in `presentation/`, infrastructure-facing services in `services/`, and dependency wiring in `module.dart`.
