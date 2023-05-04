import 'package:fd_and_loan_calculator/screens/Loan.dart';
import 'package:fd_and_loan_calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double total = 0;
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();

  void calculation() {
    final calinterestrate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final interest = calinterestrate * int.parse(_controller1.text);
    setState(() {
      total = int.parse(_controller1.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("FD Calculator"),
      drawer: myAppDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Fixed Deposit",
                            style: GoogleFonts.robotoMono(
                                fontSize: 35, color: Colors.white)),
                        Text("Calculator",
                            style: GoogleFonts.robotoMono(
                                fontSize: 35, color: Colors.white))
                      ]),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Enter Amount"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controller1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "e.g. 10000"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Interest Rate"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controller2,
                                                keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "e.g. 8"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Enter period (in months)"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controller3,
                                                keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "e.g. 10"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  calculation();
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Calculate",
                    style: GoogleFonts.robotoMono(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Result:" + total.toStringAsFixed(2),
                        style: GoogleFonts.robotoMono(
                            fontSize: 15, color: Colors.black))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
