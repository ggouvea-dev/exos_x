import 'dart:async';

import 'package:exos_repository/exos_repository.dart';
import 'package:exos_repository/src/exos_deletable_repository.dart';
import 'package:test/test.dart';

void main() {
 final repository = ProductRepository();
  test('find by id', () async {
    final product = await repository.findById(1);
    expect('A product', product.title);
  });
  test('find all', () async {
    final productsDb = await repository.findAll();
    expect(productsStorage.length, productsDb.length);
  });
  test('save a product', () async {
    final succsess = await repository.save(Product(3, 'C product'));
    expect(productsStorage.length, 3);
    expect(succsess, true);
  });
  test('save all products', () async {
    final productD = Product(4, 'D product');
    final productE = Product(5, 'E product');
    final success = await repository.salveAll([productD, productE]);
    expect(true, success);
    expect(5, productsStorage.length);
  });
  test('Delete by id', () async {
    final removedId = await repository.deletById(5);
    expect(5, removedId);
    expect(4, productsStorage.length);
  });
  test('Delete all ', () async {
    final removedIds = await repository.deleteAll();
    expect(4, removedIds.length);
    expect(0, productsStorage.length);
  });
}

class Product {
  final int id;
  final String title;

  Product(this.id, this.title);
}

final productsStorage = [
  Product(1, 'A product'),
  Product(2, 'B prodcut')
];


abstract class IProductRepository extends Repository<Product, int> with DeletableRepository<Product, int> {}

class ProductRepository implements IProductRepository {
  @override
  FutureOr<List<Product>> findAll() => productsStorage;

  @override
  FutureOr<Product> findById(int id) => productsStorage.firstWhere((prod) => prod.id == id);

  @override
  FutureOr<bool> salveAll(List<Product> products) {
    productsStorage.addAll(products);
    return true;
  }

  @override
  FutureOr<bool> save(Product product) {
   productsStorage.add(product);
   return true;
  }

  @override
  FutureOr<int> deletById(int id) {
    productsStorage.removeWhere((prod) => prod.id == id);
    return id;
  }

  @override
  FutureOr<List<int>> deleteAll() {
    List<int> removedIds = [];
    productsStorage.removeWhere((prod) {
      removedIds.add(prod.id);
      return true;
    });
    return removedIds;
  }

}