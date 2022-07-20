class AddressModal {
  final String label;
  final String cep;
  final String city;
  final String public_place;

  AddressModal({
    required this.label,
    required this.cep,
    required this.city,
    required this.public_place,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'cep': cep,
      'city': city,
      'public_place': public_place,
    };
  }

  factory AddressModal.fromMap(Map<String, dynamic> map) {
    return AddressModal(
        label: map['label'],
        cep: map['cep'],
        city: map['city'],
        public_place: map['public_place']);
  }

  factory AddressModal.fromJson(Map<String, dynamic> map) {
    return AddressModal(
        label: map['label'],
        cep: map['cep'],
        city: map['city'],
        public_place: map['public_place']);
  }
}
