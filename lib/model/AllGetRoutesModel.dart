class findCafeByIdModel {
  int? cafeId;
  int? franchiseId;
  String? name;
  String? code;
  String? address;
  int? area;
  int? routesId;
  int? citiesId;
  int? specialDeal;
  dynamic cafeDealId; // Changed from Null? to dynamic
  int? paymentTermsId;
  String? contactPerson;
  dynamic cafeStatusTypeId; // Changed from Null? to dynamic
  String? createdAt;
  dynamic createdBy; // Changed from Null? to dynamic
  String? updatedAt;
  dynamic updatedBy; // Changed from Null? to dynamic

  findCafeByIdModel(
      {this.cafeId,
        this.franchiseId,
        this.name,
        this.code,
        this.address,
        this.area,
        this.routesId,
        this.citiesId,
        this.specialDeal,
        this.cafeDealId,
        this.paymentTermsId,
        this.contactPerson,
        this.cafeStatusTypeId,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy});

  findCafeByIdModel.fromJson(Map<String, dynamic> json) {
    cafeId = json['cafe_id'];
    franchiseId = json['franchise_id'];
    name = json['name'];
    code = json['code'];
    address = json['address'];
    area = json['area'];
    routesId = json['routes_id'];
    citiesId = json['cities_id'];
    specialDeal = json['special_deal'];
    cafeDealId = json['cafe_deal_id'];
    paymentTermsId = json['payment_terms_id'];
    contactPerson = json['contact_person'];
    cafeStatusTypeId = json['cafe_status_type_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafe_id'] = this.cafeId;
    data['franchise_id'] = this.franchiseId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['address'] = this.address;
    data['area'] = this.area;
    data['routes_id'] = this.routesId;
    data['cities_id'] = this.citiesId;
    data['special_deal'] = this.specialDeal;
    data['cafe_deal_id'] = this.cafeDealId;
    data['payment_terms_id'] = this.paymentTermsId;
    data['contact_person'] = this.contactPerson;
    data['cafe_status_type_id'] = this.cafeStatusTypeId;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
