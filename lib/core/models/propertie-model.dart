import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:renter_app/core/models/address-model.dart';
import 'package:renter_app/interfaces/status.dart';

class PropertieModel {
  final String id;
  final AddressModal address;
  final List<String> images;
  final PropertiesStatus status;
  final String label;

  PropertieModel(
      {required this.id,
      required this.address,
      required this.images,
      required this.status,
      required this.label});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'status': status,
      'images': images.toList(),
      'label': label,
    };
  }

  factory PropertieModel.fromMap(Map<String, dynamic> map) {
    return PropertieModel(
        id: map['id'],
        address: AddressModal.fromMap(map['address']),
        status: map['status'],
        images: map['images'],
        label: map['label']);

    // images: List<String>.from(
    //     map['images']?.map((x) => StoneImageModel.fromMap(x))),
  }

  factory PropertieModel.fromJson(Map<String, dynamic> map) {
    print(map);
    return PropertieModel(
      id: map['id'],
      label: map['label'],
      address: AddressModal.fromJson(map['address']),
      status: propertieModelFromJson(map['status']),
      images: List<String>.from(map['images']?.map((x) => x.toString())),
    );
  }
}
