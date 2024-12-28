
// Data class to hold all products
class ProductData {
  final List<AllProductModule> allProducts;

  ProductData({required this.allProducts});
}


class AllProductModule {
  int? productId;
  int? proMastId;
  String? productMasterName;
  String? imagePath; // Added imagePath
  String? name;
  String? details;
  int? productWeight;
  int? fillingTypesId;
  String? fillingName;
  int? productFilling;
  int? basePrice;
  int? makingPrice;
  String? priceScale;
  List<DealProducts>? dealProducts;
  List<RestProducts>? restProducts;
  bool? isDeal;
  int? dealPrice;

  AllProductModule({
    this.productId,
    this.proMastId,
    this.productMasterName,
    this.imagePath,
    this.name,
    this.details,
    this.productWeight,
    this.fillingTypesId,
    this.fillingName,
    this.productFilling,
    this.basePrice,
    this.makingPrice,
    this.priceScale,
    this.dealProducts,
    this.restProducts,
    this.isDeal,
    this.dealPrice
  });

  AllProductModule.fromJson(Map<String, dynamic> json)
      : isDeal = json['dealProducts'] != null && json['dealProducts'].isNotEmpty {
    productId = json['product_id'];
    proMastId = json['pro_mast_id'];
    productMasterName = json['Product_Master_Name'];
    imagePath = json['imagePath']; // Added imagePath
    name = json['name'];
    details = json['details'];
    productWeight = json['product_weight'];
    fillingTypesId = json['filling_types_id'];
    fillingName = json['filling_name'];
    productFilling = json['product_filling'];
    basePrice = json['base_price'];
    makingPrice = json['making_price'];
    priceScale = json['price_scale'];
    dealPrice = json['dealPrice'];

    if (json['dealProducts'] != null) {
      dealProducts = <DealProducts>[];
      json['dealProducts'].forEach((v) {
        dealProducts!.add(DealProducts.fromJson(v));
      });
    }

    if (json['restProducts'] != null) {
      restProducts = <RestProducts>[];
      json['restProducts'].forEach((v) {
        restProducts!.add(RestProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['pro_mast_id'] = proMastId;
    data['Product_Master_Name'] = productMasterName;
    data['imagePath'] = imagePath; // Added imagePath
    data['name'] = name;
    data['details'] = details;
    data['product_weight'] = productWeight;
    data['filling_types_id'] = fillingTypesId;
    data['filling_name'] = fillingName;
    data['product_filling'] = productFilling;
    data['base_price'] = basePrice;
    data['making_price'] = makingPrice;
    data['price_scale'] = priceScale;
    data['dealProducts'] = dealProducts?.map((e) => e.toJson()).toList();
    data['restProducts'] = restProducts?.map((e) => e.toJson()).toList();
    data['isDeal'] = isDeal;
    data['dealPrice'] = dealPrice;
    return data;
  }
}

class DealProducts {
  int? productId;
  int? proMastId;
  String? productMasterName;
  String? imagePath; // Added imagePath
  String? name;
  String? details;
  int? productWeight;
  int? fillingTypesId;
  String? fillingName;
  int? productFilling;
  int? basePrice;
  int? makingPrice;
  String? priceScale;
  int? dealPrice;

  DealProducts({
    this.productId,
    this.proMastId,
    this.productMasterName,
    this.imagePath, // Added imagePath
    this.name,
    this.details,
    this.productWeight,
    this.fillingTypesId,
    this.fillingName,
    this.productFilling,
    this.basePrice,
    this.makingPrice,
    this.priceScale,
    this.dealPrice,
  });

  DealProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    proMastId = json['pro_mast_id'];
    productMasterName = json['Product_Master_Name'];
    imagePath = json['imagePath']; // Added imagePath
    name = json['name'];
    details = json['details'];
    productWeight = json['product_weight'];
    fillingTypesId = json['filling_types_id'];
    fillingName = json['filling_name'];
    productFilling = json['product_filling'];
    basePrice = json['base_price'];
    makingPrice = json['making_price'];
    priceScale = json['price_scale'];
    dealPrice = json['dealPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['pro_mast_id'] = proMastId;
    data['Product_Master_Name'] = productMasterName;
    data['imagePath'] = imagePath; // Added imagePath
    data['name'] = name;
    data['details'] = details;
    data['product_weight'] = productWeight;
    data['filling_types_id'] = fillingTypesId;
    data['filling_name'] = fillingName;
    data['product_filling'] = productFilling;
    data['base_price'] = basePrice;
    data['making_price'] = makingPrice;
    data['price_scale'] = priceScale;
    data['dealPrice'] = dealPrice;
    return data;
  }

  // Add the method to convert DealProducts to AllProductModule
  AllProductModule toAllProductModule() {
    return AllProductModule(
      productId: this.productId,
      proMastId: this.proMastId,
      productMasterName: this.productMasterName,
      imagePath: this.imagePath, // Added imagePath
      name: this.name,
      details: this.details,
      productWeight: this.productWeight,
      fillingTypesId: this.fillingTypesId,
      fillingName: this.fillingName,
      productFilling: this.productFilling,
      basePrice: this.basePrice,
      makingPrice: this.makingPrice,
      priceScale: this.priceScale,
      isDeal: true,  // Set this as true because it's a deal product
    );
  }
}

class RestProducts {
  int? productId;
  int? proMastId;
  String? productMasterName;
  String? imagePath; // Added imagePath
  String? name;
  String? details;
  int? productWeight;
  int? fillingTypesId;
  String? fillingName;
  int? productFilling;
  int? basePrice;
  int? makingPrice;
  String? priceScale;


  RestProducts({
    this.productId,
    this.proMastId,
    this.productMasterName,
    this.imagePath, // Added imagePath
    this.name,
    this.details,
    this.productWeight,
    this.fillingTypesId,
    this.fillingName,
    this.productFilling,
    this.basePrice,
    this.makingPrice,
    this.priceScale,
  });

  RestProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    proMastId = json['pro_mast_id'];
    productMasterName = json['Product_Master_Name'];
    imagePath = json['imagePath']; // Added imagePath
    name = json['name'];
    details = json['details'];
    productWeight = json['product_weight'];
    fillingTypesId = json['filling_types_id'];
    fillingName = json['filling_name'];
    productFilling = json['product_filling'];
    basePrice = json['base_price'];
    makingPrice = json['making_price'];
    priceScale = json['price_scale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['pro_mast_id'] = proMastId;
    data['Product_Master_Name'] = productMasterName;
    data['imagePath'] = imagePath; // Added imagePath
    data['name'] = name;
    data['details'] = details;
    data['product_weight'] = productWeight;
    data['filling_types_id'] = fillingTypesId;
    data['filling_name'] = fillingName;
    data['product_filling'] = productFilling;
    data['base_price'] = basePrice;
    data['making_price'] = makingPrice;
    data['price_scale'] = priceScale;
    return data;
  }
}
