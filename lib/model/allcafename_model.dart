class AllCafeNameModel {
  int? cafeUsersId;
  int? cafeId;
  String? cafeName;
  String? address;
  String? name;
  String? username;
  String? password;
  int? userTypeId;
  String? userTypeName;
  String? email;
  String? cellNumber;
  Null? status;

  AllCafeNameModel(
      {this.cafeUsersId,
        this.cafeId,
        this.cafeName,
        this.address,
        this.name,
        this.username,
        this.password,
        this.userTypeId,
        this.userTypeName,
        this.email,
        this.cellNumber,
        this.status});

  AllCafeNameModel.fromJson(Map<String, dynamic> json) {
    cafeUsersId = json['cafe_users_id'];
    cafeId = json['cafe_id'];
    cafeName = json['cafe_name'];
    address = json['address'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    userTypeId = json['user_type_id'];
    userTypeName = json['user_type_name'];
    email = json['email'];
    cellNumber = json['cell_number'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafe_users_id'] = this.cafeUsersId;
    data['cafe_id'] = this.cafeId;
    data['cafe_name'] = this.cafeName;
    data['address'] = this.address;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['user_type_id'] = this.userTypeId;
    data['user_type_name'] = this.userTypeName;
    data['email'] = this.email;
    data['cell_number'] = this.cellNumber;
    data['status'] = this.status;
    return data;
  }
}
