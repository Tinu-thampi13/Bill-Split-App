import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class resultPage extends StatefulWidget {
  final double friends;
  final String tax;
  final String bill;
  final double tip;

  resultPage(this.bill, this.tip, this.friends, this.tax);

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  String dividedamount = '';
  @override
  void initState() {
    super.initState();
    divideamount();
  }

  divideamount() {
    double taxamount =
        double.parse(widget.bill) * double.parse(widget.tax) / 100;
    double finalbill =
        (double.parse(widget.bill) + taxamount + widget.tip) / widget.friends;
    setState(() {
      dividedamount = finalbill.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'Result',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Equally Divided: ',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Rs $dividedamount',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Friends:',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Tax:',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Tip:',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.friends.round().toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${widget.tax}%',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Rs ${widget.tip.round().toString()}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Card(
                    child: Column(
                      children: [
                        Text(
                          'Everyone should pay $dividedamount',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: Center(
                                child: Text(
                                  'Calculate Again ?',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
