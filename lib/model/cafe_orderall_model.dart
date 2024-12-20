class CafeOrdersModel {
  String? message;
  List<Orders>? orders;

  CafeOrdersModel({this.message, this.orders});

  CafeOrdersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? cafeOrderId;
  int? cafeId;
  String? cafeName;
  String? address;
  int? routeId;
  String? orderNumber;
  String? orderDate;
  int? totalAmount;
  int? tax;
  int? deliveryCharges;
  int? paymentStatus;
  String? note;
  int? deliveryStatus;
  int? cafeInvoiceId;
  int? cafeOrderDeliveryId;
  List<Products>? products;

  Orders(
      {this.cafeOrderId,
        this.cafeId,
        this.cafeName,
        this.address,
        this.routeId,
        this.orderNumber,
        this.orderDate,
        this.totalAmount,
        this.tax,
        this.deliveryCharges,
        this.paymentStatus,
        this.note,
        this.deliveryStatus,
        this.cafeInvoiceId,
        this.cafeOrderDeliveryId,
        this.products});

  Orders.fromJson(Map<String, dynamic> json) {
    cafeOrderId = json['cafe_order_id'];
    cafeId = json['cafe_id'];
    cafeName = json['cafe_name'];
    address = json['address'];
    routeId = json['route_id'];
    orderNumber = json['order_number'];
    orderDate = json['order_date'];
    totalAmount = (json['total_amount'] as num).toInt();
    tax = json['tax'];
    deliveryCharges = json['delivery_charges'];
    paymentStatus = json['payment_status'];
    note = json['note'];
    deliveryStatus = json['delivery_status'];
    cafeInvoiceId = json['cafe_invoice_id'];
    cafeOrderDeliveryId = json['cafe_order_delivery_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafe_order_id'] = this.cafeOrderId;
    data['cafe_id'] = this.cafeId;
    data['cafe_name'] = this.cafeName;
    data['address'] = this.address;
    data['route_id'] = this.routeId;
    data['order_number'] = this.orderNumber;
    data['order_date'] = this.orderDate;
    data['total_amount'] = this.totalAmount;
    data['tax'] = this.tax;
    data['delivery_charges'] = this.deliveryCharges;
    data['payment_status'] = this.paymentStatus;
    data['note'] = this.note;
    data['delivery_status'] = this.deliveryStatus;
    data['cafe_invoice_id'] = this.cafeInvoiceId;
    data['cafe_order_delivery_id'] = this.cafeOrderDeliveryId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  int? rate;
  double? quantity;
  int? productId;
  String? description;
  String? priceScale;
  int? subTotalAmount;
  double? productBasePrice; // Change to double
  double? productDealPrice; // Change to double

  Products(
      {this.name,
        this.rate,
        this.quantity,
        this.productId,
        this.description,
        this.priceScale,
        this.subTotalAmount,
        this.productBasePrice,
        this.productDealPrice,
      });

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rate = json['rate'];
    quantity = (json['quantity'] as num).toDouble();
    productId = json['product_id'];
    description = json['description'];
    priceScale = json['price_scale'];
    subTotalAmount = json['sub_total_amount'];
    productBasePrice = (json['productBasePrice'] as num?)?.toDouble(); // Safely convert
    productDealPrice = (json['productDealPrice'] as num?)?.toDouble();


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rate'] = this.rate;
    data['quantity'] = this.quantity;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['price_scale'] = this.priceScale;
    data['sub_total_amount'] = this.subTotalAmount;
    data['productBasePrice'] = this.productBasePrice; // Include base price
    data['productDealPrice'] = this.productDealPrice; // Include deal price
    return data;
  }

}
