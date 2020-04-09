import 'package:location/src/states/base_state.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsState extends BaseState {
  // PermissionStatus _contacts;
  // PermissionStatus get contacts => _contacts;

  // Function get requestPermission => _requestPermission
  // get permissons => _permissions


  PermissionsState();

  init() async {
    // await _listenForPermissionStatus(Permission.contacts);
    // await _requestPermission(Permission.contacts);
  }

  // _permission_status(Permission permission) async {}
  // contacts_check() async {
  //   return await _requestPermission(Permission.contacts);
  // }

  // contacts_request() async {
  //   Map<Permission, PermissionStatus> permissions =
  //       await PermissionHandler()
  //           .requestPermissions([Permission.contacts]);
  // }

  // openAppSettings() {
  //   PermissionHandler().openAppSettings().then((bool hasOpened) =>
  //       print('App Settings opened: ' + hasOpened.toString()));
  // }

  // Future<void> _requestPermission(Permission permission) async {
  //   final List<Permission> permissions = <Permission>[permission];
  //   final Map<Permission, PermissionStatus> permissionRequestResult =
  //       await PermissionHandler().requestPermissions(permissions);
  //   print(permission);
  // }

  // void _listenForPermissionStatus(permissionGroup) {
  //   final Future<PermissionStatus> statusFuture =
  //       PermissionHandler().checkPermissionStatus(permissionGroup);

  //   statusFuture.then((PermissionStatus status) {
  //     _contacts = status;
  //     notifyListeners();
  //   });
  // }
}
