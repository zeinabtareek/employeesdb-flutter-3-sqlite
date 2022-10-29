import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String name;
  final String id;
  final String dep;
  final String city;
  final String age;

    CustomListTile({
    Key key,
    this.name,
    this.id,
    this.dep,
    this.city,
    this.age,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(name,
          style: TextStyle(fontSize: 22.0,color: Colors.redAccent
          ),
        ),
        subtitle: Text('$age - ${city} - ${dep}',
          style: TextStyle(fontSize: 14.0,fontStyle: FontStyle.italic,
          ),
        ),
        leading: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(1.0)),
            CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 18.0,
              child: Text('${id}',
                style: TextStyle(fontSize: 22.0,color: Colors.white
                ),
              ),
            ),

          ],
        ),
        onTap: () {}
    );
  }
}

