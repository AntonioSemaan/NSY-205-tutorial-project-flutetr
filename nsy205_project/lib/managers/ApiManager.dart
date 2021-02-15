

import 'package:Restaurant/Globals.dart';

class ApiManager {
  String serverHostIp = "192.168.16.9:5000";  //change this to the server ip 

  dynamic get(String urlPath) async {
    Uri uri = Uri.http(serverHostIp, urlPath);
    print(uri);
    return await ioClient.get(uri);
  }

  dynamic post(String urlPath,dynamic data) async {
    Uri uri = Uri.http(serverHostIp, urlPath);
    return await ioClient.post(uri,body: data);
  }
}