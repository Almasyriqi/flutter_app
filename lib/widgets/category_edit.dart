import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/services/api.dart';

class CategoryEdit extends StatefulWidget {
  final Category category;

  CategoryEdit(this.category, {Key? key}) : super(key: key);

  @override
  _CategoryEditState createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  ApiService apiService = ApiService();
  String errorMessage = '';

  @override
  void initState() {
    categoryNameController.text = widget.category.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (text) => setState(() => errorMessage = ''),
                controller: categoryNameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Enter Category name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Category Name',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () => saveCategory(),
                      child: const Text('Save')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'))
                ],
              ),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              )
            ],
          )),
    );
  }

  Future saveCategory() async {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

    apiService
        .updateCategory(widget.category.id, categoryNameController.text)
        .then((Category category) => Navigator.pop(context))
        .catchError((exception) {
      setState(() {
        errorMessage = exception.toString();
      });
    });
  }
}
