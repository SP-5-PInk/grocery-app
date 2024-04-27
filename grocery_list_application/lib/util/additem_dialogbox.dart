import 'package:flutter/material.dart';
import 'package:grocery_list_application/util/my_button.dart';

class ItemDialogBox extends StatelessWidget {
  final nameController;
  final quantityController;
  final brandController;
  final categoryController;
  final notesController;
  VoidCallback onAdd;
  VoidCallback onCancel;
  
  ItemDialogBox({
    super.key, 
    required this.nameController,
    required this.quantityController,
    required this.brandController,
    required this.categoryController,
    required this.notesController,
    required this.onAdd,
    required this.onCancel,
  });

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> categoryItems = [
      DropdownMenuItem(child: Text("BEVERAGES"),value: "BEVERAGES"),
      DropdownMenuItem(child: Text("BREAD & BAKERY"),value: "BREAD & BAKERY"),
      DropdownMenuItem(child: Text("PRODUCE"),value: "PRODUCE"),
      DropdownMenuItem(child: Text("MEAT"),value: "MEAT"),
      DropdownMenuItem(child: Text("DAIRY"),value: "DAIRY"),
      DropdownMenuItem(child: Text("OTHER"),value: "OTHER"),
    ];
    return  categoryItems;
  } 
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text("ADD ITEM", style: TextStyle(fontWeight: FontWeight.w900)),),
      content: Container(
        height: 450,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0), width: 2)),
                      labelText: "Item Name",
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0), width: 2)),
                      labelText: "Qty",
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 10),
            TextField(
              controller: brandController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0), width: 2)),
                    labelText: "Brand",
                  ),
            ),
            DropdownButtonFormField(
              value: _selectedValue,
              onChanged: (String? newValue) {
                  _selectedValue = newValue!;
                  categoryController.text = newValue;
                },
              items: dropdownItems,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0), width: 2)),
                    labelText: "Category",
              ),
              
            ),
            TextField(
              controller: notesController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(left: 12, right: 12, top: 30, bottom: 30),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color.fromRGBO(12, 12, 12, 1.0), width: 2)),
                    labelText: "Notes",
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: "Add Item", color: Color.fromRGBO(12, 12, 12, 1.0), onPressed: onAdd),
                
                const SizedBox(width:10),
            
                MyButton(text: "Cancel", color: Color.fromRGBO(172, 45, 45, 1.0), onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}