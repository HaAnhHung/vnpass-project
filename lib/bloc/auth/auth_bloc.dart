import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vnpass/api/activate.dart';
import 'package:vnpass/api/login.dart';
import 'package:vnpass/api/resend_otp.dart';
import 'package:vnpass/api/sign_up.dart';
import 'package:vnpass/bloc/auth/auth_event.dart';
import 'package:vnpass/bloc/auth/auth_state.dart';
import 'package:vnpass/model/customer.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String phone = "";
  String password = "";
  String confirmPassword = "";
  String name = "";
  String email = "";
  Customer? customer;
  String? token;
  bool needToActivate = false;
  int countConfirmOTP = 0;
  AuthBloc() : super(AuthInitialState()){
    on<SignupEvent>((event, emit) {
      onPressSignup();
    });
    on<SignupSuccessEvent>((event, emit) {
      phone = "";
      password = "";
      emit(SignupSuccessState());
    });
    on<SignupFailEvent>((event, emit) => emit(SignupFailState(event.message)));
    on<SigningUpEvent>((event, emit) => emit(SigningUpState()));
    on<LoginEvent>((event, emit) {
      onPressLogin();
    });
    on<LoginSuccessEvent>((event, emit) {
      if (!needToActivate) {
        emit(LoginSuccessState());
      } else {
        emit(ActivateState());
      }
    });
    on<ActivateEvent>((event, emit) {
      onPressActivate(event.otp);
    });
    on<ResendOTPEvent>((event, emit) {
      onPressResendOTP();
    });
  }

  void onPressResendOTP() async {
    emit(ResendingOTPState());
    var data = await resendOTP(phone);
    if (data.success && data.code.contains("SUCCESS")){
      emit(ResendOTPSuccessState());
    } else {
      emit(ResendOTPFailState(data.message ?? ""));
    }
  }

  void onPressActivate(String otp) async {
    emit(ActivatingState());
    var data = await activate(phone, otp);
    print("47 ---- ${data.success} ++ $phone ++ $otp");
    if (data.success && data.code.contains("SUCCESS")){
      countConfirmOTP = 0;
      emit(ActivateSuccessState());
    } else {
      countConfirmOTP++;
      emit(ActivateFailState(data.message ?? ""));
    }
  }

  void onPressLogin() async {
    emit(LoggingInState());
    var data = await login(phone, password);
    if (data.success && data.code.contains("SUCCESS")) {
      print("58 --- ${data.data}");
      token = data.data['token'];
      customer = Customer.fromJson(data.data['customer']);
      needToActivate = data.data['needToActivate'];
      add(LoginSuccessEvent());
    } else {
      emit(LoginFailState(data.message ?? ""));
    }
  }

  void onPressSignup() async {
    if (checkPhone()) {
      if (checkPassword()) {
        add(SigningUpEvent());
        var data = await signup(phone, password, name, email);
        if (data.success && data.code.contains("SUCCESS")) {
          customer = Customer.fromJson(data.data['customer']);
          add(SignupSuccessEvent());
        } else {
          add(SignupFailEvent(data.message ?? ""));
        }
      }
    }
  }

  bool checkPhone() {
    if (phone.isNotEmpty) {
      if (phone.length == 10 && phone[0] == '0') {
        return true;
      } else if (phone.length == 9 && phone[0] != "0") {
        phone = '0' + phone;
        return true;
      } else if (phone.contains("+84") && phone.length == 12) {
        return true;
      } else {
        Fluttertoast.showToast(msg: "Số điện thoại không hợp lệ", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
        return false;
      }
    } else {
      Fluttertoast.showToast(msg: "Số điện thoại không được để trống", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
      return false;
    }
  }

  bool checkPassword() {
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Mật khẩu không được để trống", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
      return false;
    } else if (password.length < 6) {
      Fluttertoast.showToast(msg: "Mật khẩu phải có ít nhất 6 ký tự", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
      return false;
    } else if (password.isNotEmpty && password.compareTo(confirmPassword) != 0) {
      Fluttertoast.showToast(msg: "Mật khẩu nhập lại không trùng khớp", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
      return false;
    }
    return true;
  }
}