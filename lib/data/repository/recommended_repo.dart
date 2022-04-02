import 'package:food_deliver/data/api/api_client.dart';
import 'package:food_deliver/utils/app_constats.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstats.RECOMMENDED_PRODUCT_URI);
  }
}
