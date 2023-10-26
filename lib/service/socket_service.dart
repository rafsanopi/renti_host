import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../core/helper/shear_preference_helper.dart';

class SocketService extends GetxController{
  late io.Socket socket;

  bool isLoading = false;

  void connectToSocket() {
    socket = io.io(
        "http://192.168.10.14:9000",
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    socket.onConnect((data) => print("Connection Established"));
    socket.onConnectError((data) => print("Connection Error"));

    socket.connect();
  }

  void joinRoom({required String hostId}) {
    socket.emit('join-room', {'uid': hostId});

    socket.on('join-check', (data) {
      print("this is: $data");
    });
  }

  void addNewChat({required Map userHostId, required String hostId}) {
    socket.emit('add-new-chat', {'chatInfo': userHostId, "uid": hostId});

    socket.on('new-chat', (chat) {
      print('New chat created: $chat');
    });
  }

//Getting the Indivisual message of inbox
  List<dynamic> msglist = [];
  List<Message> allmessageList = [];

//Getting All the person whome I have Chatted with

  List<Chat> allchatList = [];
  List<dynamic> chatlist = [];

  joinChat({required String chatId}) {
    chatlist = [];
    allmessageList = [];


    socket.emit('join-chat', {'uid': chatId});

    socket.on('all-messages', (messages) {
      chatlist.clear();
      allmessageList.clear();

      chatlist.addAll(messages);

      allmessageList = convertList(chatlist);

      for (Message message in allmessageList) {
        print('Message ID: ${message.msgId}');
        print('Message Text: ${message.message}');
        print('Chat: ${message.chatId}');
        print('Sender: ${message.senderInfo}');
        print('Created At: ${message.createdAt}');
        print('---------------');
      }
    });
  }

  List<Message> convertList(List<dynamic> dynamicList) {
    List<Message> messageList = [];
    for (var item in dynamicList) {
      if (item is Map<dynamic, dynamic>) {
        messageList.add(
          Message(
            msgId: item['_id'],
            message: item['message'],
            chatId: item['chat'],
            senderInfo: item['sender'],
            createdAt: item['createdAt'],
          ),
        );
      }
    }
    return messageList;
  }

  addNewMessage(
      {required String message,
      required String hostId,
      required String roomId}) {
    msglist.clear();

    socket.emit('add-new-message',
        {"message": message, "sender": hostId, "chat": roomId});

    socket.on('all-messages', (messages) {
      msglist.addAll(messages);

      allmessageList = convertList(chatlist);

      for (Message message in allmessageList) {
        print('Message ID: ${message.msgId}');
        print('Message Text: ${message.message}');
        print('Chat: ${message.chatId}');
        print('Sender: ${message.senderInfo}');
        print('Created At: ${message.createdAt}');
        print('---------------');
      }
    });
  }

  List<Chat> convertChatList(List<dynamic> dynamicList) {
    for (var item in dynamicList) {
      if (item is Map<dynamic, dynamic>) {
        allchatList.add(Chat.fromMap(item));
      }
    }
    return allchatList;
  }

  Chat chat = Chat(id: "", participants: []);
  getAllChats({required String hostId}) {

    isLoading = true;
    update();

    socket.emit('get-all-chats', {'uid': hostId});

    socket.on('all-chats', (chats) {
      chatlist.addAll(chats);

      allchatList = convertChatList(chatlist);

      for (Chat message in allchatList) {
        print('Message ID: ${message.id}');
        print('Message Text: ${message.participants[0].image}');
      }

      // print('All chats: $chats');
    });

    isLoading = false;
    update();
  }

  void getNotification(String uid) {
    socket.emit('join-room', {'uid': uid});

    socket.on('join-check', (data) {
      print("this is: $data");
    });

    socket.on('host-notification', (data) {
      if (data == null) {
        print("No Data: $data");
      } else {
        print("This is  Data: $data");
        print("This is Data msg : ${data['allNotification'][0]['message']}");
      }
    });
  }

  void disconnect({required String hostId}) {
    socket.emit('leave-room', {'uid': hostId});
    socket.disconnect();
  }
  getChatList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? hostUid = prefs.getString(SharedPreferenceHelper.userIdKey);

   connectToSocket();
   joinRoom(hostId: hostUid.toString());
    getAllChats(hostId: hostUid.toString());



  }

  @override
  void onInit() {
    getChatList();
    super.onInit();
  }
}

class Chat {
  String id;
  List<Participant> participants;

  Chat({
    required this.id,
    required this.participants,
  });

  factory Chat.fromMap(Map<dynamic, dynamic> data) {
    List<dynamic> participantsData = data['participants'];
    List<Participant> participants = participantsData
        .map((participantData) => Participant.fromMap(participantData))
        .toList();

    return Chat(
      id: data['_id'],
      participants: participants,
    );
  }
}

class Participant {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String gender;
  String address;
  String dateOfBirth;

  String image;
  String role;

  Participant({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.dateOfBirth,
    required this.image,
    required this.role,
  });

  factory Participant.fromMap(Map<dynamic, dynamic> data) {
    return Participant(
      id: data['_id'],
      fullName: data['fullName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      gender: data['gender'],
      address: data['address'],
      dateOfBirth: data['dateOfBirth'],
      image: data['image'],
      role: data['role'],
    );
  }
}

class Message {
  final String msgId;
  final String message;
  final String chatId;
  final Map<String, dynamic> senderInfo;
  final String createdAt;

  Message({
    required this.msgId,
    required this.message,
    required this.chatId,
    required this.senderInfo,
    required this.createdAt,
  });
}
