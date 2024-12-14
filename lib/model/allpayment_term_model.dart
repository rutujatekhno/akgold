class AllPaymentTermsModel {
  int? paymentTermsId;
  String? name;
  int? days;

  AllPaymentTermsModel({this.paymentTermsId, this.name, this.days});

  AllPaymentTermsModel.fromJson(Map<String, dynamic> json) {
    paymentTermsId = json['payment_terms_id'];
    name = json['name'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_terms_id'] = this.paymentTermsId;
    data['name'] = this.name;
    data['days'] = this.days;
    return data;
  }
}
