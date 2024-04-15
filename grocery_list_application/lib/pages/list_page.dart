import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_application/util/edititem_dialogbox.dart';
import 'package:grocery_list_application/util/item_tile.dart';
import 'package:grocery_list_application/util/additem_dialogbox.dart';

class ListPage extends StatefulWidget {
  final String listName;
  
  ListPage({
    super.key, 
    required this.listName
  });

  @override
  State<ListPage> createState() => _ListPageState();
}

class GroceryItem {
  String itemName; 
  int? itemQuantity;
  String? itemBrand;
  String? itemCategory;
  String? itemNotes;
  bool? itemChecked;

  GroceryItem({
    required this.itemName, 
    this.itemQuantity = 1,
    this.itemBrand,
    this.itemCategory,
    this.itemNotes,
    this.itemChecked = false,
  });
}

class _ListPageState extends State<ListPage> {
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final brandController = TextEditingController();
  final categoryController = TextEditingController();
  final notesController = TextEditingController();

  List<GroceryItem> itemList = [];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      itemList[index].itemChecked = value ?? false;
    });
  }

  void createNewItem() {
    showDialog(
      context: context, 
      builder: (context) {
        return ItemDialogBox(
          nameController: nameController,
          quantityController: quantityController,
          brandController: brandController,
          categoryController: categoryController,
          notesController: notesController,
          onAdd: saveNewItem,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewItem() {
    if(nameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("ERROR")),
            content: Container(
              height: 100,
              child: const Center(
                child: Text("Item Name field cannot be empty", style: TextStyle(color: Color.fromRGBO(172, 45, 45, 1.0), fontSize: 18), textAlign: TextAlign.center),
              ),
            ),
          );  
        },
      );
      return;
    }
    setState(() {
      itemList.add(GroceryItem(
        itemName: nameController.text,
        itemQuantity: int.tryParse(quantityController.text),
        itemBrand: brandController.text,
        itemCategory: categoryController.text,
        itemNotes: notesController.text,
        ));
      nameController.clear();
      quantityController.clear();
      brandController.clear();
      categoryController.clear();
      notesController.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteItem(int index) {
    setState(() {
      itemList.removeAt(index);
    });
  }

  void editItem(index) async {
    //final itemFromList = itemList[index];
    showDialog(
      context: context, 
      builder: (context) {
        return EditItemDialogBox(
          nameController: nameController,
          quantityController: quantityController,
          brandController: brandController,
          notesController: notesController,
          existingItemName: itemList[index].itemName,
          existingItemQuantity: itemList[index].itemQuantity,
          existingItemBrand: itemList[index].itemBrand,
          existingItemCategory: itemList[index].itemCategory,
          existingItemNotes: itemList[index].itemNotes,
          onSave: () {
            setState(() {
              itemList[index].itemName = nameController.text;
              nameController.clear();
            });
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9679),
      appBar: AppBar(
        backgroundColor: Color(0xFF5A9679),
        toolbarHeight: 100,
        leading: Builder(
            builder:(context) {
            return IconButton(
              icon: const Padding(padding: EdgeInsets.only(left: 15), child: Icon(Icons.arrow_back_rounded, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)),
              onPressed: () {
                Navigator.of(context).pop();
            },
            );
            }  
          ),
        centerTitle: true,
        title: Text(widget.listName, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0)),),
        //title: const Text(appBarTitle, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Color.fromRGBO(42, 64, 53, 1.0)),),
        actions: [
            IconButton(
              icon: const Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.add_rounded, color: Color.fromRGBO(42, 64, 53, 1.0), size: 40)), // Add the icon here and set its color
              onPressed: createNewItem,
            ),
          ],
      ),

      body: Column(
        children: [
          SizedBox(height: 40,),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return GroceryItemTile(
                  itemName: itemList[index].itemName, 
                  itemChecked: itemList[index].itemChecked, 
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteItem(index),
                  editFunction: (context) => editItem(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }    
}