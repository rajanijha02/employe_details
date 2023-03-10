import 'package:employe_details/app/data/models/docs_model.dart';
import 'package:employe_details/app/data/models/employe_model.dart';
import 'package:employe_details/app/modules/home/views/docs_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  List<String> role = ['SELECT ROLE', 'Executive', 'Manager'];
  List<String> gender = ['SELECT GENDER', 'Male', 'Female'];
  List<String> status = ['SELECT STATUS', 'Active', 'Inactive'];

  Box<Employe> employeBox = Hive.box<Employe>('employe');
  RxBool docsAddMode = false.obs;

  RxList<Docs> docs = <Docs>[].obs;
  RxList<Widget> docsWidget = <Widget>[].obs;

  RxInt employees = 0.obs;
  RxInt managers = 0.obs;
  RxInt executives = 0.obs;
  RxString selectedRole = 'SELECT ROLE'.obs;
  RxString selectedGender = 'SELECT GENDER'.obs;
  RxString selectedStatus = 'SELECT STATUS'.obs;
  RxList<Employe> employee = <Employe>[].obs;
  RxBool updateMode = false.obs;
  RxString selectedId = ''.obs;

  Uuid uuid = const Uuid();

  createEmploye({required Employe data}) async {
    data.id = uuid.v1();
    await employeBox.put(data.id, data);
  }

  updateEmploye({required Employe data}) async {
    await employeBox.put(data.id, data);
    print('updated');
  }

  deleteEmploye({required String id}) async {
    await employeBox.delete(id);
  }

  @override
  onInit() {
    super.onInit();
    getMinidashboardData();
  }

  getMinidashboardData() async {
    List<Employe> employe = (selectedGender.value == 'SELECT GENDER' ||
            selectedRole.value == 'SELECT ROLE')
        ? employeBox.values.toList()
        : employeBox.values
            .where((element) => (element.role == selectedRole.value &&
                element.gender == selectedGender.value))
            .toList();
    employees.value = employe.length;
    employee.clear();
    employee.addAll(employe);
    managers.value =
        employe.where((element) => (element.role == 'Manager')).toList().length;
    executives.value = employe
        .where((element) => (element.role == 'Executive'))
        .toList()
        .length;
  }

  //-------------------_DATA TEXTCONTROLLER _-------------------//
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  RxString roleController = 'SELECT ROLE'.obs;
  RxString genderController = "SELECT GENDER".obs;
  TextEditingController oEmailController = TextEditingController();
  TextEditingController pEmailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController aTMobNumberController = TextEditingController();
  TextEditingController waNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController ctcController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController acNumController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();

  changeDocsMode({required bool value}) {
    docsAddMode.value = value;
    docsWidget.add(
      DocsForm(
        index: 0,
      ),
    );
  }

  addDocs() {
    docsWidget.add(
      DocsForm(
        index: docsWidget.length,
      ),
    );
  }

  createEmployee() async {
    // TODO: validate form

    Employe employe = Employe(
      createdAt: DateTime.now().toString(),
      status: selectedStatus.value,
      sN: (employeBox.values.length + 1).toString(),
      empId: (2000 + employeBox.values.length + 1).toString(),
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      role: roleController.value,
      gender: genderController.value,
      oEmail: oEmailController.text,
      pEmail: pEmailController.text,
      mobile: mobileController.text,
      aTMobNumber: aTMobNumberController.text,
      waNumber: waNumberController.text,
      password: passwordController.text,
      address: addressController.text,
      landMark: landMarkController.text,
      city: cityController.text,
      state: stateController.text,
      pincode: pincodeController.text,
      ctc: ctcController.text,
      bankName: bankNameController.text,
      acNum: acNumController.text,
      ifsc: ifscController.text,
      panNumber: panNumberController.text,
      designation: designationController.text,
      workLocation: workLocationController.text,
      docs: docs.value,
      id: '',
    );

    await createEmploye(data: employe);
    print('employee created');
    docsAddMode.value=false;
    docsWidget.clear();
    firstNameController.clear();
    lastNameController.clear();
    oEmailController.clear();
    passwordController.clear();
    pEmailController.clear();
    cityController.clear();
    stateController.clear();
    pincodeController.clear();
    ctcController.clear();
    bankNameController.clear();
    acNumController.clear();
    ifscController.clear();
    panNumberController.clear();
    aTMobNumberController.clear();
    Get.back();
  }

  updateDataFormate({required Employe e}) async {
    Employe employe = Employe(
      createdAt: e.createdAt,
      status: selectedStatus.value,
      sN: e.sN,
      empId: e.empId,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      role: roleController.value,
      gender: genderController.value,
      oEmail: oEmailController.text,
      pEmail: pEmailController.text,
      mobile: mobileController.text,
      aTMobNumber: aTMobNumberController.text,
      waNumber: waNumberController.text,
      password: passwordController.text,
      address: addressController.text,
      landMark: landMarkController.text,
      city: cityController.text,
      state: stateController.text,
      pincode: pincodeController.text,
      ctc: ctcController.text,
      bankName: bankNameController.text,
      acNum: acNumController.text,
      ifsc: ifscController.text,
      panNumber: panNumberController.text,
      designation: designationController.text,
      workLocation: workLocationController.text,
      docs: docs.value,
      id: e.id,
    );

    await updateEmploye(data: employe);
    await getMinidashboardData();
  }

  updateEmployee({required Employe employe}) async {
    selectedId.value = employe.id;
    updateMode.value = true;
    firstNameController.text = employe.firstName;
    lastNameController.text = employe.lastName;
    roleController.value = employe.role;
    genderController.value = employe.gender;
    oEmailController.text = employe.oEmail;
    pEmailController.text = employe.pEmail;
    mobileController.text = employe.mobile;
    aTMobNumberController.text = employe.aTMobNumber;
    waNumberController.text = employe.waNumber;
    passwordController.text = employe.password;
    addressController.text = employe.address;
    landMarkController.text = employe.landMark;
    cityController.text = employe.city;
    stateController.text = employe.state;
    pincodeController.text = employe.pincode;
    ctcController.text = employe.ctc;
    bankNameController.text = employe.bankName;
    acNumController.text = employe.acNum;
    ifscController.text = employe.ifsc;
    panNumberController.text = employe.panNumber;
    designationController.text = employe.designation;
    workLocationController.text = employe.workLocation;
    docs.value = employe.docs;
    selectedStatus.value = employe.status;
    docsAddMode.value=false;
    docsWidget.clear();
    firstNameController.clear();
    lastNameController.clear();
    oEmailController.clear();
    passwordController.clear();
    pEmailController.clear();
    cityController.clear();
    stateController.clear();
    pincodeController.clear();
    ctcController.clear();
    bankNameController.clear();
    acNumController.clear();
    ifscController.clear();
    panNumberController.clear();
    aTMobNumberController.clear();
    Get.back();
  }
}
