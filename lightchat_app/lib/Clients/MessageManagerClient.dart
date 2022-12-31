import 'package:grpc/grpc.dart';
import "package:lightchat_app/proto/MessageManager.pbgrpc.dart";

import '../config.dart';

late MessageManagerClient messageManagerClient;

void connectMessageManager() {
  var channel = ClientChannel(
      lightChatServerHost,
      port: messageManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure())
  );
  messageManagerClient = MessageManagerClient(channel);
}