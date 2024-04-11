



class ImagesEntity {
    ImagesEntity({
        required this.status,
        required this.dataEntity,
        required this.message,
    });

    final String? status;
    final DataEntity? dataEntity;
    final String? message;

    

}

class DataEntity {
    DataEntity({
        required this.images,
    });

    final List<dynamic> images;

}