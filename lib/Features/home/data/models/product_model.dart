import 'package:accessories_store/generated/app_images.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable{

   final String image;
   final String title;
   final num price;

  const ProductModel({required this.image, required this.title, required this.price});

  @override
  List<Object?> get props => throw UnimplementedError();
}
List<ProductModel> products = [
  ProductModel(image: Assets.imagesPnvFrawalla, title: "Frawalla", price: 30),
  ProductModel(image: Assets.imagesPnvFrawalla, title: "Frawalla", price: 50),
  ProductModel(image: Assets.imagesPnvFrawalla, title: "Frawalla", price: 100),
  ProductModel(image: Assets.imagesPnvFrawalla, title: "Frawalla", price: 30),
  ProductModel(image: Assets.imagesPnvFrawalla, title: "Frawalla", price: 30),
  ProductModel(image: Assets.imagesPnvFrawalla, title: "Frawalla", price: 30),
];