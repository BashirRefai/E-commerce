import 'package:ecommerce_f1/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState(categires: []));


 final HomeRemoteDataSource _homeRemoteDataSource = HomeRemoteDataSource();
  initHomage() async {
    Future.wait<void>([
      getCategories(),
      getProducts(),
      getProfile(),
    ]);
  }

  getCategories() async {
    emit(state.copyWith(isLoading: IsLoadingType.isLoadingCategories));
    final categories = await _homeRemoteDataSource.getAllCategories();
    categories.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorCategories));
    }, (categories) {
      emit(state.copyWith(categires: categories));
    });
  }

  getProducts() async {
    emit(state.copyWith(isLoading: IsLoadingType.isLoadingProducts));
    final products = await _homeRemoteDataSource.getAllProduct();
    products.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorProducts));
    }, (products) {
      emit(state.copyWith(products: products));
    });
  }

  getCategoryById(int id) async {
    emit(state.copyWith(isLoading: IsLoadingType.isLoadingCategory));
    final category = await _homeRemoteDataSource.getCategoryById(id);
    category.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorCategory));
    }, (category) {
      emit(state.copyWith(category: category));
    });
  }

  getProductById(int id) async {
    emit(state.copyWith(isLoading: IsLoadingType.isLoadingProduct));
    final product = await _homeRemoteDataSource.getProductById(id);
    product.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorProduct));
    }, (product) {
      emit(state.copyWith(product: product));
    });
  }

  getProfile() async {
    emit(state.copyWith(isLoading: IsLoadingType.isProfile));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final profile = await _homeRemoteDataSource.getProfile(token!);

    profile.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorProfile));
    }, (profile) {
      emit(state.copyWith(profile: profile));
    });
  }

  deleteItem(int index) {}
}
