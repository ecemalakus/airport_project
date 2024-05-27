import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../../controllers/asistant_controller.dart';

class AsistantPage extends StatefulWidget {
  const AsistantPage({super.key});

  @override
  State<AsistantPage> createState() => _AsistantPageState();
}

class _AsistantPageState extends State<AsistantPage> {
  late final GenerativeModel _model;

  late final ChatSession _chat;

  final ScrollController _scrollController = ScrollController();

  final TextEditingController textController = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    _model = GenerativeModel(
        model: "gemini-pro", apiKey: "AIzaSyBsbQlbN8Gl5iR9DmNCKFvHdvBIHYi8Mv0");
    _chat = _model.startChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AsistantController>(
        init: AsistantController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.instance.yellow,
              centerTitle: true,
              title: Text(
                "Asistan",
                style: TextStyle(
                  fontFamily: "Medium",
                  fontSize: Utility.dynamicTextSize(17),
                  color: ColorManager.instance.black,
                ),
              ),
            ),
            backgroundColor: ColorManager.instance.white,
            body: Padding(
              padding: EdgeInsets.all(Utility.dynamicWidthPixel(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, idx) {
                      final content = _chat.history.toList()[idx];
                      final text = content.parts
                          .whereType<TextPart>()
                          .map<String>((e) => e.text)
                          .join('');
                      return MessageWidget(
                        text: text,
                        isFromUser: content.role == 'user',
                      );
                    },
                    itemCount: _chat.history.length,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Utility.dynamicWidthPixel(25),
                      horizontal: Utility.dynamicWidthPixel(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              hintText: 'Metin Girin',
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                borderSide: BorderSide(
                                  color: ColorManager.instance.darkGray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                borderSide: BorderSide(
                                  color: ColorManager.instance.darkGray,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (String value) {
                              _sendChatMessage(value);
                            },
                          ),
                        ),
                        const SizedBox.square(
                          dimension: 15,
                        ),
                        if (!loading)
                          IconButton(
                            onPressed: () async {
                              _sendChatMessage(textController.text);
                            },
                            icon: Icon(
                              Icons.send,
                              color: ColorManager.instance.darkGray,
                            ),
                          )
                        else
                          const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() => loading = true);

    try {
      final response = await _chat.sendMessage(Content.text(message));
      final text = response.text;
      if (text == null) {
        debugPrint('No response from API.');
        return;
      }
      setState(() => loading = false);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      textController.clear();
      setState(() => loading = false);
    }
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? ColorManager.instance.white
                  : ColorManager.instance.yellow,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: text,
            ),
          ),
        ),
      ],
    );
  }
}
