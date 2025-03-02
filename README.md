# Garage Manager Flutter App

This project is a simple example I created to study [Flutter](https://flutter.dev/). [It consumes a CRUD (Create, Read, Update, Delete) API made by me](https://github.com/9gods/garage-crud-dart), for managing cars. Using Clean Architecture, it demonstrates best practices for developing Flutter apps.

---

## Features

- **Clean Architecture based (domain, data and presentation).**
- **Create, read, update, and delete cars.**
- **Modular organization:** Each layer has a single responsibility.
- **Custom Widgets:** Custom Widgets to match the [Figma prototype](https://www.figma.com/design/SInDSnS640wCe7nsn0Kxnq/Garage-Manager-Prototype?node-id=6-140&t=5NyccnikeZLgW5er-1) design system.

---

## Dependencies Used

  - **google_fonts**: For customized fonts.
  - **http**: For http reqs.
  - **flutter_lucide**: For icons.
  - **url_launcher**: To open external links.

---

## Project Structure

The project is organized following best practices to ensure scalability and maintainability:

```bash
/garage-manager-flutter                      # Root folder of the Flutter project
├── assets                                   # Contains image and other static assets
│   ├── Logo.png                             
│   └── LogoNarrow.png                       
├── lib                                  # Main source code directory
│   ├── data                             # Data layer (repository implementations, data sources)
│   │   └── repositories                    # Repository implementations
│   │       └── car_repository_impl.dart     # Concrete repository class for Car
│   ├── domain                           # Domain layer (business rules and core logic)
│   │   ├── entities                       # Core data models/entities
│   │   │   └── car_entity.dart              # Car entity definition
│   │   ├── repositories                   # Abstract repository interfaces
│   │   │   └── car_repository.dart          # Car repository contract
│   │   └── use-cases                      # Individual business use cases
│   │       ├── create_car.dart              # Use case to create a new car
│   │       ├── delete_car.dart              # Use case to delete an existing car
│   │       ├── get_all_cars.dart            # Use case to retrieve all cars
│   │       ├── get_car_by_id.dart           # Use case to retrieve a car by ID
│   │       ├── get_cars_by_brand.dart       # Use case to retrieve cars by brand
│   │       ├── get_cars_by_year.dart        # Use case to retrieve cars by year
│   │       └── update_car.dart              # Use case to update an existing car
│   ├── presentation                     # Presentation layer (UI)
│   │   ├── pages                          # Individual screens/routes
│   │   │   ├── about_this_app_page.dart     # "About this app" screen
│   │   │   ├── car_detail_page.dart         # Displays details of a selected car
│   │   │   ├── car_form_page.dart           # Form to create or edit a car
│   │   │   └── home_page.dart               # Main/home screen of the app
│   │   └── widgets                        # Reusable UI components and widgets
│   │       ├── colors
│   │       │   └── app_colors.dart          # Centralized color definitions
│   │       ├── primitives
│   │       │   ├── custom_logo.dart         # Widget for displaying normal or narrow logo
│   │       │   ├── dropdown_menu_button_item.dart   # Button item for dropdown menu
│   │       │   ├── dropdown_menu.dart       # Dropdown menu widget
│   │       │   └── no_data_found.dart       # Widget displayed when no data is found
│   │       ├── floating_app_bar.dart        # Custom floating AppBar
│   │       └── general_card.dart            # Reusable card widget
│   └── main.dart                            # Application entry point (Flutter's main function)
├── pubspec.yaml                             # Project dependencies and configuration
└── README.md                                # Documentation and usage instructions

```

---

## Setup and Execution

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/9gods/garage-manager-flutter.git
   cd garage-manager-flutter
   ```
2. Install the dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

To start the app, run:
```bash
flutter run
```

---

## Contributing

Feel free to:
1. Fork the repository.
2. Create a branch for your modifications.
3. Submit a Pull Request with improvements, fixes, or new features.

---

## License

This project is licensed under the [MIT License](LICENSE).

---