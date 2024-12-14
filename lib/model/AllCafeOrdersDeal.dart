/// dealProducts : [{"product_id":25,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"Donuts","details":"asdadsddfs","product_weight":100,"filling_types_id":1,"filling_name":"chocalate","product_filling":1,"base_price":100,"making_price":101,"price_scale":"Per Item","dealPrice":5000}]
/// restProducts : [{"product_id":19,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"cake","details":"hdsjshd","product_weight":12,"filling_types_id":1,"filling_name":"chocalate","product_filling":1,"base_price":3,"making_price":30,"price_scale":"Per kg"},{"product_id":26,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"Creem Roll","details":"details","product_weight":100,"filling_types_id":1,"filling_name":"chocalate","product_filling":1,"base_price":200,"making_price":2000,"price_scale":"Per Item"},{"product_id":41,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"Bread","details":"asdadsddfs","product_weight":10,"filling_types_id":null,"filling_name":null,"product_filling":1,"base_price":100,"making_price":10,"price_scale":"Per Item"},{"product_id":49,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"Cupcakes","details":"bhjwcsafdghgh","product_weight":10,"filling_types_id":2,"filling_name":" Cheese","product_filling":1,"base_price":100,"making_price":100,"price_scale":"Per Item"},{"product_id":55,"pro_mast_id":5,"Product_Master_Name":"Chocolate Donut","name":"Chocolate brownie","details":"asdadsddfs","product_weight":100,"filling_types_id":null,"filling_name":null,"product_filling":1,"base_price":100,"making_price":100,"price_scale":"Per kg"},{"product_id":56,"pro_mast_id":3,"Product_Master_Name":"Butter crossiant","name":"Biscuit","details":"ds","product_weight":10,"filling_types_id":null,"filling_name":null,"product_filling":1,"base_price":10,"making_price":10,"price_scale":"Per Item"},{"product_id":57,"pro_mast_id":3,"Product_Master_Name":"Butter crossiant","name":"Coconut cookies","details":"bhjwcsafdghgh","product_weight":100,"filling_types_id":null,"filling_name":null,"product_filling":1,"base_price":100,"making_price":100,"price_scale":"Per Item"},{"product_id":59,"pro_mast_id":3,"Product_Master_Name":"Butter crossiant","name":"Product Testing","details":"details","product_weight":20,"filling_types_id":1,"filling_name":"chocalate","product_filling":1,"base_price":10,"making_price":5,"price_scale":"Per Item"},{"product_id":60,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"Unit testing Product","details":"product details","product_weight":20,"filling_types_id":null,"filling_name":null,"product_filling":1,"base_price":100,"making_price":70,"price_scale":"Per Item"},{"product_id":65,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"fancy procust","details":"jsjs","product_weight":13,"filling_types_id":null,"filling_name":null,"product_filling":1,"base_price":8000,"making_price":7000,"price_scale":"Per kg"},{"product_id":67,"pro_mast_id":1,"Product_Master_Name":"Cheez","name":"Sandwich ","details":"jsjs","product_weight":13,"filling_types_id":1,"filling_name":"chocalate","product_filling":1,"base_price":8900,"making_price":900,"price_scale":"Per kg"}]

class AllCafeOrdersDeal {
  AllCafeOrdersDeal({
      List<DealProducts>? dealProducts, 
      List<RestProducts>? restProducts,}){
    _dealProducts = dealProducts;
    _restProducts = restProducts;
}

