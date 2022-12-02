import 'package:flutter/material.dart';
import 'package:static_app/widgets/color_picker.dart';
import 'package:static_app/widgets/icon_picker.dart';

class CreateItemScreen extends StatefulWidget {
  const CreateItemScreen({super.key});

  static const routeName = '/create_folder';

  @override
  State<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen> {
  late Color pickedColor = Colors.black12;
  late Icon pickedIcon = const Icon(
    Icons.add,
    color: Colors.black,
  );
  bool _isColorPickerVisible = false;
  bool _isIconPickerVisible = false;

  void selectColor(selectedColor) {
    setState(() {
      pickedColor = selectedColor;
    });
  }

  void selectIcon(selectedIcon) {
    Icon icon = Icon(
      selectedIcon,
      color: Colors.black,
    );
    setState(() {
      pickedIcon = icon;
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
    color ??= Colors.black12;

    return InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          setState(() {
            _isColorPickerVisible = !_isColorPickerVisible;
            _isIconPickerVisible = false;
          });
        },
        child: _buildTextField(context, text, enabled, color));
  }

  Widget _buildIconTextField(context, text, enabled, icon) {
    icon ??= const Icon(Icons.add);

    return InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          setState(() {
            _isColorPickerVisible = false;
            _isIconPickerVisible = !_isIconPickerVisible;
          });
        },
        child: _buildTextField(context, text, enabled, Colors.black12, icon));
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

  Widget _buildTextField(context, text, enabled, [pickedColor, pickedIcon]) {
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
        fillColor: enabled ? Colors.black12 : pickedColor,
        suffixIcon: !enabled
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: pickedIcon ??
                        const Icon(
                          Icons.colorize,
                          color: Colors.black,
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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                  Row(
                    children: [
                      Expanded(
                        child: _buildColorTextField(
                          context,
                          'Colore',
                          false,
                          pickedColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _buildIconTextField(
                          context,
                          'Icona',
                          false,
                          pickedIcon,
                        ),
                      ),
                    ],
                  ),
                  if (_isColorPickerVisible)
                    AnimatedOpacity(
                      opacity: _isColorPickerVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: ColorPicker(
                        appBar.preferredSize.height,
                        selectColor,
                      ),
                    ),
                  if (_isIconPickerVisible)
                    AnimatedOpacity(
                      opacity: _isIconPickerVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: IconPicker(
                        appBar.preferredSize.height,
                        selectIcon,
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
          )),
    );
  }
}
