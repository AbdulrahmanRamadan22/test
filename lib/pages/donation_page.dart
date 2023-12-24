import 'package:flutter/material.dart';
import 'package:login_firebase/pages/account_page.dart';
import 'package:login_firebase/widgets/defaultButton.dart';
import 'package:login_firebase/widgets/show_toast.dart';
import 'package:login_firebase/widgets/text_field.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  var donationAmount = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donation"), centerTitle: true),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultFormField(
                  controller: donationAmount,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "donationAmount  must not be empty";
                    } else if (double.parse(value).toInt() <= 0) {
                      return "You must enter a valid number";
                    }
                    return null;
                  },
                  type: TextInputType.number,
                  hint: "Enter the amount "),
              const SizedBox(
                height: 40,
              ),
              defaultButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      showToast(
                          msg: "Your donation has been successful",
                          backgroundColor: Colors.grey);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountPage(
                                  myBalanceAfterDonating:
                                      double.parse(donationAmount.text),
                                )),
                      );
                    }
                  },
                  height: 50,
                  radius: 8,
                  width: 300,
                  text: "اتمام  عمليه التبرع"),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // dispose() {

  //   donationAmount.dispose();

  //   super.dispose();
  // }
}
