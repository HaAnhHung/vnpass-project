import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnpass/bloc/account/account_event.dart';
import 'package:vnpass/bloc/account/account_state.dart';
import 'package:vnpass/theme/colors.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  ImagePicker imagePicker = ImagePicker();
  String fileImage = "";
  bool sentOTP = false;
  bool checkOldPass = false;
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
    on<CheckOldPassEvent>((event, emit) {
      checkOldPass = !checkOldPass;
      emit(CheckOldPassSuccessState());
    });
    on<ConfirmNewPassEvent>((event, emit) {
      checkOldPass = !checkOldPass;
      if (event.newPass.compareTo(event.confirmPass) == 0) {
        emit(ConfirmNewPassSuccessState());
      } else {
        emit(ConfirmNewPassFailState());
      }
    });
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