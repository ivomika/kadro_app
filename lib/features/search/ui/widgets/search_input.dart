import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/search/ui/bloc/search_screen_bloc.dart';
import 'package:validators/validators.dart';

enum SearchInputType { attachFile, sendText, loading }

class SearchInput extends StatefulWidget {
  final VoidCallback onAttach;
  final void Function(String value) onSend;

  const SearchInput({
    super.key,
    required this.onAttach,
    required this.onSend
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late SearchInputType _type;
  late TextEditingController _searchController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _type = SearchInputType.attachFile;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchScreenBloc, SearchScreenState>(
      listener: _searchListener,
      child: Form(
        key: _formKey,
        child: Row(
          spacing: 8,
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(labelText: 'Поиск'),
                onChanged: _onChangeText,
                validator: _urlValidator,
                onFieldSubmitted: (value) => _onSend(value),
              ),
            ),
            _SearchInputButton(
                type: _type,
                onAttach: widget.onAttach,
                onSend: () => _onSend(_searchController.text)
            ),
          ],
        ),
      ),
    );
  }

  void _onChangeText(String value) {
    if (value.trim().isEmpty) {
      setState(() {
        _type = SearchInputType.attachFile;
      });
      return;
    }

    setState(() {
      _type = SearchInputType.sendText;
    });
  }

  void _searchListener(BuildContext context, SearchScreenState state) {
    if(state is SearchScreenLoading){
      setState(() {
        _type = SearchInputType.loading;
      });
      return;
    }

    if(_searchController.text.trim().isEmpty){
      setState(() {
        _type = SearchInputType.attachFile;
      });
      return;
    }

    setState(() {
      _type = SearchInputType.sendText;
    });
  }
  
  void _onSend(String value){
    if(_formKey.currentState!.validate() == false) return;
    
    widget.onSend(value);
  }

  String? _urlValidator(String? value) {
    if(isURL(value) == false){
      return 'Это не похоже на ссылку';
    }
    
    return null;
  }
}

class _SearchInputButton extends StatelessWidget {
  final SearchInputType type;
  final VoidCallback onAttach;
  final VoidCallback onSend;

  const _SearchInputButton({
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
        SearchInputType.attachFile => IconButton.filled(
          key: ValueKey(type.toString()),
          onPressed: onAttach,
          icon: Icon(Icons.attach_file),
        ),
        SearchInputType.sendText => IconButton.filled(
          key: ValueKey(type.toString()),
          onPressed: onSend,
          icon: Icon(Icons.search),
        ),
        SearchInputType.loading => SizedBox(
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
