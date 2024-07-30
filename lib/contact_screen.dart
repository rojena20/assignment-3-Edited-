import 'package:assignment3_edited/textField.dart';
import 'package:flutter/material.dart';

import 'contact_card.dart';
import 'models/contact_card_model.dart';
import 'models/textField_model.dart';

class ContactScreen extends StatefulWidget {
  static const String routeName = "ContactScreen";

  ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String name = "";
  String phone = "";
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<ContactCardModel> contactCardModels = [];
  final _formKey = GlobalKey<FormState>();

  String? nameValidation(String? input) {
    if (input == null || input.isEmpty) {
      return "name can't be empty";
    } else {
      return null;
    }
  }

  String? phoneValidation(String? input) {
    if (input == null || input.isEmpty) {
      return "phone can't be empty";
    } else {
      return null;
    }
  }

  void deleteContact(ContactCardModel contactCardMod) {
    contactCardMod.isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 150, 243),
          title: Center(
            child: Text(
              "Contacts Screen",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          color: Color.fromARGB(255, 158, 158, 158),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          width: double.infinity,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Textfield(
                      textfiledModel: TextfiledModel(
                        textFiledPlaceholder: "Enter Your Name Here",
                        textFiledIcon: Icon(Icons.edit),
                      ),
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      valid: nameValidation,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Textfield(
                      textfiledModel: TextfiledModel(
                        textFiledPlaceholder: "Enter Your Phone Here",
                        textFiledIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      valid: phoneValidation,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color.fromARGB(255, 33, 150, 243),
                                ),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                name = _nameController.text;
                                phone = _phoneController.text;
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  contactCardModels.add(
                                    ContactCardModel(
                                      contactName: name,
                                      contactPhone: phone,
                                      isVisible: true,
                                    ),
                                  );
                                }
                                setState(() {});
                                _nameController.clear();
                                _phoneController.clear();
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (var contactCardModel in contactCardModels)
                    ContactCard(
                      key: UniqueKey(),
                      contactCardModel: contactCardModel,
                      delete: deleteContact,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
