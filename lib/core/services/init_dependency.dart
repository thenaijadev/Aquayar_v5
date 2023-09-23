import 'package:aquayar/features/socket/providers/socket_provider.dart';
import 'package:get/get.dart';

class InitializeDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SocketProvider());
  }
}