  AllCafeOrdersDeal.fromJson(dynamic json) {
    if (json['dealProducts'] != null) {
      _dealProducts = [];
      json['dealProducts'].forEach((v) {
        _dealProducts?.add(DealProducts.fromJson(v));
      });
    }
    if (json['restProducts'] != null) {
      _restProducts = [];
      json['restProducts'].forEach((v) {
        _restProducts?.add(RestProducts.fromJson(v));
      });
    }
  }
  List<DealProducts>? _dealProducts;
  List<RestProducts>? _restProducts;
AllCafeOrdersDeal copyWith({  List<DealProducts>? dealProducts,
  List<RestProducts>? restProducts,
}) => AllCafeOrdersDeal(  dealProducts: dealProducts ?? _dealProducts,
  restProducts: restProducts ?? _restProducts,
);
  List<DealProducts>? get dealProducts => _dealProducts;
  List<RestProducts>? get restProducts => _restProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dealProducts != null) {
      map['dealProducts'] = _dealProducts?.map((v) => v.toJson()).toList();
    }
    if (_restProducts != null) {
      map['restProducts'] = _restProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_id : 19
/// pro_mast_id : 1
/// Product_Master_Name : "Cheez"
/// name : "cake"
/// details : "hdsjshd"
/// product_weight : 12
/// filling_types_id : 1
/// filling_name : "chocalate"
/// product_filling : 1
/// base_price : 3
/// making_price : 30
/// price_scale : "Per kg"

class RestProducts {
  RestProducts({
      num? productId, 
      num? proMastId, 
      String? productMasterName, 
      String? name, 
      String? details, 
      num? productWeight, 
      num? fillingTypesId, 
      String? fillingName, 
      num? productFilling, 
      num? basePrice, 
      num? makingPrice, 
      String? priceScale,}){
    _productId = productId;
    _proMastId = proMastId;
    _productMasterName = productMasterName;
    _name = name;
    _details = details;
    _productWeight = productWeight;
    _fillingTypesId = fillingTypesId;
    _fillingName = fillingName;
    _productFilling = productFilling;
    _basePrice = basePrice;
    _makingPrice = makingPrice;
    _priceScale = priceScale;
}

  RestProducts.fromJson(dynamic json) {
    _productId = json['product_id'];
    _proMastId = json['pro_mast_id'];
    _productMasterName = json['Product_Master_Name'];
    _name = json['name'];
    _details = json['details'];
    _productWeight = json['product_weight'];
    _fillingTypesId = json['filling_types_id'];
    _fillingName = json['filling_name'];
    _productFilling = json['product_filling'];
    _basePrice = json['base_price'];
    _makingPrice = json['making_price'];
    _priceScale = json['price_scale'];
  }
  num? _productId;
  num? _proMastId;
  String? _productMasterName;
  String? _name;
  String? _details;
  num? _productWeight;
  num? _fillingTypesId;
  String? _fillingName;
  num? _productFilling;
  num? _basePrice;
  num? _makingPrice;
  String? _priceScale;
RestProducts copyWith({  num? productId,
  num? proMastId,
  String? productMasterName,
  String? name,
  String? details,
  num? productWeight,
  num? fillingTypesId,
  String? fillingName,
  num? productFilling,
  num? basePrice,
  num? makingPrice,
  String? priceScale,
}) => RestProducts(  productId: productId ?? _productId,
  proMastId: proMastId ?? _proMastId,
  productMasterName: productMasterName ?? _productMasterName,
  name: name ?? _name,
  details: details ?? _details,
  productWeight: productWeight ?? _productWeight,
  fillingTypesId: fillingTypesId ?? _fillingTypesId,
  fillingName: fillingName ?? _fillingName,
  productFilling: productFilling ?? _productFilling,
  basePrice: basePrice ?? _basePrice,
  makingPrice: makingPrice ?? _makingPrice,
  priceScale: priceScale ?? _priceScale,
);
  num? get productId => _productId;
  num? get proMastId => _proMastId;
  String? get productMasterName => _productMasterName;
  String? get name => _name;
  String? get details => _details;
  num? get productWeight => _productWeight;
  num? get fillingTypesId => _fillingTypesId;
  String? get fillingName => _fillingName;
  num? get productFilling => _productFilling;
  num? get basePrice => _basePrice;
  num? get makingPrice => _makingPrice;
  String? get priceScale => _priceScale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['pro_mast_id'] = _proMastId;
    map['Product_Master_Name'] = _productMasterName;
    map['name'] = _name;
    map['details'] = _details;
    map['product_weight'] = _productWeight;
    map['filling_types_id'] = _fillingTypesId;
    map['filling_name'] = _fillingName;
    map['product_filling'] = _productFilling;
    map['base_price'] = _basePrice;
    map['making_price'] = _makingPrice;
    map['price_scale'] = _priceScale;
    return map;
  }
  @override
  String toString() {
    return 'RestProducts{productId: $_productId, name: $_name, basePrice: $_basePrice, makingPrice: $_makingPrice, priceScale: $_priceScale}';
  }
}

