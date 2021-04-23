import 'dart:async';
import 'dart:io';

import 'package:fa_flutter_ui_kit/src/config/index.dart';
import 'package:fa_flutter_ui_kit/src/data/models/index.dart';
import 'package:fa_flutter_ui_kit/src/modules/base/base_state.dart';
import 'package:fa_flutter_ui_kit/src/modules/login/index.dart';
import 'package:fa_flutter_ui_kit/src/utils/index.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/index.dart';
import 'package:fa_flutter_ui_kit/src/widgets/login/index.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:mobile_number_picker/mobile_number_picker.dart';

class FALoginPage extends StatefulWidget {
  @override
  _FALoginPageState createState() => _FALoginPageState();
}

class _FALoginPageState extends BaseState<FALoginPage>
    with AfterLayoutMixin<FALoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isKeyboardOpen = false;
  bool _autoValidateCode = false;
  bool _isPhoneSubmitted = false;
  bool _autoValidatePhone = false;
  final _loginDelegate = LoginDelegate();
  final _mobileNumberPicker = MobileNumberPicker();
  StreamSubscription _mobileStreamSubscription;
  List<Country> _countryList = <Country>[];
  Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _countryList = AppConfig.instance.countryList;
    _selectedCountry =
        _countryList.firstWhere((element) => element.dialCode == '91');
    KeyboardVisibilityNotification().addNewListener(
      onChange: (visible) {
        setState(() {
          _isKeyboardOpen = visible;
        });
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (Platform.isAndroid) {
      _initialiseMobilePicker();
    }
  }

  Future<void> _getActivationCode() async {
    if (_formKey.currentState.validate()) {
      final phone = _phoneController.text;
      await FAProgressDialog.show(context, message: 'Submitting Phone... ');
      final data = await _loginDelegate.getActivationCodeFromPhone(phone);
      await FAProgressDialog.hide();
      await data.when(
        success: () {
          if (mounted) {
            setState(() => _isPhoneSubmitted = true);
          }
        },
        failure: showSnackBar,
      );
    } else {
      if (mounted) {
        setState(() => _autoValidatePhone = true);
      }
    }
  }

  Future<void> _verifyCode() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      final code = _codeController.text;
      await FAProgressDialog.show(context, message: 'Verifying Code...');
      final data = await _loginDelegate.verifyActivationCode(code);
      await FAProgressDialog.hide();
      await data.when(
        success: (res) {
          try {
            String route = AppConfig
                .instance.navigator.navigationMap[MapKeys.loginSuccess];
            Navigator.of(context).pushNamedAndRemoveUntil(
                route, (Route<dynamic> route) => false);
          } catch (e, stack) {
            logger.e(e, stack);
          }
        },
        failure: showSnackBar,
      );
    } else {
      if (mounted) {
        setState(() => _autoValidateCode = true);
      }
    }
  }

  void _initialiseMobilePicker() {
    try {
      _mobileNumberPicker.mobileNumber();
      _mobileStreamSubscription = _mobileNumberPicker.getMobileNumberStream
          .listen((MobileNumber event) {
        final mobileNumber = event;
        if (mobileNumber.states == PhoneNumberStates.PhoneNumberSelected) {
          _setUpAutoLogin(mobileNumber.phoneNumber, mobileNumber.countryCode);
        }
      });
    } catch (e, stack) {
      logger.e(e, stack);
    }
  }

  void _setUpAutoLogin(String phoneNumber, String countryCode) {
    final code = countryCode.replaceAll('+', '');
    final country =
        _countryList.firstWhere((element) => element.dialCode == code) ?? [];
    _phoneController.text = phoneNumber;
    setState(() {
      _selectedCountry = country;
      _isPhoneSubmitted = true;
    });
    _getActivationCode();
  }

  @override
  void dispose() {
    _mobileNumberPicker.dispose();
    _phoneController?.dispose();
    _codeController?.dispose();
    _mobileStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
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
                    _isPhoneSubmitted ? 'ACTIVATION CODE' : 'LOGIN',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 24),
                  if (_isPhoneSubmitted)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        EnterCodeTextField(
                          codeController: _codeController,
                          autoValidate: _autoValidateCode,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isPhoneSubmitted = false;
                            });
                            _codeController.clear();
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
                          countryList: _countryList,
                          selectedCountryId: _selectedCountry.countryId,
                          onChanged: (val) {
                            setState(() {
                              _selectedCountry = val;
                            });
                          },
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: EnterPhoneTextField(
                            phoneController: _phoneController,
                            autoValidate: _autoValidatePhone,
                          ),
                        ),
                      ],
                    ),
                  Spacer(),
                  if (!_isKeyboardOpen)
                    Center(
                      child: Hero(
                        tag: 'LaunchingGrowth',
                        child: LaunchingGrowthImage(
                          height: 170,
                        ),
                      ),
                    ),
                  Spacer(),
                  if (!_isPhoneSubmitted)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isPhoneSubmitted = true;
                        });
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
        title: _isPhoneSubmitted ? 'LOGIN' : 'GET ACTIVATION CODE',
        showIcon: false,
        onPressed: _isPhoneSubmitted ? _verifyCode : _getActivationCode,
      ),
    );
  }
}
