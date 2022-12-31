import 'package:grpc/grpc.dart';
import "../proto/UserManager.pbgrpc.dart";
import "../config.dart";

late UserManagerClient userManagerClient;

void connectUserManager() {
  var channel = ClientChannel(
    lightChatServerHost,
    port: userManagerPort,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure())
  );
  userManagerClient = UserManagerClient(channel);
}