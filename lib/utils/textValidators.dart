class TextValidators {
  TextValidators();

  String validateEmailID(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? 'Enter Valid Email' : null;
  }

  String validateFirstName(String value) {
    return value.length < 3 ? 'Name must be more than 2 charater' : null;
  }

  String validateLastName(String value) {
    return value.length < 1 ? 'Name must be more than 2 charater' : null;
  }

  String validatePhoneNumber(String value) {
    return value.length != 10 ? 'Mobile Number must be of 10 digit' : null;
  }

  String validateCountry(String value) {
    return value.length <= 1 ? 'More than one word' : null;
  }

  String validatePitchIdea(String value) {
    return value.length < 1 ? 'Min 500 char':null;
  }
}
