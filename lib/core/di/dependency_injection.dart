import 'package:ecommerce_fruits/core/cubit/products_cubit.dart';
import 'package:ecommerce_fruits/core/repos/products_repo.dart';
import 'package:ecommerce_fruits/core/repos/products_repo_impl.dart';
import 'package:ecommerce_fruits/core/service/database_service.dart';
import 'package:ecommerce_fruits/core/service/firebase_auth_service.dart';
import 'package:ecommerce_fruits/core/service/firestore_service.dart';
import 'package:ecommerce_fruits/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signin/signin_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_fruits/features/main/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Signup
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));

  // Signin
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt<AuthRepo>()));

  // Bottom Navigation Bar
  getIt.registerFactory<BottomNavigationBarCubit>(
    () => BottomNavigationBarCubit(),
  );

  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepo>()),
  );
}
