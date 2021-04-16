import 'package:fa_flutter_ui_kit/src/data/models/country/country.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/index.dart';
import 'package:fa_flutter_ui_kit/src/widgets/login/index.dart';
import 'package:flutter/material.dart';

class FALoginPage extends StatefulWidget {
  final GlobalKey scaffoldKey;
  final GlobalKey formKey;
  final TextEditingController codeController;
  final TextEditingController phoneController;
  final bool isKeyboardOpen;
  final bool autoValidateCode;
  final bool isPhoneSubmitted;
  final bool autoValidatePhone;
  final List<Country> countryList;
  final Country selectedCountry;
  final void Function(Country item) onCountryChanged;
  final void Function(bool item) onPhoneSubmitChanged;
  final Function getActivationCode;
  final Function verifyCode;

  FALoginPage({
    this.scaffoldKey,
    this.formKey,
    this.codeController,
    this.phoneController,
    this.selectedCountry,
    this.countryList,
    this.isPhoneSubmitted = false,
    this.autoValidateCode = false,
    this.autoValidatePhone = false,
    this.isKeyboardOpen = false,
    this.onCountryChanged,
    this.onPhoneSubmitChanged,
    this.getActivationCode,
    this.verifyCode,
  });
  @override
  _FALoginPageState createState() => _FALoginPageState();
}

class _FALoginPageState extends State<FALoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: widget.formKey,
          child: Center(
            child: ResponsiveContainer(
              width: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Center(
                    child: Hero(
                      tag: 'FieldAssistLogo',
                      child: FieldAssistLogo(
                        height: 56,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.isPhoneSubmitted ? 'ACTIVATION CODE' : 'LOGIN',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 24),
                  if (widget.isPhoneSubmitted)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        EnterCodeTextField(
                          codeController: widget.codeController,
                          autoValidate: widget.autoValidateCode,
                        ),
                        InkWell(
                          onTap: () {
                            widget.onPhoneSubmitChanged(false);
                            widget.codeController.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context).primaryColorDark,
                                  size: 18,
                                ),
                                Text(
                                  'CHANGE PHONE NUMBER',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CountryPicker(
                          countryList: widget.countryList,
                          selectedCountryId: widget.selectedCountry.countryId,
                          onChanged: (val) {
                            widget.onCountryChanged(val);
                          },
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: EnterPhoneTextField(
                            phoneController: widget.phoneController,
                            autoValidate: widget.autoValidatePhone,
                          ),
                        ),
                      ],
                    ),
                  Spacer(),
                  if (!widget.isKeyboardOpen)
                    Center(
                      child: Hero(
                        tag: 'LaunchingGrowth',
                        child: LaunchingGrowthImage(
                          height: 170,
                        ),
                      ),
                    ),
                  Spacer(),
                  if (!widget.isPhoneSubmitted)
                    InkWell(
                      onTap: () {
                        widget.onPhoneSubmitChanged(true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'ENTER ACTIVATION CODE',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomActionButton(
        title: widget.isPhoneSubmitted ? 'LOGIN' : 'GET ACTIVATION CODE',
        showIcon: false,
        onPressed: widget.isPhoneSubmitted
            ? widget.verifyCode
            : widget.getActivationCode,
      ),
    );
  }
}
