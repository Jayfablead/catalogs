class CartModal {
  String? status;
  List<CartProducts>? cartProducts;

  CartModal({this.status, this.cartProducts});

  CartModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['cart_products'] != null) {
      cartProducts = <CartProducts>[];
      json['cart_products'].forEach((v) {
        cartProducts!.add(new CartProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.cartProducts != null) {
      data['cart_products'] =
          this.cartProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartProducts {
  String? prodName;
  String? apColorName;
  int? maxQuantity;
  String? prodSize;
  int? cartQuantity;

  CartProducts(
      {this.prodName,
        this.apColorName,
        this.maxQuantity,
        this.prodSize,
        this.cartQuantity});

  CartProducts.fromJson(Map<String, dynamic> json) {
    prodName = json['prod_name'];
    apColorName = json['ap_color_name'];
    maxQuantity = json['max_quantity'];
    prodSize = json['prod_size'];
    cartQuantity = json['cart_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prod_name'] = this.prodName;
    data['ap_color_name'] = this.apColorName;
    data['max_quantity'] = this.maxQuantity;
    data['prod_size'] = this.prodSize;
    data['cart_quantity'] = this.cartQuantity;
    return data;
  }
}