class Wallet {
  String code;
  int balance;
  String status;
  bool needPassword;

  Wallet({required this.code, required this.balance, required this.status, required this.needPassword});

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
      code: json['code'],
      balance: json['balance'],
      status: json['status'],
      needPassword: json['needPassword'],
  );
}