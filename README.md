# Flutter Machine Test – Softroniics

A simple e-commerce application built using Flutter. The application allows users to browse products, view product details, search products by title, and manage their shopping cart.

## Features

- **Product Listing:** Fetch and display products from the Fake Store API.
- **Product Details:** View product images, titles, prices, categories, and descriptions.
- **Search Products:** Search products by title.
- **Shopping Cart:** Add products to the cart and remove selected products.
- **Cart Total:** Calculate the total price of products in the cart.
- **Login UI:** Simple login screen design.
- **Responsive UI:** Clean and user-friendly interface.

## Technologies Used

- Flutter
- Dart
- Provider – State management
- REST API
- HTTP – API integration
- Fake Store API – Product data

## API Used

Fake Store API:

https://fakestoreapi.com/products

## Project Structure

```text
lib/
├── core/
│   └── api_services.dart
├── model/
│   └── products_model.dart
├── provider/
│   ├── product_provider.dart
│   └── cart_provider.dart
├── screens/
│   ├── product_home_page.dart
│   ├── product_details_page.dart
│   ├── cart_page.dart
│   └── login_page.dart
└── main.dart
```

*Note: Update the folder and file names above if your actual project structure differs.*

## Getting Started

### Prerequisites

- Flutter SDK installed
- Dart SDK
- Android Studio or Visual Studio Code
- An emulator or physical device

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Aslam-flutter/machine_test_SOFTRONIICS.git
   ```

2. Navigate to the project directory:

   ```bash
   cd machine_test_SOFTRONIICS
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Test Login Credentials

Use the following credentials to access the application, if login authentication is enabled.

- **Email:** `user@gmail.com`
- **Password:** `user123`

These are test credentials provided for evaluation purposes only.

## Author

**Muhammad Aslam**  
Flutter Developer

GitHub: https://github.com/Aslam-flutter

## Repository

https://github.com/Aslam-flutter/machine_test_SOFTRONIICS

---

Thank you for reviewing my Flutter machine test project.
