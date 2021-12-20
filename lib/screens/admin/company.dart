// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:placement_records/screens/admin/add_company.dart';
import 'package:placement_records/screens/admin/company_details.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    String company_id;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        // setState(() {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             //CompanyDetails(companyid: '1')),
                        //   );
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          shadowColor: Colors.blue,
                          elevation: 8,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade50,
                                  Colors.blue.shade200
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Company Name ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      'XYZ',
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Company Id ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCompany()),
                  );
                },
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter Company Id \nto be deleted',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onSaved: (value) => setState(() => company_id = value!),
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 40.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue)),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
