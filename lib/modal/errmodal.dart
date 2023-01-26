class Datamodal {
  String? status;
  int? quantity;

  Datamodal({this.status, this.quantity});

  Datamodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['quantity'] = this.quantity;
    return data;
  }
}