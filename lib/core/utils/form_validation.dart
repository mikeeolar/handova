class FormValidation {
  final String? value;
  final String? error;

  FormValidation({this.error, this.value});

  static bool validateEmail({required String value}) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}

class AcceptTerms {
  final bool? value;
  final String? error;

  AcceptTerms({this.error, this.value});
}
