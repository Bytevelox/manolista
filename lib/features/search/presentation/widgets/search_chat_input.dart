import 'package:flutter/material.dart';
import 'package:manolista/core/core.dart';

class SearchChatInput extends StatefulWidget {
  const SearchChatInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSend,
    required this.isLoading,
    this.onSuggestionTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;
  final bool isLoading;
  final ValueChanged<String>? onSuggestionTap;

  @override
  State<SearchChatInput> createState() => _SearchChatInputState();
}

class _SearchChatInputState extends State<SearchChatInput>
    with SingleTickerProviderStateMixin {
  static const _hints = [
    'Necesito un electricista urgente...',
    'Instalar aire acondicionado en mi casa...',
    'Reparar una fuga de agua en el baño...',
    'Pintar mi departamento completo...',
    'Arreglar un corto circuito...',
  ];

  late final AnimationController _hintController;
  int _hintIndex = 0;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _hintController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    widget.controller.addListener(_onTextChanged);
    widget.focusNode.addListener(_onFocusChanged);
    _startHintRotation();
  }

  void _onFocusChanged() => setState(() {});

  void _onTextChanged() {
    final hasText = widget.controller.text.trim().isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  void _startHintRotation() {
    Future.doWhile(() async {
      if (!mounted || _hasText) return false;
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted || _hasText) return false;
      await _hintController.forward(from: 0);
      if (!mounted || _hasText) return false;
      setState(() => _hintIndex = (_hintIndex + 1) % _hints.length);
      await _hintController.reverse();
      return mounted && !_hasText;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    _hintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: BoxDecoration(
        color: context.colors.background,
        border: Border(
          top: BorderSide(
            color: context.colors.textSecondary.withValues(alpha: 0.12),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: widget.focusNode.hasFocus
                      ? context.colors.primary.withValues(alpha: 0.5)
                      : context.colors.textSecondary.withValues(alpha: 0.2),
                  width: widget.focusNode.hasFocus ? 1.5 : 1,
                ),
                boxShadow: widget.focusNode.hasFocus
                    ? [
                        BoxShadow(
                          color: context.colors.primary.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        if (!_hasText)
                          IgnorePointer(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
                              child: AnimatedBuilder(
                                animation: _hintController,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: 1 - _hintController.value,
                                    child: Transform.translate(
                                      offset: Offset(0, 8 * _hintController.value),
                                      child: child,
                                    ),
                                  );
                                },
                                child: Text(
                                  _hints[_hintIndex],
                                  style: TextStyle(
                                    color: context.colors.textSecondary
                                        .withValues(alpha: 0.7),
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        TextField(
                          controller: widget.controller,
                          focusNode: widget.focusNode,
                          maxLines: 5,
                          minLines: 1,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) {
                            if (!widget.isLoading) widget.onSend();
                          },
                          style: TextStyle(
                            color: context.colors.textPrimary,
                            fontSize: 15,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 8, 14),
                            isDense: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6, bottom: 6),
                    child: AnimatedScale(
                      scale: _hasText && !widget.isLoading ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                      child: AnimatedOpacity(
                        opacity: _hasText && !widget.isLoading ? 1 : 0,
                        duration: const Duration(milliseconds: 150),
                        child: Material(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: widget.onSend,
                            borderRadius: BorderRadius.circular(20),
                            child: const SizedBox(
                              width: 36,
                              height: 36,
                              child: Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
