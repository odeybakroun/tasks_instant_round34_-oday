import 'package:r34_21/core/error/messages.dart';
import 'package:r34_21/features/products/domain/entities/product.dart';
import 'package:r34_21/features/products/domain/usecase/create_product.dart';
import 'package:r34_21/features/products/domain/usecase/delete_product.dart';
import 'package:r34_21/features/products/domain/usecase/get_all_product.dart';
import 'package:r34_21/features/products/domain/usecase/get_product.dart';
import 'package:r34_21/features/products/domain/usecase/update_product.dart';

class ProductConsoleService with MapFailureMessages {
  final GetAllProducts getAllProductsUseCase;
  final GetProduct getProductUseCase;
  final CreateProduct createProductUseCase;
  final UpdateProduct updateProductUseCase;
  final DeleteProduct deleteProductUseCase;

  ProductConsoleService({
    required this.getAllProductsUseCase,
    required this.getProductUseCase,
    required this.createProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase,
  });

  Future<void> displayAllProducts() async {
    print("تم الدخول");
    final result = await getAllProductsUseCase();
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (products) {
        if (products.isEmpty) {
          print('No products found.');
          return;
        }
        print('\n=== PRODUCTS ===');
        for (final product in products) {
          print('ID: ${product.id}');
          print('Name: ${product.name}');
          print('Description: ${product.description}');
          print('Price: \$${product.price.toStringAsFixed(2)}');
          print('---');
        }
      },
    );
  }

  Future<void> displayProduct(String id) async {
    final result = await getProductUseCase(Getproductparams(id: id));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (product) => print('''
      === PRODUCT DETAILS ===
      ID: ${product.id}
      Name: ${product.name}
      Description: ${product.description}
      Price: \$${product.price.toStringAsFixed(2)}
      '''),
    );
  }

  Future<void> createProduct(String name, String description, double price) async {
    final product = Product(
      id: '',
      name: name,
      description: description,
      price: price,
    );

    final result =
        await createProductUseCase(Createproductparams(product: product));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newProduct) =>
          print('Product created successfully with ID: ${newProduct.id}'),
    );
  }

  Future<void> updateProduct(
      String id, String name, String description, double price) async {
    final product = Product(
      id: id,
      name: name,
      description: description,
      price: price,
    );

    final result =
        await updateProductUseCase(UpdateProductparams(product: product));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedProduct) => print('Product updated successfully'),
    );
  }

  Future<void> deleteProduct(String id) async {
    final result = await deleteProductUseCase(DeleteProductparams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(
        success ? 'Product deleted successfully' : 'Product not found',
      ),
    );
  }
}