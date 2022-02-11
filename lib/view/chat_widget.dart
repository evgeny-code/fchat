import 'dart:developer';
import 'package:fchat/dto/contact.dart';
import 'package:fchat/dto/message.dart';
import 'package:fchat/model/repo/contact_repo.dart';
import 'package:fchat/model/repo/message_repo.dart';
import 'package:fchat/view/contacts_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final Future<Contact> _contact = ContactRepo().getContact(MessageRepo.human);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollDown());

    var fb = FutureBuilder<List<Message>>(
      future: MessageRepo().getMessages(MessageRepo.me, MessageRepo.human),
      builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
        if (snapshot.hasData) {
          List<Message> _messages = snapshot.data!;
          var result = Column(
            children: <Widget>[
              ContactWidget(contact: _contact),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: _messages.length,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (_messages[index].from == MessageRepo.me
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (_messages[index].from == MessageRepo.me
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            _messages[index].content,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _msgController,
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          var text = _msgController.text.trim();
                          log('text: $text');
                          _msgController.text = "";

                          if (text.isNotEmpty) {
                            setState(() {
                              Message msg = Message.ofData(
                                  content: text,
                                  type: MessageType.text,
                                  timeUTC: DateTime.now().millisecondsSinceEpoch,
                                  from: MessageRepo.me,
                                  to: MessageRepo.human);

                              _messages.add(msg);

                              MessageRepo().addMessage(msg);

                              if (_scrollController.positions.isNotEmpty) {
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut);
                              }
                            });
                          }
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
          return result;
        } else {
          return const Text("WAIT...");
        }
      },
    );

    return fb;
  }

  @override
  void initState() {
    super.initState();
    log("initState");
  }

  @override
  void afterFirstLayout(BuildContext context) {
    log("afterFirstLayout $context");
  }

  _scrollDown() {
    if (_scrollController.positions.isNotEmpty) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }
}
