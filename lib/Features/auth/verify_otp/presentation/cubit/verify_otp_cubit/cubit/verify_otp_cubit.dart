import 'package:accessories_store/features/auth/verify_otp/data/repo/verify_otp_repo/verify_otp_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({required this.verifyOtpRepo}) : super(VerifyOtpInitialState());

  final VerifyOtpRepo verifyOtpRepo;


   Future<void> verifyOtp({required String otp,required String email})async{
    emit(VerifyOtpLoadingState());

     var result =await verifyOtpRepo.verifyOtp(otp: otp, email: email);

     return result.fold((failure) => emit(VerifyOtpFailureState(message: failure.message)), (message) => emit(VerifyOtpSuccessState(message: message)));

   }


}
