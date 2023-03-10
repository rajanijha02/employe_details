import 'package:employe_details/app/modules/home/views/create_employe.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade500,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      value: controller.role[0],
                                      items: controller.role
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        controller.selectedRole.value =
                                            value as String;
                                        controller.getMinidashboardData();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      value: controller.gender[0],
                                      items: controller.gender
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        controller.selectedGender.value =
                                            value as String;
                                        controller.getMinidashboardData();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Text(
                                      '${controller.employees}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    );
                                  }),
                                  const Text(
                                    'Employee',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Text(
                                      '${controller.managers}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    );
                                  }),
                                  const Text(
                                    'Managers',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Text(
                                      '${controller.executives}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    );
                                  }),
                                  const Text(
                                    'Executives',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.employee[index].sN} ${controller.employee[index].firstName} ${controller.employee[index].lastName} - ${controller.employee[index].empId}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.updateEmployee(
                                        employe: controller.employee[index]);
                                    Get.defaultDialog(
                                      title: "Update Employee",
                                      content: CreateEmploye(),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            controller.updateDataFormate(
                                              e: controller.employee[index],
                                            );
                                            Get.back();
                                          },
                                          child: const Text("Update"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                      ],
                                    );
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    controller.deleteEmploye(
                                      id: controller.employee[index].id,
                                    );
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          )
                        ],
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.employee[index].role}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${controller.employee[index].oEmail}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Mob. No.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                controller.employee[index].aTMobNumber,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Reg. No.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                controller.employee[index].createdAt,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                controller.employee[index].status,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: controller.employee.length,
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          controller.changeDocsMode(value: false);
          controller.docsWidget.clear();
          controller.docs.clear();
          Get.defaultDialog(
            radius: 1.0,
            title: 'Create Employee',
            barrierDismissible: false,
            content: CreateEmploye(),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.createEmployee();
                },
                child: const Text('Create'),
              ),
            ],
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Employee'),
      ),
    );
  }
}
