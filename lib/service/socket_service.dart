import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
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
      joinChat(chatId: chat["_id"]);
      print('New chat created: $chat');
    });
  }

//Getting the Indivisual message of inbox
  List<dynamic> msglist = [];
  List<Message> allmessageList = [];

//Getting All the person whome I have Chatted with
  List<dynamic> personalmsg = [];
  List<Message> personalmsgList = [];

  // List<Chat> allchatList = [];
  List<dynamic> chatlist = [];

  joinChat({required String chatId}) {
    personalmsg.clear();
    personalmsgList.clear();

    socket.emit('join-chat', {'uid': chatId});

    socket.on('all-messages', (messages) {
      personalmsg.addAll(messages);

      personalmsgList = convertList(personalmsg);

      for (Message msg in personalmsgList) {
        print("This is the Message ${msg.message}");
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
    });
  }

  List<Chat> convertChatList(List<dynamic> dynamicList) {
    List<Chat> allchatList = [];
    print(jsonEncode(dynamicList));

    for (var item in dynamicList) {
      if (item is Map<dynamic, dynamic>) {
        allchatList.add(Chat.fromMap(item));
      }
    }
    return allchatList;
  }

  fetchAllChats(
      {required String hostId, required Function(List<Chat>) didFetchChats}) {
    socket.emit('get-all-chats', {'uid': hostId});

    socket.on('all-chats', (chats) {
      if (chats != null) {
        chatlist.addAll(chats);

        List<Chat> allchatList = convertChatList(chatlist);

        didFetchChats(allchatList);
      }
      // print(chats);
    });
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
}

class Chat {
  String id;
  List<Participant> participants;

  Chat({
    required this.id,
    required this.participants,
  });

  factory Chat.fromMap(Map<dynamic, dynamic> data) {
    var id = data['_id'];
    List<dynamic> participantsData = data['participants'];

    List<Participant> participants = participantsData
        .map((participantData) => Participant.fromMap(participantData))
        .toList();

    return Chat(
      id: id,
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
