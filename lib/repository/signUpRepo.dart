import 'package:ansicolor/ansicolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../Models/userModel.dart';

class SignUpRepo with ChangeNotifier {
  FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  Firestore _firestoreInstance = Firestore.instance;
  AnsiPen pen = new AnsiPen()
    ..white(bold: true)
    ..rgb(r: 2.0, g: 2, b: 0.2);

  String verificationId;
  UserModel _user;
  bool userLoggedIn = false;
  int selectedIndexTab = 0;

  bool showLoader = false;
  bool switchSignInORSignUp = false;
  bool logInException = false;
  bool otpArrived = false;
  String otpTextFromPage;  
  bool otpError = false;
  String otpErrorMessage;

  UserModel get getUser => _user;

  set setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  bool get getUserLoggedIn => userLoggedIn;

  setUserLoggedIn(bool val) {
    userLoggedIn = val;
    notifyListeners();
  }

  int get getSelectedIndex => selectedIndexTab;

  setSelectedIndex(int val) {
    selectedIndexTab = val;
    notifyListeners();
  }

  setOTPTextFromPage(String val) {
    otpTextFromPage = val;
    notifyListeners();
  }

  bool get getSwitchSignInORSignUp => switchSignInORSignUp;

  Future<void> verifyPhone(UserModel user) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String vID) {
      this.verificationId = vID;

      print(pen("verificationId => $verificationId"));
      print(pen("vID => $vID"));
    };

    final PhoneCodeSent smsCodeSent = (String vID, [int forceResendingToken]) {
      this.verificationId = vID;
      this.otpArrived = true;
      notifyListeners();
      // signInwithPhoneNumberAndGetUser(otpTextFromPage);
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {
      print("auth");
      if (credential != null) {
        print("auth");
      } else {
        signInwithPhoneNumberAndGetUser(otpTextFromPage);
      }
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException exception) async {
      print(pen("exception => ${exception.message}"));
      this.logInException = true;
      this.otpArrived = false;
      notifyListeners();
    };

    await FirebaseAuth.instance
        .verifyPhoneNumber(
      phoneNumber: user.phone,
      timeout: Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verificationFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrive,
    )
        .catchError((e) {
      print(e);
    });
  }

  registerUserWithUniqueIdToAuthAndDatabase(user) async {
    var firebaseUser = await signInwithPhoneNumberAndGetUser(otpTextFromPage);
    var thisData = _firestoreInstance
        .collection("jefrs-users")
        .document(firebaseUser.uid)
        .setData({
      "email": user.email,
      "phone": user.phone,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "countryCode": user.countryCode
    });
    await setUserLoggedIn(true);
    print(pen("THISDATA ===========> $thisData"));
    print(pen("USERADDED =============="));
  }

  signInWithOTPAndGetUser(user) async {
    var firebaseUser = await signInwithPhoneNumberAndGetUser(otpTextFromPage);
    var userData = await _firestoreInstance
        .collection("jefrs-users")
        .document(firebaseUser.uid)
        .get();
    await setUserLoggedIn(true);
    print(pen("USERDATA =========>  $userData"));
  }

  signInwithPhoneNumberAndGetUser(otpTextFromPage) async {
    try {
      print("here");
      AuthCredential credential = PhoneAuthProvider.getCredential(
        smsCode: otpTextFromPage,
        verificationId: verificationId,
      );
      FirebaseUser firebaseUser =
          (await _firebaseAuthInstance.signInWithCredential(credential)).user;
      print(firebaseUser);
      return firebaseUser;
    } catch (e) {
      print(e);
      this.otpErrorMessage = e.message;
      this.otpError = false;
      notifyListeners();
    }
  }

  Future<bool> checkUserInDB(user) async {
    bool userFound = await _firestoreInstance
        .collection("jefrs-users")
        .where('phone', isEqualTo: user.phone)
        .getDocuments()
        .then((value) {
      return value.documents.isEmpty ? true : false;
    });
    return userFound;
  }

  Future getUserfromDB(phone) async {
     await _firestoreInstance
        .collection("jefrs-users")
        .where('phone', isEqualTo: phone)
        .getDocuments()
        .then((value) {
      return value.documents;
    });
   
  }
}
