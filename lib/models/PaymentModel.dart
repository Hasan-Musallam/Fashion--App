import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
class AddCard extends StatefulWidget {
  const AddCard({super.key,this.onCardSaved});
  final void Function(String cardHolderName, String cardNumber)? onCardSaved;
  @override
  State<AddCard> createState() => _AddCardState();

}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final halfScreenHeight = MediaQuery.of(context).size.height * 0.5;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: halfScreenHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// visa card
                CreditCardWidget(
                  padding: 6,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Color(0xffc0c0c0),
                  obscureCardCvv: false,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                ),
                Gap(20),

                /// form
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                  obscureCvv: false,
                  inputConfiguration: InputConfiguration(

                    cardNumberTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.white),
                    cardNumberDecoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // 👈 Underline when not focused
                      ),
                      hintText: "Card Number",

                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    cardHolderTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.white),
                    cardHolderDecoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // 👈 Underline when not focused
                      ),
                      hintText: "Card Holder Name",
                      hintStyle: TextStyle(fontFamily: "TenorSans",),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    cvvCodeTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.white),
                    cvvCodeDecoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // 👈 Underline when not focused
                      ),
                      hintText: "CVV",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    expiryDateTextStyle: TextStyle(fontFamily: "TenorSans",color: Colors.white),
                    expiryDateDecoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // 👈 Underline when not focused
                      ),

                      hintText: "Expiry Date",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }
}
