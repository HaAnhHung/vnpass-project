class Customer {
  int id;
  String name;
  String phone;
  String email;
  int? createdAt;

  Customer({required this.id, required this.name, required this.phone, required this.email, this.createdAt});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      createdAt: json['createdAt']
  );
}