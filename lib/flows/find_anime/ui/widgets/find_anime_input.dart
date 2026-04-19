import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/find_anime/ui/bloc/find_anime_screen_bloc.dart';
import 'package:validators/validators.dart';

enum FindAnimeInputType { attachFile, sendText, loading }

class FindAnimeInput extends StatefulWidget {
  final VoidCallback onAttach;
  final void Function(String value) onSend;

  const FindAnimeInput({
    super.key,
    required this.onAttach,
    required this.onSend,
  });

  @override
  State<FindAnimeInput> createState() => _FindAnimeInputState();
}

class _FindAnimeInputState extends State<FindAnimeInput> {
  late FindAnimeInputType _type;
  late TextEditingController _searchController;
  late GlobalKey<FormState> _formKey;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _type = FindAnimeInputType.attachFile;
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FindAnimeScreenBloc, FindAnimeScreenState>(
      listener: _searchListener,
      child: Form(
        key: _formKey,
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                selectAllOnFocus: true,
                controller: _searchController,
                focusNode: _searchFocusNode,
                decoration: InputDecoration(labelText: 'РџРѕРёСЃРє'),
                validator: _urlValidator,
                onChanged: _onChangeText,
                onTapOutside: (_) => _unfocusSearchTextField(),
                onFieldSubmitted: _onSend,
              ),
            ),
            _FindAnimeInputButton(
              type: _type,
              onAttach: () => _onAttach(),
              onSend: () => _onSend(_searchController.text),
            ),
          ],
        ),
      ),
    );
  }

  void _onChangeText(String value) {
    if (value.trim().isEmpty) {
      setState(() {
        _type = FindAnimeInputType.attachFile;
      });
      return;
    }

    setState(() {
      _type = FindAnimeInputType.sendText;
    });
  }

  void _unfocusSearchTextField() {
    _searchFocusNode.unfocus();
  }

  void _searchListener(BuildContext context, FindAnimeScreenState state) {
    if (state is FindAnimeScreenLoading) {
      setState(() {
        _type = FindAnimeInputType.loading;
      });
      return;
    }

    if (_searchController.text.trim().isEmpty) {
      setState(() {
        _type = FindAnimeInputType.attachFile;
      });
      return;
    }

    setState(() {
      _type = FindAnimeInputType.sendText;
    });
  }

  void _onSend(String value) {
    _unfocusSearchTextField();
    if (_formKey.currentState!.validate() == false) return;

    widget.onSend(value);
  }

  void _onAttach() {
    _unfocusSearchTextField();

    widget.onAttach();
  }

  String? _urlValidator(String? value) {
    if (isURL(value) == false) {
      return 'Р­С‚Рѕ РЅРµ РїРѕС…РѕР¶Рµ РЅР° СЃСЃС‹Р»РєСѓ';
    }

    return null;
  }
}

class _FindAnimeInputButton extends StatelessWidget {
  final FindAnimeInputType type;
  final VoidCallback onAttach;
  final VoidCallback onSend;

  const _FindAnimeInputButton({
    required this.type,
    required this.onAttach,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child: switch (type) {
        FindAnimeInputType.attachFile => IconButton.filled(
          key: ValueKey(type.toString()),
          onPressed: onAttach,
          icon: Icon(Icons.attach_file),
        ),
        FindAnimeInputType.sendText => IconButton.filled(
          key: ValueKey(type.toString()),
          onPressed: onSend,
          icon: Icon(Icons.search),
        ),
        FindAnimeInputType.loading => SizedBox(
          key: ValueKey(type.toString()),
          width: 48,
          height: 48,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
        ),
      },
    );
  }
}
