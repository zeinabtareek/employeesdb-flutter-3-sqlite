import 'package:employeesdb/model/employee.dart';
import 'package:employeesdb/ui/employee_screen.dart';
import 'package:flutter/material.dart';
 import 'package:employeesdb/utils/database_helper.dart';
import '../componants/custom_icon_button.dart';
import '../componants/custom_list_tile.dart';
import 'employee_info.dart';

class ListViewEmployees extends StatefulWidget{
  @override
    _ListViewEmployeesState createState() => new _ListViewEmployeesState();
}class _ListViewEmployeesState extends State<ListViewEmployees>{


  /******start******/

 DatabaseHelper  db =DatabaseHelper(); //instance(obj)

 List<Employee> items =[];

  @override
  void initState() {
    super.initState(); //بعد ما تخرج الداتا  اعمل كذا
     db.getAllEmployees().then((listOfMapsFromDatBase) { //list =>list empolyee
       listOfMapsFromDatBase.forEach((mapOfEmployee){ //element inside this list
        items.add(Employee.fromMap(mapOfEmployee));
      });
    });
  }

/******end*****/


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Employees',
      home: Scaffold(
        appBar: AppBar(
          title: Text('All Employees'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,//6,7,9
              padding:const EdgeInsets.all(15.0),
              itemBuilder: (context , index){
              return Column(
                children: <Widget>[
                  Divider(height: 5.0,),
                  Row( //expanded //container =width 30//300-60
                     children: <Widget>[
                       Expanded(child: CustomListTile(name:'${items[index].name }',id:'${items[index].id }' ,age:'${items[index].age }' ,dep: '${items[index].department }',city : '${items[index].city }',)),
                       CustomIconButton(icon :Icons.edit, onPressed: (){},colorOfIcon: Colors.blueAccent, ),//30
                       CustomIconButton(icon :Icons.delete, onPressed: (){
                         db.deleteEmployee(items[index].id).then((value){
                         print(value);
                         items.removeAt(items[index].id);
                         setState(() {});
                       });},colorOfIcon: Colors.red, ),
                     ],
                  ),
                ],
              );
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.deepOrange,
            onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeScreen(Employee('', '', '', '',''))));
              }),



      ),

    );
    }

 void _createNewEmployee(BuildContext context) async{
   String result = await Navigator.push(
     context,
     MaterialPageRoute(builder:(context) => EmployeeScreen(
         Employee(  '', '', '', '', ''))),
   );

   if(result == 'save'){
     db.getAllEmployees().then((employees){
       setState(() {
         items.clear();
         employees.forEach((employee){
           items.add(Employee.fromMap(employee));
         });
       });
     });
   }
 }




     navigateToEmployee(BuildContext context ,Employee employee)async{
    String result = await Navigator.push(
        context,
      MaterialPageRoute(builder:(context) => EmployeeScreen(employee)),
    );

    if(result == 'update'){
      db.getAllEmployees().then((employees){
         setState(() {
           items.clear();
           employees.forEach((employee){
             items.add(Employee.fromMap(employee));
           });
         });
      });
    }
 }




  void  _navigateToEmployeeInfo(BuildContext context ,Employee employee)async{
      await Navigator.push(
      context,
      MaterialPageRoute(builder:(context) => EmployeeInfo(employee)),
    );


  }
  }









