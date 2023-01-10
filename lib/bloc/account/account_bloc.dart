import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnpass/api/change_password.dart';
import 'package:vnpass/api/request_reset_password.dart';
import 'package:vnpass/api/reset_password.dart';
import 'package:vnpass/bloc/account/account_event.dart';
import 'package:vnpass/bloc/account/account_state.dart';
import 'package:vnpass/theme/colors.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  ImagePicker imagePicker = ImagePicker();
  String fileImage = "";
  bool sentOTP = false;
  bool checkOldPass = false;
  String otpResetPassword = "000000";
  String phoneResetPassword = "";
  AccountBloc() : super(AccountInitialState()){
    on<ShowDialogUpdateAvatarEvent>((event, emit) {
      showDialogUpdateAvatar(event.context);
    });
    on<SendOTPEvent>((event, emit) {
      sentOTP = !sentOTP;
      emit(SendOTPSuccessState());
    });
    on<ConfirmOTPEvent>((event, emit) {
      sentOTP = !sentOTP;
      emit(ConfirmOTPSuccessState());
    });
    on<ChangePasswordEvent>((event, emit) {
      onPressChangePass(event.oldPassword, event.newPassword, event.confirmNewPassword);
    });
    on<SendOTPToResetPassEvent>((event, emit) {
      onPressRequestResetPass(event.phone);
    });
    on<ResetPasswordEvent>((event, emit) {
      onPressResetPassword(event.phone, event.password, event.confirmPassword, event.otp);
    });
  }

  void onPressResetPassword(String phone, String password, String confirmPassword, String otp) async {
    bool checkPass() {
      if (password.length < 6) {
        Fluttertoast.showToast(msg: "Mật khẩu phải có ít nhất 6 kí tự", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
        return false;
      } else if (password.compareTo(confirmPassword) != 0) {
        Fluttertoast.showToast(msg: "Mật khẩu nhập lại không trùng khớp", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
        return false;
      }
      return true;
    }
    if (checkPass()) {
      emit(ResettingPasswordState());
      var data = await resetPassword(phone, password, otp);
      if (data.success && data.code.contains("SUCCESS")) {
        emit(ResetPasswordSuccessState());
      } else {
        emit(ResetPasswordFailState(data.message ?? ""));
      }
    }
  }

  void onPressRequestResetPass(String phone) async {
    emit(SendingOTPTOResetPassState());
    var data = await requestResetPassword(phone);
    if (data.success && data.code.contains("SUCCESS")){
      emit(SendOTPTOResetPassSuccessState());
    } else {
      emit(SendOTPTOResetPassFailState(data.message ?? ""));
    }
  }

  void onPressChangePass(String oldPassword, String newPassword, String confirmNewPass) async {
    emit(ChangingPassState());
    if (newPassword.compareTo(confirmNewPass) == 0) {
      var data = await changePassword(oldPassword, newPassword);
      if (data.success && data.code.contains("SUCCESS")) {
        emit(ChangePassSuccessState());
      } else {
        emit(ChangePassFailState(data.message ?? ""));
      }
    } else {
      emit(ChangePassFailState("Mật khẩu nhập lại không trùng khớp"));
    }
  }

  void showDialogUpdateAvatar(BuildContext context) {
    showDialog(
      useRootNavigator: false,
      barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width/2,
            // padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.greenApp2,
              // border: Border.all(color: AppTheme.grey2)
              // boxShadow: [
              //   BoxShadow(
              //     blurRadius: 3,
              //     offset: Offset(0, 3)
              //   )
              // ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    final cameraImage = imagePicker.pickImage(source: ImageSource.camera);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: AppTheme.greenApp2,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined, color: AppTheme.white,),
                        const SizedBox(width: 10,),
                        DefaultTextStyle(
                          child: const Text("Chụp ảnh"),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppTheme.white),),
                      ],
                    ),
                  ),
                ),
                const Divider(thickness: 1, height: 0,),
                GestureDetector(
                  onTap: () async {
                    XFile? cameraImage = await imagePicker.pickImage(source: ImageSource.gallery);
                    fileImage = cameraImage?.path ?? "";
                    emit(ChooseImageSuccessState());
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: AppTheme.greenApp2,
                        borderRadius: const BorderRadius.only(bottomLeft: const Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined, color: AppTheme.white,),
                        const SizedBox(width: 10,),
                        DefaultTextStyle(
                          child: const Text("Thư viện ảnh"),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppTheme.white),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

}