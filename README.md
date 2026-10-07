# Shoe Shopping App

A Flutter shopping app for browsing shoes, choosing a size, and managing a cart. Cart state is shared across screens with the [Provider](https://pub.dev/packages/provider) package.

## Features
- **Browse products:** a scrollable catalog of shoes with images and prices.
- **Filter by brand:** tap a chip (All, Adidas, Nike, Bata) to narrow the list.
- **Search:** type in the search bar to filter products by name.
- **Size selection:** choose a size on the product page. Adding to the cart without one shows a prompt.
- **Cart management:** view cart items with their sizes, and remove an item after confirming in a dialog.
- **Shared state:** the cart lives in a `ChangeNotifier` (`CartProvider`), so every screen updates as soon as it changes.

## Tech stack
- **Framework:** Flutter (Material 3)
- **Language:** Dart (SDK ^3.6)
- **State management:** Provider (`ChangeNotifierProvider`)
- **Testing:** `flutter_test` (unit tests and widget tests)

## Project structure
```
lib/
  main.dart                      App entry point, theme, CartProvider setup
  global_variables.dart          Product catalog data
  providers/cart_provider.dart   Cart state (add / remove, notifies listeners)
  pages/
    home_page.dart               Bottom navigation: catalog and cart tabs
    product_details_page.dart    Product image, price, size picker, "Add to cart"
    cart_page.dart               Cart list with delete confirmation
  widgets/
    product_list.dart            Catalog with brand filter chips and search
    product_card.dart            Single product tile
test/
  cart_provider_test.dart        Unit tests for the cart state
  widget_test.dart               Widget tests: listing, filtering, search, add-to-cart flow
```

## Getting started
Prerequisites: the [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart 3.6 or later).

```bash
git clone https://github.com/omwaikar1/Shopping-App.git
cd Shopping-App
flutter pub get
flutter run          # choose a connected device, simulator, or Chrome
```

## Running tests
```bash
flutter analyze
flutter test
```
