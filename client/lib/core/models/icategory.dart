class ICategory{
  String name;
  String color;

  ICategory({required this.name,required this.color});

  factory ICategory.fromMap(Map<String,dynamic> map){
    return ICategory(
      name:map['name'],
      color:map['color'],
    );
  }
}
