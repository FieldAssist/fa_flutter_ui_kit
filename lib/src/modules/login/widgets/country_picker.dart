import 'dart:async';
import 'dart:convert';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({
    this.selectedCountryId,
    this.selectedCountryName,
    this.onChanged,
    this.onCancel,
    this.isSelectEnable = true,
    this.selectedCountryBuilder,
  });

  final String? selectedCountryId;
  final String? selectedCountryName;
  final bool isSelectEnable;
  final void Function(Country item)? onChanged;
  final VoidCallback? onCancel;
  final Widget Function(Country)? selectedCountryBuilder;

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String? _selectedCountryId;
  Future<void>? _countries;
  List<Country>? _countryList;

  @override
  void initState() {
    super.initState();
    _countryList = [];
    _countries = _getCountriesFromAssets();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _countries,
      builder: (_, dataSnap) {
        if (dataSnap.hasError) {
          return Container();
        } else if (dataSnap.connectionState == ConnectionState.done &&
            _countryList!.isNotEmpty) {
          _selectedCountryId = widget.selectedCountryId ?? _selectedCountryId;
          return InkWell(
            onTap: widget.isSelectEnable ? _showDialog : null,
            child: widget.selectedCountryBuilder
                    ?.call(_getCountry(_selectedCountryId)) ??
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _getCountry(_selectedCountryId).countryName!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            '+${_getCountry(_selectedCountryId).dialCode}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  ),
                ),
          );
        } else {
          return StreamLoadingWidget();
        }
      },
    );
  }

  Future<void> _showDialog() async {
    final result = await showDialog<Country>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Select Country",
          ),
          content: _MyDialog(
            list: _countryList,
          ),
          actions: [
            OutlinedButton(
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ))),
              onPressed: () {
                if (widget.onCancel == null) {
                  Navigator.of(context).pop();
                } else {
                  widget.onCancel!.call();
                }
              },
              child: Text("CANCEL"),
            ),
          ],
        );
      },
    );
    if (result != null) {
      widget.onChanged!(result);
    }
  }

  Country _getCountry(String? selectedCountryId) {
    return _countryList!.firstWhere(
      (element) => element.countryId?.toLowerCase() == selectedCountryId,
    );
  }

  Future<void> _getCountriesFromAssets() async {
    try {
      final List<Country>? list = await rootBundle.loadStructuredData(
        'assets/data/countries.json',
        (value) async => (jsonDecode(value) as List)
            .map((item) => Country.fromJson(item))
            .toList(growable: false),
      );
      _countryList = list ?? [];
      if (widget.selectedCountryId != null) {
        _selectedCountryId = widget.selectedCountryId;
      } else if (widget.selectedCountryName != null) {
        _selectedCountryId = _countryList!
            .firstWhere((element) =>
                element.countryName?.toLowerCase() ==
                widget.selectedCountryName?.toLowerCase())
            .countryId;
      } else {
        _selectedCountryId = _countryList!
            .firstWhere((element) => element.dialCode == '91')
            .countryId;
      }
    } catch (e, s) {
      logger.e(e, s);
      rethrow;
    }
  }
}

class CountryTile extends StatelessWidget {
  const CountryTile(this.country, {this.showName = true});

  final Country country;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CachedNetworkImage(
        imageUrl: country.flagCode!,
        height: 16,
        width: 32,
        fit: BoxFit.cover,
      ),
      title: Text(
        country.countryName!,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Text('+${country.dialCode}'),
    );
  }
}

class _MyDialog extends StatefulWidget {
  final List<Country>? list;

  _MyDialog({this.list});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  late BehaviorSubject<List<Country>?> subject;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    subject = BehaviorSubject<List<Country>?>.seeded(widget.list);
    controller.addListener(() {
      if (!subject.isClosed) subject.sink.add(widget.list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SearchTextField(controller),
          Expanded(
            child: StreamBuilder<List<Country>>(
              stream: subject.transform(streamTransformer).asBroadcastStream(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return StreamLoadingWidget();
                }
                if (snapshot.data!.isEmpty) {
                  return NoItemsFound();
                }
                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: <Widget>[
                    ...snapshot.data!.map(
                      (item) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop<Country>(context, item);
                          },
                          child: CountryTile(
                            item,
                            showName: true,
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  StreamTransformer<List<Country>?, List<Country>> get streamTransformer =>
      StreamTransformer<List<Country>?, List<Country>>.fromHandlers(
        handleData: (list, sink) {
          if (controller.text != null && controller.text.isNotEmpty) {
            final list1 = list?.where((item) {
              return item.countryName!
                      .toLowerCase()
                      .contains(controller.text.toLowerCase()) ||
                  item.dialCode!
                      .toLowerCase()
                      .contains(controller.text.toLowerCase());
            }).toList();
            return sink.add(list1 ?? []);
          } else {
            return sink.add(list ?? []);
          }
        },
      );
}
