import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/providers/cart_provider.dart';

void main() {
  final shoe = <String, dynamic>{'id': '0', 'title': 'Test Shoe', 'size': 9};

  test('cart starts empty', () {
    expect(CartProvider().cart, isEmpty);
  });

  test('addProduct adds the item and notifies listeners', () {
    final cart = CartProvider();
    var notified = 0;
    cart.addListener(() => notified++);

    cart.addProduct(shoe);

    expect(cart.cart, [shoe]);
    expect(notified, 1);
  });

  test('removeProduct removes the item and notifies listeners', () {
    final cart = CartProvider()..addProduct(shoe);
    var notified = 0;
    cart.addListener(() => notified++);

    cart.removeProduct(shoe);

    expect(cart.cart, isEmpty);
    expect(notified, 1);
  });
}
