import 'package:grpc/grpc.dart';
import 'package:lightchat_app/config.dart';

import '../proto/FriendCircleManager.pbgrpc.dart';

late FriendCircleManagerClient friendCircleManagerClient;

void connectFriendCircleManager() {
  var channel = ClientChannel(
      lightChatServerHost,
      port: friendCircleManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure())
  );
  friendCircleManagerClient = FriendCircleManagerClient(channel);
}