class colorsdata {
  String? status;
  List<String>? coloursdata;
  List<String>? apdId;

  colorsdata({this.status, this.coloursdata, this.apdId});

  colorsdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    coloursdata = json['coloursdata'].cast<String>();
    apdId = json['apd_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['coloursdata'] = this.coloursdata;
    data['apd_id'] = this.apdId;
    return data;
  }
}