class MenuItem {
  String name;
  double price;
  double? discountPercent;

  MenuItem(this.name, this.price, this.discountPercent);

  double finalPrice() {
    final discount = discountPercent;

    if (discount != null) {
      return price - (price * discount / 100);
    }

    return price;
  }
}

void main() {
  List<MenuItem> menu = [
    MenuItem("Nasi Goreng", 35000, 20),
    MenuItem("Mie Ayam", 30000, 20),
    MenuItem("Es Teh", 5000, null),
  ];

  final names = menu.map((item) => item.name).toList();

  final cheapItems = menu.where((item) => item.finalPrice() < 15000).toList();

  final totalPrice = menu.fold(0.0, (total, item) => total + item.finalPrice(),
  );

  print(names);
  print(cheapItems.map((item) => item.name).toList());
  print(totalPrice);
}