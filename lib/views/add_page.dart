import 'package:flutter/material.dart';
import 'package:memo/storage/storage.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black45),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Add Task",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Task name cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Ex: Do Homework", isDense: true),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Storage.createTask(controller.text);

                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        }
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.black,
                        child: const Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
