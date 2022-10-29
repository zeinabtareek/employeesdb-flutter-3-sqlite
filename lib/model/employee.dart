class Employee{

  int  id;
  String age;
  String name;
  String department;
  String city;
  String description;

  Employee(
        this.age, this.name , this.department,
      this.city,this.description);



  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(id != null){
      map['id'] = id;
    }
    map['age'] = age; //22
    map['name'] = name; //zeinab
    map['department'] = department;
    map['city'] = city;
    map['description'] = description;
    return map;
  } //

  Employee.fromMap(Map<String , dynamic> map){
   this.id = map['id'] ;
   this.age = map['age'] ;
    this.name = map['name']  ;
    this.department  = map['department']   ;
    this.city = map['city'] ;
    this.description  = map['description']   ;

  }


}
