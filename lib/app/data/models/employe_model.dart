import 'package:employe_details/app/data/models/docs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
part 'employe_model.g.dart';

@HiveType(typeId: 2)
class Employe {
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String role;
  @HiveField(4)
  String gender;
  @HiveField(5)
  String oEmail;
  @HiveField(6)
  String pEmail;
  @HiveField(7)
  String mobile;
  @HiveField(8)
  String aTMobNumber;
  @HiveField(9)
  String waNumber;
  @HiveField(10)
  String password;
  @HiveField(11)
  String address;
  @HiveField(12)
  String landMark;
  @HiveField(13)
  String city;
  @HiveField(14)
  String state;
  @HiveField(15)
  String pincode;
  @HiveField(16)
  String ctc;
  @HiveField(17)
  String bankName;
  @HiveField(18)
  String acNum;
  @HiveField(19)
  String ifsc;
  @HiveField(20)
  String panNumber;
  @HiveField(21)
  String designation;
  @HiveField(22)
  String workLocation;
  @HiveField(23)
  List<Docs> docs;
  @HiveField(24)
  String id;
  @HiveField(25)
  String empId;
  @HiveField(26)
  String sN;
  @HiveField(27)
  String createdAt;
  @HiveField(28)
  String status;

  Employe({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.gender,
    required this.oEmail,
    required this.pEmail,
    required this.mobile,
    required this.aTMobNumber,
    required this.waNumber,
    required this.password,
    required this.address,
    required this.landMark,
    required this.city,
    required this.state,
    required this.pincode,
    required this.ctc,
    required this.bankName,
    required this.acNum,
    required this.ifsc,
    required this.panNumber,
    required this.designation,
    required this.workLocation,
    required this.docs,
    required this.id,
    required this.empId,
    required this.sN,
    required this.createdAt,
    required this.status,
  });
}
