// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import '../step2/choose_option_btmsheet.dart';
// import '../text_form_field_component.dart';
// import 'camera_picker_function.dart';
//
// class Fill_Up_Form extends StatefulWidget {
//   Fill_Up_Form({Key? key}) : super(key: key);
//
//   @override
//   State<Fill_Up_Form> createState() => _Fill_Up_FormState();
// }
//
// class _Fill_Up_FormState extends State<Fill_Up_Form> {
//   File? imageFile;
//   XFile? cameraPhoto;
//   DateTime date = new DateTime.now();
//   TextEditingController pnameController = TextEditingController();
//   TextEditingController diamondController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController gstController = TextEditingController();
//   TextEditingController itemController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController totalController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   String? selctedItem;
//   String? selctedItemi;
//   final List<String> _itemei = [
//     "Income",
//     "Expand",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown.shade700,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//           ),
//         ),
//         title: Center(
//           child: Text(
//             "Add Details",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: IconButton(
//               onPressed: () async {
//                 XFile? file = await cameraPicker();
//
//                 if (file != null) {
//                   setState(() {
//                     cameraPhoto = file;
//                   });
//                 }
//               },
//               icon: Icon(Icons.camera_alt_outlined),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(17),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     File? file = await showModalBottomSheet(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       context: context,
//                       builder: (context) {
//                         return ChooseOptionsBottomSheet();
//                       },
//                     );
//                     if (file != null) {
//                       file:file;
//                       if (file != null) {
//                         setState(() {
//                           imageFile = file;
//                         });
//                       }
//                     }
//                     FocusManager.instance.primaryFocus?.unfocus();
//                   },
//                   child: ClipOval(
//                     child: Container(
//                       width: 90,
//                       height: 90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(80),
//                         color: Colors.black.withOpacity(0.2),
//                       ),
//                       child: ClipOval(
//                         child: imageFile != null
//                             ? Image.file(
//                                 imageFile!,
//                                 fit: BoxFit.cover,
//                               )
//                             : Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Image.asset(
//                                   "assets/owner.png",
//                                   fit: BoxFit.cover,
//                                 ),
//                             ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: Center(
//                     child: TextButton(
//                       onPressed: () async {
//                         DateTime? newDate = await showDatePicker(
//                             context: context,
//                             initialDate: date,
//                             firstDate: DateTime(2020),
//                             lastDate: DateTime(2100));
//                         if (newDate == Null) return;
//                         setState(() {
//                           date = newDate!;
//                         });
//                       },
//                       child: Text(
//                         'Date : ${date.year} / ${date.day} / ${date.month}',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.brown.shade700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 MyTextFormField(
//                   controller: pnameController,
//                   label: "Person Name",
//                   validator: (name) {
//                     if (name == null || name.trim().isEmpty) {
//                       return "Please enter name";
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 MyTextFormField(
//                   controller: diamondController,
//                   label: "Diamond Type",
//                   validator: (name) {
//                     if (name == null || name.trim().isEmpty) {
//                       return "Please enter diamond type";
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 MyTextFormField(
//                   controller: mobileController,
//                   label: "Mobile Number",
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp('[0-9]')),
//                   ],
//                   keyboardType: TextInputType.number,
//                   maxLength: 10,
//                   validator: (phone) {
//                     if (phone == null || phone.trim().isEmpty) {
//                       return "Please enter phone number";
//                     } else {
//                       if (phone.trim().length != 10) {
//                         return "Invalid number";
//                       } else {
//                         return null;
//                       }
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 MyTextFormField(
//                   controller: itemController,
//                   label: "Items",
//                   validator: (item) {
//                     if (item == null || item.trim().isEmpty) {
//                       return null;
//                     } else {
//                       Pattern pattern = r'^\d+\.?\d{0,9}';
//                       RegExp regexp = RegExp(pattern.toString());
//                       if (regexp.hasMatch(item.trim())) {
//                         return null;
//                       } else {
//                         return "Please enter valid items";
//                       }
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 MyTextFormField(
//                   controller: amountController,
//                   label: "Amount",
//                   validator: (amount) {
//                     if (amount == null || amount.trim().isEmpty) {
//                       return null;
//                     } else {
//                       Pattern pattern = r'^\d+\.?\d{0,9}';
//                       RegExp regexp = RegExp(pattern.toString());
//                       if (regexp.hasMatch(amount.trim())) {
//                         return null;
//                       } else {
//                         return "Please enter valid amount";
//                       }
//                     }
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12),
//                   width: 324,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       width: 0.75,
//                       color: Colors.brown,
//                     ),
//                   ),
//                   child: DropdownButton<String>(
//                     value: selctedItemi,
//                     onChanged: ((value) {
//                       setState(() {
//                         selctedItemi = value!;
//                       });
//                     }),
//                     items: _itemei
//                         .map((e) => DropdownMenuItem(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       e,
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               value: e,
//                             ))
//                         .toList(),
//                     selectedItemBuilder: (BuildContext context) => _itemei
//                         .map((e) => Row(
//                               children: [Text(e)],
//                             ))
//                         .toList(),
//                     hint: Padding(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: Text(
//                         'How',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                     dropdownColor: Colors.white,
//                     isExpanded: true,
//                     underline: Container(),
//                   ),
//                 ),
//                 SizedBox(height: 25),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.brown.shade700),
//                     ),
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         Map<String, dynamic> userInfo = {
//                           'name': pnameController.text.trim(),
//                           'diamond': diamondController.text.trim(),
//                           'mobile': mobileController.text.trim(),
//                           'items': itemController.text.trim(),
//                           'amount': amountController.text.trim(),
//                           'profile': imageFile,
//                           'total': totalController,
//                         };
//                         Navigator.pop(context, userInfo);
//                       }
//                     },
//                     child: Text(
//                       "save",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
import 'dart:io';
import 'package:father_office_project/choose_options_bottom_sheet.dart';
import 'package:father_office_project/custom_btn.dart';
import 'package:father_office_project/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Second_Page extends StatefulWidget {
  final Map<String, dynamic>? contact;
  final int? index;
  Second_Page({Key? key, this.contact, this.index}) : super(key: key);

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  File? imageFile;
  XFile? cameraPhoto;
  DateTime date = DateTime.now();
  TextEditingController pnameController = TextEditingController();
  TextEditingController diamondController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selctedItem;
  String? selctedItemi;
  final List<String> _itemei = [
    "Income",
    "Expense",
  ];

  List<Map<String, dynamic>> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB5C0FF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color:  Color(0xff152228),
          ),
        ),
        title: Text(
          "Add Details",
          style: TextStyle(
              color: Color(0xff152228), fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    File? file = await showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      context: context,
                      builder: (context) {
                        return ChooseOptionsBottomSheet();
                      },
                    );
                    if(file!=null){
                      file:file;
                      if (file != null) {
                        setState(() {
                          imageFile = file;
                        });
                      }
                    }
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ClipOval(
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.black.withOpacity(0.2),
                      ),
                      child: ClipOval(
                        child: imageFile != null
                            ? Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                        )
                            : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/owner.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return;
                        setState(() {
                          date = newDate!;
                        });
                      },
                      child: Text(
                        'Date: ${date.year} / ${date.day} / ${date.month}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff152228),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MyTextFormField(
                  controller: pnameController,
                  label: "Person Name",
                  validator: (name) {
                    if (name == null || name.trim().isEmpty) {
                      return "Please enter name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                MyTextFormField(
                  controller: diamondController,
                  label: "Diamond Type",
                  validator: (name) {
                    if (name == null || name.trim().isEmpty) {
                      return "Please enter diamond type";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                MyTextFormField(
                  controller: mobileController,
                  label: "Mobile Number",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (phone) {
                    if (phone == null || phone.trim().isEmpty) {
                      return "Please enter phone number";
                    } else {
                      if (phone.trim().length != 10) {
                        return "Invalid number";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(height: 20),
                MyTextFormField(
                  controller: itemController,
                  label: "Items",
                  validator: (item) {
                    if (item == null || item.trim().isEmpty) {
                      return null;
                    } else {
                      Pattern pattern = r'^\d+\.?\d{0,9}';
                      RegExp regexp = RegExp(pattern.toString());
                      if (regexp.hasMatch(item.trim())) {
                        return null;
                      } else {
                        return "Please enter valid items";
                      }
                    }
                  },
                ),
                SizedBox(height: 20),
                MyTextFormField(
                  controller: amountController,
                  label: "Amount",
                  validator: (amount) {
                    if (amount == null || amount.trim().isEmpty) {
                      return null;
                    } else {
                      Pattern pattern = r'^\d+\.?\d{0,9}';
                      RegExp regexp = RegExp(pattern.toString());
                      if (regexp.hasMatch(amount.trim())) {
                        return null;
                      } else {
                        return "Please enter valid amount";
                      }
                    }
                  },
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 324,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.75,
                      color: Color(0xff152228),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selctedItemi,
                    onChanged: (value) {
                      setState(() {
                        selctedItemi = value!;
                      });
                    },
                    items: _itemei
                        .map(
                          (e) => DropdownMenuItem(
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                e,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                        value: e,
                      ),
                    )
                        .toList(),
                    isExpanded: true,
                    hint: Text(
                      "Select Item",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        double item = double.parse(itemController.text);
                        double amount = double.parse(amountController.text);
                        double total = item * amount;

                        setState(() {
                          itemList.add({
                            'item': item,
                            'amount': amount,
                            'total': total,
                          });
                        });

                        itemController.clear();
                        amountController.clear();
                        totalController.text = itemList
                            .map((item) => item['total'])
                            .reduce((value, element) => value + element)
                            .toString();
                      }
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xffB5C0FF),)),
                    child: Text("Total",style: TextStyle(color: Color(0xff152228),),),
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Item: ${itemList[index]['item']}"),
                      subtitle: Text("Amount: ${itemList[index]['amount']}"),
                      trailing: Text("Total: ${itemList[index]['total']}"),
                    );
                  },
                ),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomBtn(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> userInfo = {
                            'name': pnameController.text.trim(),
                            'mobile': mobileController.text.trim(),
                            'items' : itemController.text.trim(),
                            'amount' :amountController.text.trim(),
                            'profile': imageFile != null ? imageFile!.path : null,
                          };
                          Navigator.pop(context);
                        }
                      },
                      title: widget.contact != null ? "Update" : "Save",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
