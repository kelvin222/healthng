class Hevent {
  Id? iId;
  String? title;
  String? htime;
  String? intro;
  String? detail;
  String? image;

  Hevent(
      {this.iId, this.title, this.htime, this.intro, this.detail, this.image});

  Hevent.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    title = json['title'];
    htime = json['htime'];
    intro = json['intro'];
    detail = json['detail'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['title'] = this.title;
    data['htime'] = this.htime;
    data['intro'] = this.intro;
    data['detail'] = this.detail;
    data['image'] = this.image;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}
