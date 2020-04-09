import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/states/states.dart';
import 'package:location/src/ui/widgets/widgets.dart';

class PinCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<PhoneAuthState>(context);
    return AuthLayout(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Enter pin code that sent to +00000003443"),
            SizedBox(height: 22),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 11),
                child: PinCodeTextField(
                  length: 8,
                  obsecureText: false,
                  textInputType: TextInputType.numberWithOptions(),
                  animationType: AnimationType.fade,
                  shape: PinCodeFieldShape.box,
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  backgroundColor: Colors.transparent,
                  activeColor: Colors.white70,
                  inactiveColor: Colors.white70,
                  selectedColor: Colors.white,
                  disabledColor: Colors.grey.shade700,
                  inactiveFillColor: Colors.white70,
                  activeFillColor: Colors.white70,
                  selectedFillColor: Colors.white,
                  enableActiveFill: true,
                  enabled: true,

                  // controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                )),
            SizedBox(height: 22),
            FlatButton(
              onPressed: () => null,
              child: Text("Resend Code"),
            ),
          ],
        ),
      ),
    );
  }
}
