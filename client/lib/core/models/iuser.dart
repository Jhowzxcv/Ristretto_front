class IUser {
  final int id;
  final String name;
  final String email;
  final String? theme;
  final int? defaultReminderMin;
  final String? avatarUrl;
  final DateTime? lastLogin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  IUser({
    required this.id,
    required this.name,
    required this.email,
    this.theme,
    this.defaultReminderMin,
    this.avatarUrl,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      theme: json['theme'],
      defaultReminderMin: json['defaultReminderMin'],
      avatarUrl: json['avatarUrl'],
      lastLogin: json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}