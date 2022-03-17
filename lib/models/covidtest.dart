class Covidtest {
  String? name;
  String? state;
  String? longitude;
  String? latitude;
  String? image;
  String? address;
  String? htype;

  Covidtest(
      {
      this.name,
      this.state,
      this.longitude,
      this.latitude,
      this.image,
      this.address,
      this.htype});

  Covidtest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    state = json['state'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    image = json['image'];
    address = json['address'];
    htype = json['htype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['state'] = this.state;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['image'] = this.image;
    data['address'] = this.address;
    data['htype'] = this.htype;
    return data;
  }
}