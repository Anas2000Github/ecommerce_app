class CategoryModel {

  String? name,image;

  CategoryModel({
    this.name,
    this.image,});

  CategoryModel.fromJson(dynamic json) {
    if(json==null){
      return;
    }
    name = json['name'];
    image = json['image'];
  }


  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

}