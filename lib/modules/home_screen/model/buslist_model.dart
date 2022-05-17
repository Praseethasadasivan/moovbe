class BusDeatailsModel {
  bool? status;
  List<BusList>? busList;

  BusDeatailsModel({this.status, this.busList});

  BusDeatailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['bus_list'] != null) {
      busList = <BusList>[];
      json['bus_list'].forEach((v) {
        busList!.add(new BusList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.busList != null) {
      data['bus_list'] = this.busList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusList {
  int? id;
  String? name;
  String? image;
  int? seatCount;
  String? type;
  Null? driver;

  BusList(
      {this.id, this.name, this.image, this.seatCount, this.type, this.driver});

  BusList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    seatCount =int.tryParse(json['seat_count']);
    type = json['type'];
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['seat_count'] = this.seatCount;
    data['type'] = this.type;
    data['driver'] = this.driver;
    return data;
  }
}
