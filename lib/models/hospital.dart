class Hospital {
  String? name;
  String? state;
  String? town;
  String? longitude;
  String? latitude;
  String? image;
  String? detail;
  String? address;
  String? htype;
  String? spec;

  Hospital(
      {
      this.name,
      this.state,
      this.town,
      this.longitude,
      this.latitude,
      this.image,
      this.detail,
      this.address,
      this.htype,
      this.spec});

  Hospital.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    state = json['state'];
    town = json['town'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    image = json['image'];
    detail = json['detail'];
    address = json['address'];
    htype = json['htype'];
    spec = json['spec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['name'] = this.name;
    data['state'] = this.state;
    data['town'] = this.town;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['image'] = this.image;
    data['detail'] = this.detail;
    data['address'] = this.address;
    data['htype'] = this.htype;
    data['spec'] = this.spec;
    return data;
  }
}
