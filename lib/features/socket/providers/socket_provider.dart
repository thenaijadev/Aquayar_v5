import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketProvider {
  static AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

  static String? token = user.authToken;
  static IO.Socket initializeSocket({required String authToken}) {
    final IO.Socket socket = IO.io(
        RoutesAndPaths.baseUrl,
        IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders({
          'Authorization': 'Bearer $token',
        }).build());

    return socket;
  }

  static IO.Socket socket = initializeSocket(authToken: token!);

  static bool connectToHost() {
    bool isConnected = false;

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

  static String dispatchOrder(
      {required String driverId, required String orderId}) {
    String action = "";

    socket.emit("orderCreation", {"driverId": driverId, "orderId": orderId});

    socket.on("orderAction", (data) {
      action = data["action"];
      print(data);
    });
    return action;
  }
}
