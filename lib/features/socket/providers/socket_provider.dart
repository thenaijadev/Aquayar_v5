import 'package:aquayar/config/exports/exports.dart';
import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/core/widgets/snackbar.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/orders/bloc/order_bloc.dart';
import 'package:aquayar/features/socket/models/actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketProvider extends GetxController {
  late Rx<String?> _action;

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
    _action = Rx<String?>("Waiting");
    ever(_action, _setScreen);
    super.onReady();
  }

  _setScreen(action) {
    print(action);
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

  void dispatchOrder(
      {required String driverId,
      required String orderId,
      required BuildContext context}) {
    IO.Socket socket = initializeSocket(authToken: token!);

    socket.emit("orderCreation", {"driverId": driverId, "orderId": orderId});

    socket.on("orderAction", (data) {
      _action = Rx<String?>(data["action"]);
      if (data["action"] == "reject") {
        final OrderBloc bloc = context.read<OrderBloc>();
        InfoSnackBar.showErrorSnackBar(context,
            "There is no diver to take your order. Please make another order");
        bloc.add(OrderEventCancelOrder(token: token!, orderId: orderId));
      } else {
        Get.offAll(() => const PaymentScreen());
      }
      print({"this is the data": data});
    });
  }
}
