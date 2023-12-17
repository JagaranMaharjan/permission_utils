import 'package:flutter/material.dart';
import 'package:permission_utils/constant/enums.dart';
import 'package:permission_utils/permission_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permission Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select Your Permssion',
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                PermissionService.requestPermission(
                  permissionFor: PermissionFor.camera,
                  onGrantedCallback: () {},
                  onDeniedCallback: () {},
                  onPermanentlyDeniedCallback:
                      (Future<bool> Function() openAppSettings) {
                    openAppSettings();
                  },
                  onOthersDeniedCallback:
                      (Future<bool> Function() openAppSettings) {},
                );
              },
              icon: const Icon(Icons.camera),
            ),
            IconButton(
              onPressed: () {
                PermissionService.requestPermission(
                  permissionFor: PermissionFor.gallery,
                  onGrantedCallback: () {},
                  onDeniedCallback: () {},
                  onPermanentlyDeniedCallback:
                      (Future<bool> Function() openAppSettings) {
                    openAppSettings();
                  },
                  onOthersDeniedCallback:
                      (Future<bool> Function() openAppSettings) {},
                );
              },
              icon: const Icon(Icons.photo),
            ),
            IconButton(
              onPressed: () {
                PermissionService.requestPermission(
                  permissionFor: PermissionFor.microphone,
                  onGrantedCallback: () {},
                  onDeniedCallback: () {},
                  onPermanentlyDeniedCallback:
                      (Future<bool> Function() openAppSettings) {
                    openAppSettings();
                  },
                  onOthersDeniedCallback:
                      (Future<bool> Function() openAppSettings) {},
                );
              },
              icon: const Icon(Icons.voicemail),
            ),
            IconButton(
              onPressed: () {
                PermissionService.requestPermission(
                  permissionFor: PermissionFor.contact,
                  onGrantedCallback: () {},
                  onDeniedCallback: () {},
                  onPermanentlyDeniedCallback:
                      (Future<bool> Function() openAppSettings) {
                    openAppSettings();
                  },
                  onOthersDeniedCallback:
                      (Future<bool> Function() openAppSettings) {},
                );
              },
              icon: const Icon(Icons.phone),
            ),
            IconButton(
              onPressed: () {
                PermissionService.requestPermission(
                  permissionFor: PermissionFor.location,
                  onGrantedCallback: () {},
                  onDeniedCallback: () {},
                  onPermanentlyDeniedCallback:
                      (Future<bool> Function() openAppSettings) {
                    openAppSettings();
                  },
                  onOthersDeniedCallback:
                      (Future<bool> Function() openAppSettings) {},
                );
              },
              icon: const Icon(Icons.map),
            ),
          ],
        ),
      ),
    );
  }
}
