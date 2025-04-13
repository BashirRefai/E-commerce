// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_this

import 'package:ecommerce_f1/features/home/data/models/categories_model.dart';
import 'package:ecommerce_f1/features/home/data/models/product_model.dart';
import 'package:ecommerce_f1/features/home/data/models/profile_model.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';

class HomePageState {
  final List<CategoryModel>? categires;
  final IsLoadingType? isLoading;
  final ErrorType? errorType;
  final CategoryModel? category;
  final ProductModel? product;
  final List<ProductModel>? products;

  final ProfileModel? profile;
  HomePageState({
    this.categires,
    this.products,
    this.category,
    this.product,
    this.profile,
    this.isLoading,
    this.errorType,
  });


  HomePageState copyWith({
    List<CategoryModel>? categires,
    IsLoadingType? isLoading,
    ErrorType? errorType,
    CategoryModel? category,
    ProductModel? product,
    List<ProductModel>? products,
    ProfileModel? profile,
  }) {
    return HomePageState(
      categires: categires ?? this.categires,
      isLoading: isLoading ?? IsLoadingType.none,
      errorType: errorType ?? ErrorType.none,
      category: category ?? this.category,
      product: product ?? this.product,
      products: products ?? this.products,
      profile: profile ?? this.profile,
    );
  }
}
