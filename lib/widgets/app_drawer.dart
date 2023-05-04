import 'package:fd_and_loan_calculator/screens/Home.dart';
import 'package:fd_and_loan_calculator/screens/Loan.dart';
import 'package:flutter/material.dart';


Widget myAppDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "FD calculator",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        ListTile(
          title: Text("Loan calculator", style: TextStyle(color: Colors.blue)),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Loan()));
          },
        ),
      ],
    ),
  );
}
