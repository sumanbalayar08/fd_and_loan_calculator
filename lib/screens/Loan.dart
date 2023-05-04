import 'package:fd_and_loan_calculator/screens/Loan.dart';
import 'package:fd_and_loan_calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class Loan extends StatelessWidget {
  const Loan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Loan Calculator"),
      drawer: myAppDrawer(context),
    );
  }
}
