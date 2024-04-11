



abstract class ApiConsumer {
  Future <dynamic> get ({required String url});
  Future <dynamic> post ({ required String url ,
   required dynamic body  });
}