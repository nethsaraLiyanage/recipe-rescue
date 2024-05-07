import 'package:recipe_rescue/pages/thankyou_screen.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  QuestionScreen({super.key});

  final bool selectedRadio = false;
  late final bool question01;
  final String question02 = "";
  final String question03 = "";

  setSelectedRadio(String val) {
    setState(() {
      // selectedRadio = val;
    });
  }
  setQ1Radio(bool val) {
    setState(() {
      question01 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
  void onGetStarted() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const ThankYouScreen(),
          ),
          (route) => false);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quick Questions',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.2,
                width: size.width * 0.89,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 248, 248),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Is there any household food wastage generated currently ?',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: true,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("option 01");
                                },
                              ),
                              const Text(
                                'Yes',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                value: false,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("option 01");
                                },
                              ),
                              const Text(
                                'No',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * 0.231,
                width: size.width * 0.89,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 248, 248),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Select the household wastage that generates:',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("20%");
                                },
                              ),
                              const Text(
                                '20%',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                value: 2,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("40%");
                                },
                              ),
                              const Text(
                                '40%',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("80%");
                                },
                              ),
                              const Text(
                                '80%',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                value: 2,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("95%");
                                },
                              ),
                              const Text(
                                '95%',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * 0.231,
                width: size.width * 0.89,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 248, 248),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Select the type of food wastes raw ingredients :',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("option 01");
                                },
                              ),
                              const Text(
                                'Row Ingredients',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio("option 01");
                                },
                              ),
                              const Text(
                                'Cooked Meals',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomElevatedButton(
                    onButtonPressed: onGetStarted,
                    height: 59,
                    width: 275,
                    childWidget: Text(
                      'Next',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
            ],
          ),
        )
      ),
    );
  }

  void setState(Null Function() param0) {}
}
