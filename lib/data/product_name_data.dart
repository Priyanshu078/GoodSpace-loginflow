class ProductNameData {
  List<Data>? data;
  int? status;

  ProductNameData({this.data, this.status});

  ProductNameData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  String? displayName;
  String? productName;

  Data({this.displayName, this.productName});

  Data.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['productName'] = productName;
    return data;
  }
}
