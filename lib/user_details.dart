import 'dart:io';
import 'package:father_office_project/leading_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserDetails extends StatelessWidget {
  final Map<String, dynamic> contact;

  const UserDetails({
    super.key,
    required this.contact,
  });

  Widget keyValue({
    required String key,
    required String value,
    void Function()? onTap,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\u2739 ",
                ),
                TextSpan(
                  text: key,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                ),
                if (onTap != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: onTap,
                      child: const Padding(
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.copy,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingIconBtn(),
        title: Text("${contact["name"]}'s details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: contact["profile"] != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color(0xffB5C0FF),
                            width: 0.75,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.file(
                            File(contact["profile"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Image.asset(
                          "assets/Images/placeholder.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 25),
            keyValue(
              key: "Name",
              value: contact['name'],
            ),
            const SizedBox(height: 10),
            keyValue(
              key: "Mobile",
              value: contact['mobile'],
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: contact['mobile']));
                Fluttertoast.showToast(msg: "Copied");
              },
            ),
            const SizedBox(height: 10),
            keyValue(
              key: "Diamond",
              value: contact['diamond'],
            ),
            keyValue(
              key: "Item",
              value: contact['items'],
            ),
            keyValue(
              key: "Amount",
              value: contact['amount'],
            ),
            keyValue(
              key: "Total",
              value: contact['total'],
            ),
          ],
        ),
      ),
    );
  }
}
