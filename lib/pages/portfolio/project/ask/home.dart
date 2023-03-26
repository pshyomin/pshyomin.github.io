import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/ask/ask_bloc.dart';
import '/repositorys/ask/chat_repository.dart';
import '/models/ask/message_model.dart';
import 'widgets/dialog_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AskBloc askBloc;
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    askBloc = AskBloc(ChatRepository());
    askBloc.add(const FetchEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 37, 1.0),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: AppBar(
                title: const Column(
                  children: [
                    Text(
                      '무엇이든 물어보세요',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'current max_tokens : 250',
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () async => {
                      if (await dialogButton(context, '채팅 내용 지우기',
                              '모든 채팅 내용을 지우시겠습니까?', '지우기', '취소') ==
                          true)
                        {
                          askBloc.add(const DelectEvent()),
                          askBloc.add(const FetchEvent()),
                        }
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocProvider<AskBloc>(
          create: (context) => askBloc,
          child: StreamBuilder<List<Message>>(
            initialData: [
              Message(
                content: '안녕하세요. 무엇이든 물어봐주세요!',
                dateTime: DateTime.now().toUtc().add(
                      const Duration(hours: 9),
                    ),
              )
            ],
            stream: askBloc.chatStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Message>>? snapshot) {
              if (snapshot!.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: _buildChatList(snapshot.data!),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          //
                          ),
                      child: _buildTextField(askBloc),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: _buildChatList(snapshot.data!),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        //
                        ),
                    child: _buildTextField(askBloc),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildChatList(List<Message> messages) {
    return ListView.builder(
      reverse: true,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final Message message = messages[messages.length - 1 - index];
        return _buildChatMessage(message);
      },
    );
  }

  Widget _buildChatMessage(Message message) {
    final messageText = Text(
      message.content!,
      maxLines: 30,
      style: TextStyle(
        fontSize: 16,
        color: message.isSentByMe == 0
            ? Colors.white
            : const Color.fromRGBO(51, 61, 75, 1.0),
      ),
    );

    final messageContainer = Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(8),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: message.isSentByMe == 0
            ? const Color.fromRGBO(27, 100, 218, 1.0)
            : const Color.fromRGBO(249, 250, 252, 1.0),
      ),
      child: messageText,
    );

    const profileText = Text(
      '무물 AI',
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    );

    final profileContainer = Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
      child: profileText,
    );

    final timeText = Text(
      DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(message.dateTime),
      style: const TextStyle(
        fontSize: 9,
        color: Colors.grey,
      ),
    );

    final timeContainer = Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: timeText,
    );

    final timeMeContainer = Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: timeText,
    );

    if (message.isSentByMe == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              messageContainer,
            ],
          ),
          timeMeContainer,
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: _profileAvatar(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileContainer,
              messageContainer,
              timeContainer,
            ],
          ),
        ],
      );
    }
  }

  Widget _profileAvatar() {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.grey.shade300,
      child: Image.asset('assets/icon/ask/profile.png'),
    );
  }

  Widget _buildTextField(AskBloc askBloc) {
    bool isEnabled = false;
    try {
      return ClipRRect(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
              color: Color.fromRGBO(15, 15, 19, 1.0),
              width: 2,
            )),
            color: Color.fromRGBO(23, 23, 27, 1.0),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  enabled: kIsWeb ? false : true,
                  maxLines: 1,
                  focusNode: _focusNode,
                  style:
                      const TextStyle(color: Color.fromRGBO(51, 51, 51, 1.0)),
                  keyboardType: TextInputType.text,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    hintText: kIsWeb
                        ? 'Web 플랫폼 키보드 에러 문제로 비활성화 하였습니다.'
                        : '질문을 입력 해주세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (String text) {
                    if (text.isNotEmpty) {
                      askBloc.add(SendEvent(text, 0));
                      _textEditingController.clear();
                    }
                  },
                  onChanged: (text) {
                    setState(() {
                      isEnabled = text.isNotEmpty;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: FittedBox(
                  child: IconButton(
                    color: const Color.fromRGBO(27, 100, 218, 1.0),
                    disabledColor: Colors.grey,
                    icon: const Icon(
                      Icons.send,
                    ),
                    onPressed: _textEditingController.text.isNotEmpty
                        ? () {
                            askBloc
                                .add(SendEvent(_textEditingController.text, 0));
                            _textEditingController.clear();
                          }
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
