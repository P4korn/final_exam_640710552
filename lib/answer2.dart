import 'package:flutter/material.dart';

class DeliveryCalculator extends StatefulWidget {
  const DeliveryCalculator({super.key});

  @override
  State<DeliveryCalculator> createState() => _DeliveryCalculatorState();
}

class _DeliveryCalculatorState extends State<DeliveryCalculator> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedItem;
  String? _deliveryspeed;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  int? optionalprice1 = 0;
  int? optionalprice2 = 0;
  int? deliveryprice = 0;
  double? weight;
  int? deliverspeedprice = 0;
  double? totalprice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณค่าจัดส่ง"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                child: Text("น้ำหนักสินค้า (กก.):")),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Weight';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        weight = double.parse(value);
                      });
                    })),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                child: Text("เลือกระยะทาง :")),
            Padding(
              padding: const EdgeInsets.only(right: 460.0),
              child: DropdownButton(
                hint: Text("เลือก"),
                value: _selectedItem,
                items: ["ในเมือง", "ต่างจังหวัด", "ต่างประเทศ"]
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                  setState(() {
                    if (_selectedItem == "ในเมือง") {
                      deliveryprice = 10;
                    } else if (_selectedItem == "ต่างจังหวัด") {
                      deliveryprice = 15;
                    } else {
                      deliveryprice = 50;
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                child: Text("บริการเสริม :")),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: [
                  CheckboxListTile(
                      title: const Text("แพ้คกิ้งพิเศษ (+20 บาท)"),
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          if (_isChecked1 = false) {
                            _isChecked1 = value!;
                            optionalprice1 = 0;
                          } else {
                            _isChecked1 = value!;
                            optionalprice1 = 20;
                          }
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("ประกันพัสดุ (+50 บาท)"),
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          if (_isChecked2 = false) {
                            _isChecked2 = value!;
                            optionalprice2 = 0;
                          } else {
                            _isChecked2 = value!;
                            optionalprice2 = 50;
                          }
                        });
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                child: Text("เลือกความเร่งด่วน :")),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text("ปกติ"),
                    value: 'ปกติ',
                    groupValue: _deliveryspeed,
                    onChanged: (value) {
                      setState(() {
                        _deliveryspeed = value.toString();
                        deliverspeedprice = 0;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("ด่วน"),
                    value: 'ด่วน',
                    groupValue: _deliveryspeed,
                    onChanged: (value) {
                      setState(() {
                        _deliveryspeed = value.toString();
                        deliverspeedprice = 30;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("ด่วนพิเศษ"),
                    value: 'ด่วนพิเศษ',
                    groupValue: _deliveryspeed,
                    onChanged: (value) {
                      setState(() {
                        _deliveryspeed = value.toString();
                        deliverspeedprice = 50;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid");
                  }
                  setState(() {});
                  totalprice = (deliveryprice! * weight!) +
                      optionalprice1! +
                      optionalprice2! +
                      deliverspeedprice!;
                },
                child: Text("คำนวณราคา")),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    color: Colors.blue,
                    child: Text(
                      "ค่าจัดส่งทั้งหมด : ฿$totalprice",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
