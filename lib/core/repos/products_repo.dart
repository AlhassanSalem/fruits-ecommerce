import 'package:dartz/dartz.dart';
import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/error/failures.dart';

abstract class ProductsRepo {
  
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
