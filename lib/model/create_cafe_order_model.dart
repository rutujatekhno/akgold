class CreateCafeOrderModel {
  int? cafeId;
  int? routeId;
  String? orderNumber;
  String? orderDate;
  int? totalAmount;
  int? tax;
  int? deliveryCharges;
  int? paymentStatus;
  int? paymentTermId;
  List<Products>? products;

  CreateCafeOrderModel(
      {this.cafeId,
        this.routeId,
        this.orderNumber,
        this.orderDate,
        this.totalAmount,
        this.tax,
        this.deliveryCharges,
        this.paymentStatus,
        this.paymentTermId,
        this.products});

  CreateCafeOrderModel.fromJson(Map<String, dynamic> json) {
    cafeId = json['cafe_id'];
    routeId = json['route_id'];
    orderNumber = json['order_number'];
    orderDate = json['order_date'];
    totalAmount = json['total_amount'];
    tax = json['tax'];
    deliveryCharges = json['delivery_charges'];
    paymentStatus = json['payment_status'];
    paymentTermId = json['payment_term_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafe_id'] = this.cafeId;
    data['route_id'] = this.routeId;
    data['order_number'] = this.orderNumber;
    data['order_date'] = this.orderDate;
    data['total_amount'] = this.totalAmount;
    data['tax'] = this.tax;
    data['delivery_charges'] = this.deliveryCharges;
    data['payment_status'] = this.paymentStatus;
    data['payment_term_id'] = this.paymentTermId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? description;
  int? quantity;
  int? rate;
  int? subTotalAmount;

  Products(
      {this.productId,
        this.description,
        this.quantity,
        this.rate,
        this.subTotalAmount});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    description = json['description'];
    quantity = json['quantity'];
    rate = json['rate'];
    subTotalAmount = json['sub_total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['rate'] = this.rate;
    data['sub_total_amount'] = this.subTotalAmount;
    return data;
  }
}
