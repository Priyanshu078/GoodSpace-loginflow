import 'package:dio/dio.dart';
import 'package:goodspacelogin/data/jobs_data.dart';
import 'package:goodspacelogin/data/product_name_data.dart';

class HomePageApi {
  final BASEURL = "https://api.ourgoodspace.com";
  Future<ProductNameData> getProductName() async {
    String endPoint = "/api/d2/manage_products/getInActiveProducts";
    var url = BASEURL + endPoint;
    var dio = Dio();
    var response = await dio.get(url,
        options: Options(headers: {
          "Authorization":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTYyMjYwNDY4MH0.ZQxGVUbEZFpSyRYNEeTQysh4fNomDM_RS5XUSqx7YyY",
        }));
    ProductNameData data = ProductNameData.fromJson(response.data);
    return data;
  }

  Future<JobsData> getJobsData() async {
    String endPoint = "/api/d2/member/dashboard/feed";
    var url = BASEURL + endPoint;
    var dio = Dio();
    var response = await dio.get(url,
        options: Options(headers: {
          "Authorization":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTYyMjYwNDY4MH0.ZQxGVUbEZFpSyRYNEeTQysh4fNomDM_RS5XUSqx7YyY",
        }));
    JobsData data = JobsData.fromJson(response.data);
    return data;
  }
}
