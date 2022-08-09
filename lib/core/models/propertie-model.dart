import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:renter_app/core/models/address-model.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/interfaces/status.dart';

class PropertieModel {
  final String id;
  final AddressModal address;
  final List<String> images;
  final PropertiesStatus status;
  final String label;
  // final List<RentModel>? last_rents;

  PropertieModel({
    required this.id,
    required this.address,
    required this.images,
    required this.status,
    required this.label,
    // this.last_rents
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': AddressModal(
        label: address.label,
        cep: address.cep,
        city: address.city,
        public_place: address.public_place,
      ).toMap(),
      'status': propertiStatusDecode(status),
      'images': images.toList(),
      'label': label,
      // 'last_rents': last_rents?.map((x) => x.toMap()).toList(),
    };
  }

  factory PropertieModel.fromMap(Map<String, dynamic> map) {
    return PropertieModel(
      id: map['id'],
      address: AddressModal.fromMap(map['address']),
      status: propertieModelFromJson(map['status']),
      images: map['images'].cast<String>(),
      label: map['label'],
      // last_rents: List<RentModel>.from( map['last_rents'].map((x) => RentModel.fromMap(x))),
    );

    // images: List<String>.from(
    //     map['images']?.map((x) => StoneImageModel.fromMap(x))),
  }

  factory PropertieModel.fromJson(Map<String, dynamic> map) {
    print('fromJson ====> $map');
    return PropertieModel(
      id: map['id'],
      label: map['label'],
      address: AddressModal.fromJson(map['address']),
      status: propertieModelFromJson(map['status']),
      images: List<String>.from(map['images'].map((x) => x.toString())),
      // last_rents: List<RentModel>.from( map['last_rents']?.map((x) => RentModel.fromJson(x))),
    );
  }
}
