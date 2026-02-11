import 'package:accessories_store/features/auth/verify_otp/data/repo/resend_otp_repo/resend_otp_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit({required this.resendOtpRepo}) : super(ResendOtpInitialState());

  final ResendOtpRepo resendOtpRepo ;

  Future<void> resendOtp({required String email})async{
    emit(ResendOtpLoadingState());
    var result =await resendOtpRepo.resendOtp(email: email);
    return result.fold((failure) => emit(ResendOtpFailureState(message: failure.message)), (message) => emit(ResendOtpSuccessState(message: message)));
  }
  
}
