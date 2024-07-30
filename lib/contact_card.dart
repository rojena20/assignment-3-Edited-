import 'package:flutter/material.dart';

import 'models/contact_card_model.dart';

class ContactCard extends StatefulWidget {
  ContactCardModel contactCardModel;
  Function(ContactCardModel) delete;

  ContactCard(
      {super.key, required this.contactCardModel, required this.delete});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.contactCardModel.isVisible,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 30.0,
        ),
        margin: EdgeInsets.only(
          bottom: 15.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${widget.contactCardModel.contactName}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Phone: ${widget.contactCardModel.contactPhone}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                widget.delete(widget.contactCardModel);
                setState(() {});
              },
              child: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
