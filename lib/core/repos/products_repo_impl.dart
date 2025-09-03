import 'package:dartz/dartz.dart';
import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/error/failures.dart';
import 'package:ecommerce_fruits/core/models/product_model.dart';
import 'package:ecommerce_fruits/core/repos/products_repo.dart';
import 'package:ecommerce_fruits/core/service/backend_endpoints.dart';
import 'package:ecommerce_fruits/core/service/database_service.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  const ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final response =
          await databaseService.getData(
                path: BackendEndpoints.getAllProductsEndPoint,
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = response
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to fetch products'));
    }
  }

  
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoints.getBestSellingProductsEndPoint,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
