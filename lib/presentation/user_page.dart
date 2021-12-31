import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controllers/count_controller.dart';
import 'package:getx_state_management/controllers/user_controller.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);
  final UserController controller = Get.put(UserController());
  final CountController countController = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              TextField(
                controller: controller.editingController,
                decoration: const InputDecoration(
                    labelText: 'Enter User Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 40.0,
              ),
              GetX<UserController>(builder: (value) {
                return Text(
                  'UserName: ${value.user.value.userName}',
                  style: const TextStyle(fontSize: 22),
                );
              }),
              Obx(
                () => Text(
                  'Age: ${countController.obxCount}',
                  style: const TextStyle(fontSize: 22.0),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.updateUser(countController.obxCount.toString());
                  },
                  child: const Text('Update UserName'))
            ],
          ),
        ),
      ),
    );
  }
}