/// product_id : 25
/// pro_mast_id : 1
/// Product_Master_Name : "Cheez"
/// name : "Donuts"
/// details : "asdadsddfs"
/// product_weight : 100
/// filling_types_id : 1
/// filling_name : "chocalate"
/// product_filling : 1
/// base_price : 100
/// making_price : 101
/// price_scale : "Per Item"
/// dealPrice : 5000

class DealProducts {
  DealProducts({
      num? productId, 
      num? proMastId, 
      String? productMasterName, 
      String? name, 
      String? details, 
      num? productWeight, 
      num? fillingTypesId, 
      String? fillingName, 
      num? productFilling, 
      num? basePrice, 
      num? makingPrice, 
      String? priceScale, 
      num? dealPrice,}){
    _productId = productId;
    _proMastId = proMastId;
    _productMasterName = productMasterName;
    _name = name;
    _details = details;
    _productWeight = productWeight;
    _fillingTypesId = fillingTypesId;
    _fillingName = fillingName;
    _productFilling = productFilling;
    _basePrice = basePrice;
    _makingPrice = makingPrice;
    _priceScale = priceScale;
    _dealPrice = dealPrice;
}

  DealProducts.fromJson(dynamic json) {
    _productId = json['product_id'];
    _proMastId = json['pro_mast_id'];
    _productMasterName = json['Product_Master_Name'];
    _name = json['name'];
    _details = json['details'];
    _productWeight = json['product_weight'];
    _fillingTypesId = json['filling_types_id'];
    _fillingName = json['filling_name'];
    _productFilling = json['product_filling'];
    _basePrice = json['base_price'];
    _makingPrice = json['making_price'];
    _priceScale = json['price_scale'];
    _dealPrice = json['dealPrice'];
  }
  num? _productId;
  num? _proMastId;
  String? _productMasterName;
  String? _name;
  String? _details;
  num? _productWeight;
  num? _fillingTypesId;
  String? _fillingName;
  num? _productFilling;
  num? _basePrice;
  num? _makingPrice;
  String? _priceScale;
  num? _dealPrice;
DealProducts copyWith({  num? productId,
  num? proMastId,
  String? productMasterName,
  String? name,
  String? details,
  num? productWeight,
  num? fillingTypesId,
  String? fillingName,
  num? productFilling,
  num? basePrice,
  num? makingPrice,
  String? priceScale,
  num? dealPrice,
}) => DealProducts(  productId: productId ?? _productId,
  proMastId: proMastId ?? _proMastId,
  productMasterName: productMasterName ?? _productMasterName,
  name: name ?? _name,
  details: details ?? _details,
  productWeight: productWeight ?? _productWeight,
  fillingTypesId: fillingTypesId ?? _fillingTypesId,
  fillingName: fillingName ?? _fillingName,
  productFilling: productFilling ?? _productFilling,
  basePrice: basePrice ?? _basePrice,
  makingPrice: makingPrice ?? _makingPrice,
  priceScale: priceScale ?? _priceScale,
  dealPrice: dealPrice ?? _dealPrice,
);
  num? get productId => _productId;
  num? get proMastId => _proMastId;
  String? get productMasterName => _productMasterName;
  String? get name => _name;
  String? get details => _details;
  num? get productWeight => _productWeight;
  num? get fillingTypesId => _fillingTypesId;
  String? get fillingName => _fillingName;
  num? get productFilling => _productFilling;
  num? get basePrice => _basePrice;
  num? get makingPrice => _makingPrice;
  String? get priceScale => _priceScale;
  num? get dealPrice => _dealPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['pro_mast_id'] = _proMastId;
    map['Product_Master_Name'] = _productMasterName;
    map['name'] = _name;
    map['details'] = _details;
    map['product_weight'] = _productWeight;
    map['filling_types_id'] = _fillingTypesId;
    map['filling_name'] = _fillingName;
    map['product_filling'] = _productFilling;
    map['base_price'] = _basePrice;
    map['making_price'] = _makingPrice;
    map['price_scale'] = _priceScale;
    map['dealPrice'] = _dealPrice;
    return map;
  }
  @override
  String toString() {
    return 'DealProducts{productId: $_productId, name: $_name, dealPrice: $_dealPrice, basePrice: $_basePrice, makingPrice: $_makingPrice}';
  }
}