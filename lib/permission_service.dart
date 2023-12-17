import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_utils/constant/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionService {
  PermissionService._();

  static void requestPermission({
    required PermissionFor permissionFor,
    required void Function() onGrantedCallback,
    required void Function() onDeniedCallback,
    required void Function(Future<bool> Function() openAppSettings)
        onPermanentlyDeniedCallback,
    required void Function(Future<bool> Function() openAppSettings)
        onOthersDeniedCallback,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double osVersion = 0;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      osVersion = double.tryParse(androidInfo.version.release) ?? 0;
    } else {
      IosDeviceInfo iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      osVersion = double.tryParse(iosDeviceInfo.systemVersion) ?? 0;
    }

    Permission permission = Permission.storage;
    switch (permissionFor) {
      case PermissionFor.camera:
        permission = Permission.camera;
        break;

      case PermissionFor.contact:
        permission = Permission.contacts;
        break;

      case PermissionFor.microphone:
        permission = Permission.microphone;
        break;

      case PermissionFor.location:
        permission = Permission.location;
        break;

      case PermissionFor.storage:
      case PermissionFor.gallery:
      default:
        if (Platform.isAndroid) {
          if (osVersion <= 12) {
            permission = Permission.accessMediaLocation;
          } else {
            permission = Permission.photos;
          }
        }
        break;
    }

    int deniedPermissionCount =
        sharedPreferences.getInt(permissionFor.toString()) ?? 0;

    sharedPreferences.setInt(
      permissionFor.toString(),
      deniedPermissionCount + 1,
    );

    await permission.onDeniedCallback(() async {
      log("::: $permissionFor permission status: permission denied :::");
      onDeniedCallback();
    }).onGrantedCallback(() {
      sharedPreferences.setInt(
        permissionFor.toString(),
        0,
      );
      log("::: $permissionFor permission status: permission granted :::");
      onGrantedCallback();
    }).onPermanentlyDeniedCallback(() {
      log("::: $permissionFor permission status: permission permanently denied :::");
      if (deniedPermissionCount >= 2) {
        onPermanentlyDeniedCallback(openAppSettings);
      }
    }).onRestrictedCallback(() {
      log("::: $permissionFor permission status: permission restricted :::");
      onOthersDeniedCallback(openAppSettings);
    }).onLimitedCallback(() {
      log("::: $permissionFor permission status: permission limited :::");
      onOthersDeniedCallback(openAppSettings);
    }).onProvisionalCallback(() {
      log("::: $permissionFor permission status: permission provisional :::");
      onOthersDeniedCallback(openAppSettings);
    }).request();
  }
}
