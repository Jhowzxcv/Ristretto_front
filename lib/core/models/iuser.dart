class IUser{
  final String? id;
  final String name;
  final String email;
  final String password;

  const IUser({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, Object> toMap(){
    return{
      'name':name,
      'email':email,
      'password':password,
    };
  }

  factory IUser.fromMap(Map<String,Object?> map){
    return IUser(
      id:map['id'].toString(),
      name:map['name']as String,
      email:map['email']as String,
      password:map['password']as String,
    );
  }
}
