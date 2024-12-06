import 'package:flutter/material.dart';
import 'package:to_do_hive/pages/pages.dart';
import './my_button.dart';
import './my_radiobutton.dart';

class DialogBox extends StatefulWidget {
  final Function(String)? onSave;
  VoidCallback onCancel;
  final titlecontroller;
  final contentcontroller;
  DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.contentcontroller,
    required this.titlecontroller,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  String _currentStatusToPass = "Complete";

  void _handlestatusChange(String newSts) {
    setState(() {
      _currentStatusToPass = newSts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[700],
      content: Container(
        height: 300.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              TextField(
                controller: widget.titlecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new Ttile',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: widget.contentcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new Content',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyNewRadioButton(
                    currentStatusToPass: _currentStatusToPass,
                    onStatusChanged: _handlestatusChange,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyNewButton(
                      text: 'SAVE',
                      onPressed: () {
                        if (widget.onSave != null) {
                          widget.onSave!(_currentStatusToPass);
                        }
                      }),
                  MyNewButton(text: 'CANCEL', onPressed: widget.onCancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
