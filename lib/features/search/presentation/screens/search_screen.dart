import 'package:flutter/material.dart';
import 'package:manolista/core/core.dart';
import '../widgets/search_chat_input.dart';
import '../widgets/search_empty_state.dart';
import '../widgets/search_message_bubble.dart';
import '../widgets/search_typing_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  final _messages = <SearchMessage>[];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage([String? text]) async {
    final query = (text ?? _controller.text).trim();
    if (query.isEmpty || _isTyping) return;

    _controller.clear();
    setState(() {
      _messages.add(SearchMessage(text: query, role: SearchMessageRole.user));
      _isTyping = true;
    });
    _scrollToBottom();

    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;

    final response = _generateResponse(query);
    setState(() {
      _isTyping = false;
      _messages.add(response);
    });
    _scrollToBottom();
  }

  SearchMessage _generateResponse(String query) {
    final lower = query.toLowerCase();

    if (lower.contains('electric') || lower.contains('luz') || lower.contains('corto')) {
      return SearchMessage(
        role: SearchMessageRole.assistant,
        text:
            'Encontré electricistas verificados cerca de ti. Estos son los mejor calificados para tu solicitud:',
        professionals: const [
          {'name': 'Carlos Mendoza', 'specialty': 'Electricista', 'rating': '4.9'},
          {'name': 'Roberto Sánchez', 'specialty': 'Electricista industrial', 'rating': '4.8'},
        ],
      );
    }

    if (lower.contains('plom') || lower.contains('agua') || lower.contains('fuga')) {
      return SearchMessage(
        role: SearchMessageRole.assistant,
        text:
            'Tengo plomeros disponibles que pueden atender tu emergencia. Te recomiendo estos profesionales:',
        professionals: const [
          {'name': 'Luis Herrera', 'specialty': 'Plomero', 'rating': '4.8'},
          {'name': 'Pedro Ramírez', 'specialty': 'Plomería general', 'rating': '4.7'},
        ],
      );
    }

    if (lower.contains('aire') || lower.contains('ac') || lower.contains('frío')) {
      return SearchMessage(
        role: SearchMessageRole.assistant,
        text:
            'Para instalación o mantenimiento de aire acondicionado, estos técnicos tienen excelentes reseñas:',
        professionals: const [
          {'name': 'Mario López', 'specialty': 'Refrigeración & A/C', 'rating': '4.7'},
          {'name': 'Jorge Vargas', 'specialty': 'Técnico en HVAC', 'rating': '4.9'},
        ],
      );
    }

    if (lower.contains('pint')) {
      return SearchMessage(
        role: SearchMessageRole.assistant,
        text:
            'Estos pintores tienen experiencia en proyectos residenciales y pueden cotizar tu trabajo:',
        professionals: const [
          {'name': 'Ana Torres', 'specialty': 'Pintura interior/exterior', 'rating': '4.8'},
          {'name': 'Diego Morales', 'specialty': 'Remodelación', 'rating': '4.6'},
        ],
      );
    }

    return const SearchMessage(
      role: SearchMessageRole.assistant,
      text:
          'Entendí tu solicitud. Estoy buscando los mejores profesionales para ayudarte. ¿Podrías darme más detalles sobre el problema o la ubicación?',
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasMessages = _messages.isNotEmpty || _isTyping;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [context.colors.primary, context.colors.secondary],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.auto_awesome, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 10),
            const Text('Asistente Manolista'),
          ],
        ),
        centerTitle: true,
        actions: [
          if (hasMessages)
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Nueva búsqueda',
              onPressed: () {
                setState(() {
                  _messages.clear();
                  _isTyping = false;
                  _controller.clear();
                });
                _focusNode.requestFocus();
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: hasMessages
                ? ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    itemCount: _messages.length + (_isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _messages.length && _isTyping) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: SearchTypingIndicator(),
                        );
                      }
                      return SearchMessageBubble(
                        message: _messages[index],
                        index: index,
                      );
                    },
                  )
                : SearchEmptyState(
                    onSuggestionTap: (text) {
                      _controller.text = text;
                      _sendMessage(text);
                    },
                  ),
          ),
          SearchChatInput(
            controller: _controller,
            focusNode: _focusNode,
            isLoading: _isTyping,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
