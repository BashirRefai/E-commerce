import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_f1/core/network/api_urls.dart';
import 'package:ecommerce_f1/features/home/data/models/categories_model.dart';
import 'package:ecommerce_f1/features/home/data/models/product_model.dart';
import 'package:ecommerce_f1/features/home/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDataSource {
  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      var url = Uri.parse(ApiUrls.getAllCategories);
      var response = await http.get(url);
      final List<CategoryModel> categoriesList = [];
      //print(response.body);
      if (response.statusCode == 200) {
        var resBody = jsonDecode(response.body);
        for (var items in resBody) {
          categoriesList.add(
            CategoryModel(
              id: items['id'],
              name: items['name'],
              image: items['image'],
            ),
          );
        }
        //print(categoriesList[0].name);
        return Right(categoriesList);
      } else {
        return const Right([]);
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    try {
      var url = Uri.parse(ApiUrls.getAllProducts);

      var response = await http.get(url);

      final List<ProductModel> productList = [];
      final List<String> images = [];
      //print(response.body);
      if (response.statusCode == 200) {
        var resBody = jsonDecode(response.body);

        for (var image in resBody) {
          images.add('${image['images']}');
        }
        for (var items in resBody) {
          var category = CategoryModel(
            id: items['category']['id'],
            name: items['category']['name'],
            image: items['category']['image'],
          );
          print(category.name);
          productList.add(
            ProductModel(
                id: items['id'],
                title: items['title'],
                price: items['price'],
                description: items['description'],
                images: images,
                categories: category),
          );
        }

        print(images[0]);
        return Right(productList);
      }
      return const Right([]);
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, CategoryModel>> getCategoryById(int id) async {
    try {
      var url = Uri.parse('${ApiUrls.getAllCategories}/$id');

      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        var resBody = jsonDecode(response.body);
        final category = CategoryModel.fromMap(resBody);

        print(category.name);
        return Right(category);
      }

      return Right(CategoryModel(id: -1, name: '', image: ''));
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, ProductModel>> getProductById(int id) async {
    try {
      var url = Uri.parse('${ApiUrls.getAllProducts}/$id');

      var response = await http.get(url);
      //print(response.body);
      if (response.statusCode == 200) {
        print('dddddddd');
        var resBody = jsonDecode(response.body);
        final product = ProductModel.fromMap(resBody);

        print(product.images[0]);
        return Right(product);
      }

      return Right(
        ProductModel(
          id: -1,
          title: '',
          price: -1,
          images: [],
          description: '',
          categories: CategoryModel(id: -1, name: '', image: ''),
        ),
      );
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, ProfileModel>> getProfile(String token) async {
    try {
      var url = Uri.parse(ApiUrls.profile);
      var response = await http.get(url, 
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        var resBody = jsonDecode(response.body);

        final profile = ProfileModel.fromMap(resBody);
        print(profile.role);
        return Right(profile);
      } else {
        return Left('');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}

void main() {
  HomeRemoteDataSource dataSource = HomeRemoteDataSource();
}
