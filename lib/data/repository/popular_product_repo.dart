import 'package:food_deliver/data/api/api_client.dart';
import 'package:food_deliver/utils/app_constats.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstats.POPULAR_PRODUCT_URI);
  }
}
