import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class FormModel {
  const FormModel({
    required this.nationality,
    required this.consumerType,
    required this.gender,
    required this.nit,
    required this.identificationDocument,
    required this.firstName,
    required this.secondName,
    required this.fisrtLastName,
    required this.secondLastName,
    required this.marriedName,
    required this.direction,
    required this.zone,
    required this.departament,
    required this.municipality,
    required this.nearbyHeadquarters,
    required this.phoneAddress,
    required this.mobile,
    required this.docimicilioPhone,
    required this.email,
    required this.authorization,
  });
  factory FormModel.fromJson(String source) {
    final sourceTwo = json.decode(source) as Map<String, dynamic>;
    return FormModel.fromMap(sourceTwo);
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      nationality: map['nationality'].toString(),
      consumerType: map['consumerType'].toString(),
      gender: map['gender'].toString(),
      nit: map['nit'].toString(),
      identificationDocument: map['identificationDocument'].toString(),
      firstName: map['firstName'].toString(),
      secondName: map['secondName'].toString(),
      fisrtLastName: map['fisrtLastName'].toString(),
      secondLastName: map['secondLastName'].toString(),
      marriedName: map['marriedName'].toString(),
      direction: map['direction'].toString(),
      zone: map['zone'].toString(),
      departament: map['departament'].toString(),
      municipality: map['municipality'].toString(),
      nearbyHeadquarters: map['nearbyHeadquarters'].toString(),
      phoneAddress: map['phoneAddress'].toString(),
      mobile: map['mobile'].toString(),
      docimicilioPhone: map['docimicilioPhone'].toString(),
      email: map['email'].toString(),
      authorization: map['authorization'] as bool,
    );
  }
  final String nationality;
  final String consumerType;
  final String gender;
  final String nit;
  final String identificationDocument;
  final String firstName;
  final String secondName;
  final String fisrtLastName;
  final String secondLastName;
  final String marriedName;
  final String direction;
  final String zone;
  final String departament;
  final String municipality;
  final String nearbyHeadquarters;
  final String phoneAddress;
  final String mobile;
  final String docimicilioPhone;
  final String email;
  final bool authorization;

  FormModel copyWith({
    String? nationality,
    String? consumerType,
    String? gender,
    String? nit,
    String? identificationDocument,
    String? firstName,
    String? secondName,
    String? fisrtLastName,
    String? secondLastName,
    String? marriedName,
    String? direction,
    String? zone,
    String? departament,
    String? municipality,
    String? nearbyHeadquarters,
    String? phoneAddress,
    String? mobile,
    String? docimicilioPhone,
    String? email,
    bool? authorization,
  }) {
    return FormModel(
      nationality: nationality ?? this.nationality,
      consumerType: consumerType ?? this.consumerType,
      gender: gender ?? this.gender,
      nit: nit ?? this.nit,
      identificationDocument:
          identificationDocument ?? this.identificationDocument,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      fisrtLastName: fisrtLastName ?? this.fisrtLastName,
      secondLastName: secondLastName ?? this.secondLastName,
      marriedName: marriedName ?? this.marriedName,
      direction: direction ?? this.direction,
      zone: zone ?? this.zone,
      departament: departament ?? this.departament,
      municipality: municipality ?? this.municipality,
      nearbyHeadquarters: nearbyHeadquarters ?? this.nearbyHeadquarters,
      phoneAddress: phoneAddress ?? this.phoneAddress,
      mobile: mobile ?? this.mobile,
      docimicilioPhone: docimicilioPhone ?? this.docimicilioPhone,
      email: email ?? this.email,
      authorization: authorization ?? this.authorization,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nationality': nationality,
      'consumerType': consumerType,
      'gender': gender,
      'nit': nit,
      'identificationDocument': identificationDocument,
      'firstName': firstName,
      'secondName': secondName,
      'fisrtLastName': fisrtLastName,
      'secondLastName': secondLastName,
      'marriedName': marriedName,
      'direction': direction,
      'zone': zone,
      'departament': departament,
      'municipality': municipality,
      'nearbyHeadquarters': nearbyHeadquarters,
      'phoneAddress': phoneAddress,
      'mobile': mobile,
      'docimicilioPhone': docimicilioPhone,
      'email': email,
      'authorization': authorization,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return '''FormModel(nationality: $nationality, consumerType: $consumerType, gender: $gender, nit: $nit, identificationDocument: $identificationDocument, firstName: $firstName, secondName: $secondName, fisrtLastName: $fisrtLastName, secondLastName: $secondLastName, marriedName: $marriedName, direction: $direction, zone: $zone, departament: $departament, municipality: $municipality, nearbyHeadquarters: $nearbyHeadquarters, phoneAddress: $phoneAddress, mobile: $mobile, docimicilioPhone: $docimicilioPhone, email: $email, authorization: $authorization)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormModel &&
        other.nationality == nationality &&
        other.consumerType == consumerType &&
        other.gender == gender &&
        other.nit == nit &&
        other.identificationDocument == identificationDocument &&
        other.firstName == firstName &&
        other.secondName == secondName &&
        other.fisrtLastName == fisrtLastName &&
        other.secondLastName == secondLastName &&
        other.marriedName == marriedName &&
        other.direction == direction &&
        other.zone == zone &&
        other.departament == departament &&
        other.municipality == municipality &&
        other.nearbyHeadquarters == nearbyHeadquarters &&
        other.phoneAddress == phoneAddress &&
        other.mobile == mobile &&
        other.docimicilioPhone == docimicilioPhone &&
        other.email == email &&
        other.authorization == authorization;
  }

  @override
  int get hashCode {
    return nationality.hashCode ^
        consumerType.hashCode ^
        gender.hashCode ^
        nit.hashCode ^
        identificationDocument.hashCode ^
        firstName.hashCode ^
        secondName.hashCode ^
        fisrtLastName.hashCode ^
        secondLastName.hashCode ^
        marriedName.hashCode ^
        direction.hashCode ^
        zone.hashCode ^
        departament.hashCode ^
        municipality.hashCode ^
        nearbyHeadquarters.hashCode ^
        phoneAddress.hashCode ^
        mobile.hashCode ^
        docimicilioPhone.hashCode ^
        email.hashCode ^
        authorization.hashCode;
  }
}
