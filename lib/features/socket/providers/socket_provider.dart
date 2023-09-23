import 'package:aquayar/config/exports/exports.dart';
import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/socket/models/actions.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketProvider extends GetxController {
  late Rx<SocketAction?> _action;

  static AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

  static String? token = user.authToken;
  IO.Socket initializeSocket({required String authToken}) {
    final IO.Socket socket = IO.io(
        RoutesAndPaths.baseUrl,
        IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders({
          'Authorization': 'Bearer $token',
        }).build());

    return socket;
  }

  @override
  void onReady() {
    print("Action");
    _action = Rx<SocketAction?>(SocketAction());
    ever(_action, _setScreen);
    super.onReady();
  }

  _setScreen(action) {
    if (action is OrderAccepted) {
      Get.offAll(() => const PaymentScreen());
    } else {
      Get.offAll(() => const OrderWater());
    }
  }

  bool connectToHost() {
    bool isConnected = false;
    IO.Socket socket = initializeSocket(authToken: token!);

    socket.onConnect((data) {
      isConnected = true;
      print("Connection established:$data");
    });
    socket.onConnectError((data) {
      isConnected = false;
      print("Connection error: $data");
    });
    socket.emit(
      "userConnection",
    );
    socket.on("userConnected", (data) {
      print(data);
    });

    socket.onDisconnect((data) {
      print("Socket.o disconnected");
    });

    return isConnected;
  }

  void dispatchOrder({required String driverId, required String orderId}) {
    IO.Socket socket = initializeSocket(authToken: token!);

    String action = "";

    socket.emit("orderCreation", {"driverId": driverId, "orderId": orderId});

    socket.on("orderAction", (data) {
      if (data["action"] == "accept") {
        _action = OrderAccepted().obs;
      } else {
        print(data["action"]);
        _action = OrderRejected().obs;
      }
      print({"this is the data": data});
    });
  }
}
