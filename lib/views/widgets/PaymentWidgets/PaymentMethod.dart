import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int radiopaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 15,right: 15),
    child: Column(
      children: [
        buildRadioPayment(name: "payPal",image: "assets/images/paypal.png",scale: 0.7,
        value: 0, onChange: (int? value){
              setState(() {
                radiopaymentIndex = value!;
              });
            }
        ),
        SizedBox(height: 15,),
        buildRadioPayment(name: "googlePay",image: "assets/images/google.png",scale: 0.8,
            value: 1, onChange: (int? value){
              setState(() {
                radiopaymentIndex = value!;
              });
            }
        ),
        SizedBox(height: 15,),
        buildRadioPayment(name: "CreditCart",image: "assets/images/credit.png",scale: 0.7,
            value: 2, onChange: (int? value){
            setState(() {
              radiopaymentIndex = value!;
            });
            }
        ),
      ],
    ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText(
                size: 25,
                fontweight: FontWeight.bold,
                text: name,
                color: Colors.black,

              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radiopaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}