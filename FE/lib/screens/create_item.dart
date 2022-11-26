import 'package:flutter/material.dart';
import 'package:static_app/widgets/color_picker.dart';

class CreateItemScreen extends StatefulWidget {
  const CreateItemScreen({super.key});

  static const routeName = '/create_folder';

  @override
  State<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen> {
  Color pickedColor = Colors.white;
  bool _isPickerVisible = false;

  void selectColor(color) {
    setState(() {
      pickedColor = color;
    });
  }

  Widget _buildTextFieldHeader(context, text) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        bottom: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _buildColorTextField(context, text, enabled, color) {
    color ??= Colors.white;

    return InkWell(
        onTap: () {
          setState(() {
            _isPickerVisible = !_isPickerVisible;
          });
        },
        child: _buildTextField(context, text, enabled, color));
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.black12,
        width: .1,
      ),
    );
  }

  Widget _buildTextField(context, text, enabled, [pickedColor]) {
    return TextField(
      enabled: enabled,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
        filled: true,
        fillColor: Colors.black12,
        suffixIcon: !enabled
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: pickedColor ?? Colors.white,
                  child: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.colorize,
                      color: pickedColor as Color == Colors.white
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  void _saveFolder(context) {}

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String? title = routeArgs['appBarTitle'];

    final appBar = AppBar(
      title: Text(title ?? 'Nuovo'),
    );

    return Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFieldHeader(context, 'Nome'),
                _buildTextField(context, 'Inserisci un nome...', true),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFieldHeader(context, 'Colore'),
                _buildColorTextField(
                    context, 'Scegli un colore...', false, pickedColor),
                AnimatedOpacity(
                  opacity: _isPickerVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: ColorPicker(
                    appBar.preferredSize.height,
                    selectColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _saveFolder(context),
          elevation: 4,
          child: const Icon(Icons.check),
        ));
  }
}
