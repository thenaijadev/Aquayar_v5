import 'package:aquayar/features/socket/providers/socket_provider.dart';

class SocketRepository {
  static bool connectToHost() {
    return SocketProvider.connectToHost();
  }

  static String dispatchOrder(
      {required String driverId, required String orderId}) {
    return SocketProvider.dispatchOrder(driverId: driverId, orderId: orderId);
  }
}
