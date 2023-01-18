// {
//         "ap_id": "1",
//         "ap_name": "     RUFFTY TIPPING",
//         "description": "",
//         "created_time": "2022-12-30 18:06:36"   
//     },



class Prodmodal {
  String? status;
  List<ProductData>? productData;

  Prodmodal({this.status, this.productData});

  Prodmodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.productData != null) {
      data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? apId;
  String? apName;
  String? description;
  String? createdTime;

  ProductData({this.apId, this.apName, this.description, this.createdTime});

  ProductData.fromJson(Map<String, dynamic> json) {
    apId = json['ap_id'];
    apName = json['ap_name'];
    description = json['description'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ap_id'] = this.apId;
    data['ap_name'] = this.apName;
    data['description'] = this.description;
    data['created_time'] = this.createdTime;
    return data;
  }
}