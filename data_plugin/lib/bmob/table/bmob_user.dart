import 'bmob_object.dart';
import 'package:data_plugin/bmob/bmob_dio.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';

import 'package:data_plugin/bmob/bmob.dart';

//此处与类名一致，由指令自动生成代码
part 'bmob_user.g.dart';

@JsonSerializable()
class BmobUser extends BmobObject {
  String username;
  String password;
  String email;
  bool emailVerified;
  String mobilePhoneNumber;
  bool mobilePhoneNumberVerified;
  String sessionToken;

  BmobUser();

  //此处与类名一致，由指令自动生成代码
  factory BmobUser.fromJson(Map<String, dynamic> json) =>
      _$BmobUserFromJson(json);

  //此处与类名一致，由指令自动生成代码
  Map<String, dynamic> toJson() => _$BmobUserToJson(this);

  ///用户账号密码注册
  void register({Function successListener, Function errorListener}) async {
    Map<String, dynamic> map = toJson();
    Map<String, dynamic> data = new Map();
    //去除由服务器生成的字段值
    map.remove("objectId");
    map.remove("createdAt");
    map.remove("updatedAt");
    map.remove("sessionToken");
    //去除空值
    map.forEach((key, value) {
      if (value != null) {
        data[key] = value;
      }
    });
    //Map转String
    String params = json.encode(data);
    //发送请求
    BmobDio.getInstance().post(Bmob.BMOB_API_USERS, data: params,
        successCallback: (data) {
      BmobRegistered bmobRegistered = BmobRegistered.fromJson(data);
      BmobDio.getInstance().setSessionToken(bmobRegistered.sessionToken);
      successListener(bmobRegistered);
    }, errorCallback: (error) {
      errorListener(error);
    });
  }

  void  login({Function successListener, Function errorListener}) async {
    Map<String, dynamic> map = toJson();
    Map<String, dynamic> data = new Map();
    //去除由服务器生成的字段值
    map.remove("objectId");
    map.remove("createdAt");
    map.remove("updatedAt");
    map.remove("sessionToken");
    //去除空值
    map.forEach((key, value) {
      if (value != null) {
        data[key] = value;
      }
    });
    //Map转String
    //发送请求
    BmobDio.getInstance().get(Bmob.BMOB_API_LOGIN + getUrlParams(data),
        successCallback: (data) {
      BmobUser bmobUser = BmobUser.fromJson(data);
      BmobDio.getInstance().setSessionToken(bmobUser.sessionToken);
      successListener(bmobUser);
      print(data);
    }, errorCallback: (error) {
      errorListener(error);
    });
  }

  ///获取在url中的请求参数
  String getUrlParams(Map data) {
    String urlParams = "";
    int index = 0;
    data.forEach((key, value) {
      if (index == 0) {
        urlParams = '$urlParams?$key=$value';
      } else {
        urlParams = '$urlParams&$key=$value';
      }
      index++;
    });
    return urlParams;
  }

  @override
  Map getParams() {
    // TODO: implement getJson
    Map<String, dynamic> map = toJson();
    Map<String, dynamic> data = new Map();
    //去除由服务器生成的字段值
    map.remove("objectId");
    map.remove("createdAt");
    map.remove("updatedAt");
    map.remove("sessionToken");
    //去除空值
    map.forEach((key, value) {
      if (value != null) {
        data[key] = value;
      }
    });
    return map;
  }
}
