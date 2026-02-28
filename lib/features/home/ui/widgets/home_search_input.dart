import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/home/ui/bloc/home_screen_bloc.dart';
import 'package:validators/validators.dart';

enum HomeSearchInputType { attachFile, sendText, loading }

class HomeSearchInput extends StatefulWidget {
  final VoidCallback onAttach;
  final void Function(String value) onSend;

  const HomeSearchInput({
    super.key,
    required this.onAttach,
    required this.onSend
  });

  @override
  State<HomeSearchInput> createState() => _HomeSearchInputState();
}

class _HomeSearchInputState extends State<HomeSearchInput> {
  late HomeSearchInputType _type;
  late TextEditingController _searchController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _type = HomeSearchInputType.attachFile;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: _homeListener,
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
        _type = HomeSearchInputType.attachFile;
      });
      return;
    }

    setState(() {
      _type = HomeSearchInputType.sendText;
    });
  }

  void _homeListener(BuildContext context, HomeScreenState state) {
    if(state is HomeScreenLoading){
      setState(() {
        _type = HomeSearchInputType.loading;
      });
      return;
    }

    if(_searchController.text.trim().isEmpty){
      setState(() {
        _type = HomeSearchInputType.attachFile;
      });
      return;
    }

    setState(() {
      _type = HomeSearchInputType.sendText;
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
  final HomeSearchInputType type;
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
        HomeSearchInputType.attachFile => IconButton.filled(
          key: ValueKey(type.toString()),
          onPressed: onAttach,
          icon: Icon(Icons.attach_file),
        ),
        HomeSearchInputType.sendText => IconButton.filled(
          key: ValueKey(type.toString()),
          onPressed: onSend,
          icon: Icon(Icons.search),
        ),
        HomeSearchInputType.loading => SizedBox(
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
