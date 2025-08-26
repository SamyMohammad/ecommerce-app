import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/repo_impl/auth_repo_impl.dart';
import 'package:ecommerce_app/data/repo_impl/products_repo_impl.dart';
import 'package:ecommerce_app/data/repo_impl/sub_category_repo_impl.dart';
import 'package:ecommerce_app/data/repo_impl/washList_impl.dart';
import 'package:ecommerce_app/domain/repos/AuthRepo/auth_repo.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo/products_repo.dart';
import 'package:ecommerce_app/domain/repos/WahListRepo/wash_list_repo.dart';
import 'package:ecommerce_app/domain/repos/subCategoriesRepo/sub_category_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manger/signUp_cubit/sign_upcubit_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manger/sub_Categories_cubit/sub_category_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/manger/wash_list_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manger/products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/domain/repos/HomeRepo/home_repo.dart';

import '../../data/repo_impl/home_repo_impl.dart';
import '../../features/main_layout/home/presentation/manger/brand_cubit/brand_cubit.dart';
import '../../features/main_layout/home/presentation/manger/category_cubit/category_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. API Manager
  getIt.registerLazySingleton<ApiManger>(() => ApiManger(Dio()));

  // 2. Repository
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt<ApiManger>()));
  getIt.registerLazySingleton<SubCategoryRepo>(() => SubCategoryRepoImpl(getIt<ApiManger>()));
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepoImpl(getIt<ApiManger>()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt<ApiManger>()));
  getIt.registerLazySingleton<WashListRepo>(() => WashListImpl(getIt<ApiManger>()));

  // 3. Cubit
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt<HomeRepo>()));
  getIt.registerFactory<BrandCubit>(() => BrandCubit(getIt<HomeRepo>()));
  getIt.registerFactory<SubCategoryCubit>(() => SubCategoryCubit(getIt<SubCategoryRepo>()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt<ProductsRepo>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));
  getIt.registerFactory<WashListCubit>(() => WashListCubit(getIt<WashListRepo>()));



}
