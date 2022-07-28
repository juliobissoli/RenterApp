class ClientModal {
  final String name;
  final String phone;
  // final String cpf;
  // final String public_place;

  ClientModal({required this.name, required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory ClientModal.fromMap(Map<String, dynamic> map) {
    return ClientModal(name: map['name'], phone: map['phone']);
  }

  factory ClientModal.fromJson(Map<String, dynamic> map) {
    return ClientModal(name: map['name'], phone: map['phone']);
  }
}
