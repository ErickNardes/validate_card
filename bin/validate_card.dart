import 'package:validate_card/validate_card.dart' as validate_card;

void main(List<String> arguments) {
  bool validateCreditCardNumber(String cardNumber) {
    List<int> cardDigits = cardNumber.replaceAll(' ', '').split('').map(int.parse).toList();

    int lastDigit = cardDigits.removeLast();

    int lastNumber = 0;
    for (int i = 0; i < cardDigits.length; i++) {
      int digit = cardDigits[i];
      if (i % 2 == 0) {
        digit *= 2;
        if (digit > 9) {
          digit = digit ~/ 10 + digit % 10;
        }
      }
      lastNumber += digit;
    }

    return lastDigit == ((10 - (lastNumber % 10)) % 10);
  }

  print(validateCreditCardNumber('4916 6418 5936 9080'));
  print(validateCreditCardNumber('5419 8250 0346 1210'));
}
