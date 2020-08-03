import 'package:digital_receipt/models/account.dart';
import 'package:digital_receipt/providers/business.dart';
import 'package:digital_receipt/widgets/app_hollow_button.dart';
import 'package:digital_receipt/widgets/app_solid_button.dart';
import 'package:digital_receipt/widgets/app_text_form_field.dart';
import 'package:digital_receipt/widgets/create_receipt_step2.dart';
import 'package:flutter/material.dart';
import 'package:digital_receipt/constant.dart';

class AccountInfoScreen extends StatefulWidget {
  AccountData businessInfo;
  AccountInfoScreen({@required this.businessInfo});

  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final TextEditingController _hexCodeController = TextEditingController()
    ..text = "F14C4C";
  final TextEditingController _businessDetailsController =
      TextEditingController();
  final FocusNode _hexCodeFocus = FocusNode();
  String businessDetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Business card',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Samples',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontSize: 18,
                    ),
              ),
              SizedBox(
                height: 24,
              ),
              bussinessRow(),
              SizedBox(
                height: 42,
              ),
              AppTextFormField(
                label: 'Business details (not more than 40 words)',
                controller: _businessDetailsController,
                hintColor: Theme.of(context).textTheme.subtitle2.color,
                borderWidth: 1.5,
                onChanged: (value) {
                  setState(() {
                    businessDetail = value;
                  });
                },
              ),
              SizedBox(height: 30),
              Text(
                'Choose Card colour',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ColorButton(
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          _hexCodeController.text = 'F14C4C';
                        });
                      },
                    ),
                    ColorButton(
                      color: Color(0xFF539C30),
                      onPressed: () {
                        setState(() {
                          _hexCodeController.text = '539C30';
                        });
                      },
                    ),
                    ColorButton(
                      color: Color(0xFF2C33D5),
                      onPressed: () {
                        setState(() {
                          _hexCodeController.text = '2C33D5';
                        });
                      },
                    ),
                    ColorButton(
                      color: Color(0xFFE7D324),
                      onPressed: () {
                        setState(() {
                          _hexCodeController.text = 'E7D324';
                        });
                      },
                    ),
                    ColorButton(
                      color: Color(0xFFC022B1),
                      onPressed: () {
                        setState(() {
                          _hexCodeController.text = 'C022B1';
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27),
              AppTextFormField(
                focusNode: _hexCodeFocus,
                label: 'Or enter brand Hex code',
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) => _hexCodeFocus.unfocus(),
                controller: _hexCodeController,
                hintText: 'Enter Brand color hex code',
                hintColor: Theme.of(context).textTheme.subtitle2.color,
                borderWidth: 1.5,
              ),
              SizedBox(height: 40),
              AppHollowButton(
                height: 50,
                //isLoading: isLoading,
                text: 'Download',
                onPressed: () async {
                  // check the internet
                },
              ),
              SizedBox(height: 22),
              AppSolidButton(
                height: 50,
                //isLoading: isLoading,
                text: 'Share',
                onPressed: () async {
                  // check the internet
                },
              ),
              SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }

  Widget bussinessRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Card(child: businessCard0()),
          Card(child: businessCard1()),
          Card(
            child: SizedBox(
              height: 180,
              width: 293,
            ),
          ),
          Card(
            child: SizedBox(
              height: 180,
              width: 293,
            ),
          ),
        ],
      ),
    );
  }

  //business cards
  Widget businessCard0() {
    return Container(
      height: 180,
      width: 293,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 30,
            child: Image.asset('assets/images/Rectangle 86.png'),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            child: Image.asset('assets/images/Rectangle 87.png'),
          ),
          Container(
            height: 180,
            width: 293,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                      height: 20,
                      child: Image.asset('assets/logos/logo.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          widget.businessInfo?.name ?? '...',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 12,
                              ),
                        ),
                        Text(
                          'C.E.O',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 12,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  'Degeit Technologies',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 14, color: Color(0xFF0B57A7)),
                ),
                SizedBox(height: 5.0),
                Text(
                  businessDetail == null ? 'type in business details to change me': businessDetail,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 9,
                      ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Image.asset('assets/icons/locationIcon.png'),
                    SizedBox(width: 7.0),
                    Text(
                      widget.businessInfo?.address ?? '...',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 11,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Image.asset('assets/icons/phoneIcon.png'),
                    SizedBox(width: 7.0),
                    Text(
                      widget.businessInfo?.phone ?? '...',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 11,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Image.asset('assets/icons/messageIcon.png'),
                    SizedBox(width: 7.0),
                    Text(
                      widget.businessInfo?.email ?? '...',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 11,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/Vector.png'))),
    );
  }

  Widget businessCard1() {
    return Container(
      height: 180,
      width: 293,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            width: double.infinity,
            height: 5.0,
            color: Color(0xFF0B57A7),
          )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: 5.0,
              color: Color(0xFF0B57A7),
            ),
          ),
          Container(
            height: 180,
            width: 293,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                        height: 20,
                        child: Image.asset('assets/logos/logo.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            widget.businessInfo?.name ?? '...',
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                          Text(
                            'C.E.O',
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 200.0,
                  height: 27.0,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Text(
                      'Degeit Technologies',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Color(0xFF494949)),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'type in business details to change me',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 9,
                        ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 270.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Color(0xFFF9F9F9)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset('assets/icons/locationIcon.png'),
                            SizedBox(width: 7.0),
                            Text(
                              widget.businessInfo?.address ?? '...',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 11,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Image.asset('assets/icons/phoneIcon.png'),
                            SizedBox(width: 7.0),
                            Text(
                              widget.businessInfo?.phone ?? '...',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 11,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Image.asset('assets/icons/messageIcon.png'),
                            SizedBox(width: 7.0),
                            Text(
                              widget.businessInfo?.email ?? '...',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 11,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
