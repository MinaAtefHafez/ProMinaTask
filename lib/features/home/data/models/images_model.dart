import 'package:gallery_app/features/home/domain/entities/images_entity.dart';

class ImagesModel extends ImagesEntity {
  ImagesModel(
      {required super.status,
      required super.dataEntity,
      required super.message});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      status: json["status"],
      dataEntity: json["data"] == null
          ? null
          : DataModel.fromJson(json["data"]),
      message: json["message"],
    );
  }
}

class DataModel extends DataEntity {
  DataModel({required super.images});


  factory DataModel.fromJson(Map<String, dynamic> json){ 
        return DataModel(
            images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        );
    }
}
