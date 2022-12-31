import 'package:grpc/grpc.dart';
import 'package:lightchat_app/proto/FriendManager.pbgrpc.dart';

import '../config.dart';

late FriendManagerClient friendManagerClient;

void connectFriendManager() {
  var channel = ClientChannel(
      lightChatServerHost,
      port: friendManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure())
  );
  friendManagerClient = FriendManagerClient(channel);
}