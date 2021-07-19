import 'package:flutter/material.dart';

class CameraDropdown extends StatefulWidget {
  final List<String> items;
  final Function(String? newValue) onChanged;

  const CameraDropdown({Key? key, required this.items, required this.onChanged})
      : super(key: key);
  @override
  _CameraDropdownState createState() => _CameraDropdownState();
}

class _CameraDropdownState extends State<CameraDropdown> {
  String? _selectedCameraType;
  @override
  void initState() {
    super.initState();
    _selectedCameraType = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedCameraType,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCameraType = newValue!;
        });
        widget.onChanged(newValue);
      },
      isExpanded: true,
      items: widget.items.map((type) {
        return DropdownMenuItem(
          child: Text(type),
          value: type,
        );
      }).toList(),
    );
  }
}
