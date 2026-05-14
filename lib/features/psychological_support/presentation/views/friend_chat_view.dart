import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class FriendChatView extends StatefulWidget {
  const FriendChatView({super.key});

  @override
  State<FriendChatView> createState() => _FriendChatViewState();
}

class _FriendChatViewState extends State<FriendChatView> {
  // ── users ──────────────────────────────────────────────────────────────────
  final _me = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac', firstName: 'أنت');
  final _friend = const types.User(id: 'friend-001', firstName: 'سارة', imageUrl: 'assets/images/chat1.png');
  List<types.Message> _messages = [];

  // ── dummy messages ─────────────────────────────────────────────────────────
  List<types.Message> get _dummyMessages => [
        types.TextMessage(
          id: const Uuid().v4(),
          author: _friend,
          text: 'أهلاً! كيف حالك اليوم؟ 😊',
          createdAt: DateTime.now().subtract(const Duration(hours: 2)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _me,
          text: 'الحمد لله، بخير. كيفك أنتِ؟',
          createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 55)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _friend,
          text: 'تمام، شكراً. هل جربتِ التأمل اليومي؟ ساعدني كثيراً في تخفيف القلق.',
          createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 40)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _me,
          text: 'نعم جربته، وفعلاً فرق معي خصوصاً تمارين التنفس العميق.',
          createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _friend,
          text: 'رائع! أنصحك أيضاً بالكتابة اليومية، تساعد على تفريغ الأفكار.',
          createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 10)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _me,
          text: 'فكرة ممتازة، سأجرب هذا الأسبوع 📝',
          createdAt: DateTime.now().subtract(const Duration(minutes: 50)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _friend,
          text: 'إذا احتجتِ أي دعم أنا هنا دائماً 💙',
          createdAt: DateTime.now().subtract(const Duration(minutes: 30)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _me,
          text: 'شكراً جزيلاً، هذا يعني لي الكثير ❤️',
          createdAt: DateTime.now().subtract(const Duration(minutes: 15)).millisecondsSinceEpoch,
        ),
        types.TextMessage(
          id: const Uuid().v4(),
          author: _friend,
          text: 'لا شكر على واجب، نحن هنا لبعض 🌸',
          createdAt: DateTime.now().subtract(const Duration(minutes: 5)).millisecondsSinceEpoch,
        ),
      ].reversed.toList();

  // ── lifecycle ──────────────────────────────────────────────────────────────
  @override
  void initState() {
    super.initState();
    _messages = _dummyMessages;
  }

  // ── handlers ───────────────────────────────────────────────────────────────
  void _addMessage(types.Message message) {
    setState(() => _messages.insert(0, message));
  }

  void _handleSendPressed(types.PartialText message) {
    _addMessage(
      types.TextMessage(
        author: _me,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
      ),
    );

    // simulate friend reply after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      _addMessage(
        types.TextMessage(
          author: _friend,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: _autoReply(message.text),
        ),
      );
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.image)),
                title: const Text('صورة'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.attach_file)),
                title: const Text('ملف'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.close)),
                title: const Text('إلغاء'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMessageTap(BuildContext _, types.Message message) {
    // handle file open if needed
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((e) => e.id == message.id);
    if (index == -1) return;
    setState(() {
      _messages[index] = (_messages[index] as types.TextMessage).copyWith(previewData: previewData);
    });
  }

  // ── auto reply ─────────────────────────────────────────────────────────────
  String _autoReply(String userText) {
    final replies = [
      'شكراً لمشاركتك! أنا هنا أستمع إليكِ 💙',
      'أفهم ما تقولين، استمري في التحدث 🌸',
      'هذا رائع! أخبريني أكثر 😊',
      'أنتِ قوية وتستطيعين تجاوز كل شيء ❤️',
      'دائماً هنا لدعمك في كل خطوة 🤍',
    ];
    replies.shuffle();
    return replies.first;
  }

  // ── build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/chat1.png')),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('سارة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                Text('متصلة الآن', style: TextStyle(fontSize: 11, color: Colors.green)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call_outlined), onPressed: () {}),
        ],
      ),
      body: Chat(
        messages: _messages,
        onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _me,
        // optional RTL theme tweak
        theme: const DefaultChatTheme(
          inputTextStyle: TextStyle(fontSize: 14),
          sentMessageBodyTextStyle: TextStyle(fontSize: 14, color: Colors.white),
          receivedMessageBodyTextStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
