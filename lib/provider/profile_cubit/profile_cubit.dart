// import 'dart:math';
// import 'package:ad_automation/data/model/profile_model.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import '../../data/model/deleteProfileModel.dart';
// import '../../repositories/profile_repositories/delete_account.dart';
// import '../../repositories/profile_repositories/get_profile_repository.dart';
// import '../../repositories/profile_repositories/update_all_fields.dart';
// import '../../repositories/profile_repositories/update_email.dart';
// import '../../repositories/profile_repositories/update_name.dart';
// import '../../repositories/profile_repositories/update_password.dart';
// import '../../repositories/profile_repositories/update_phone.dart';
//
// part 'profile_state.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   GetProfileRepository getProfileRepository;
//   DeleteAccountRepositories deleteAccountRepositories;
//   UpdateName updateName;
//   UpdateEmail updateEmail;
//   UpdatePhone updatePhone;
//   UpdatePassword updatePassword;
//   UpdateAllFields updateAllFields;
//   ProfileCubit(
//       {
//         required this.getProfileRepository,
//         required this.deleteAccountRepositories,
//       required this.updateName,
//       required this.updateEmail,
//       required this.updatePhone,
//       required this.updatePassword,
//         required this.updateAllFields
//       })
//       : super(ProfileInitial());
//
//   dynamic  country_id;
//   dynamic  nationality;
//   dynamic  birthDate;
//   dynamic  DateExp;
//   dynamic  LicenceExp;
//   ProfileListData ? profileListProfileData;
//   getProfileData() async {
//     emit(ProfileLoading());
//     try {
//       profileListProfileData =
//           await getProfileRepository.getProfileData();
//       emit(ProfileLoaded(profileListData: profileListProfileData!));
//       country_id = profileListProfileData!.data.nationality_id;
//       nationality = profileListProfileData!.data.nationality;
//       birthDate = profileListProfileData!.data.birth_date;
//       DateExp = profileListProfileData!.data.id_exp_date;
//       LicenceExp = profileListProfileData!.data.license_exp_date;
//     } catch (e) {
//       emit(ProfileError(error: e.toString()));
//     }
//   }
//   ///DELETE PROFILE
//
//   dynamic code;
//
//   Future<void> deleteProfile() async {
//     emit(DeleteProfileLoading());
//     try {
//       final DeleteProfileModel? deleteProfileModel =
//       await deleteAccountRepositories.deleteProfile();
//       code = deleteProfileModel!.data!.code.toString();
//       emit(DeleteProfileSuccess(deleteProfileModel));
//     } catch (error) {
//       emit(DeleteProfileFailed(error.toString()));
//     }
//   }
//   updateProfileName(String name) async {
//     emit(UpdateProfileLoading());
//     try {
//       await updateName.updateName(name: name);
//       emit(UpdateProfileLoaded());
//     } catch (e) {
//       print(e.toString());
//       emit(UpdateProfileError(error: e.toString()));
//     }
//   }
//
//   updateProfileEmail(String email) async {
//     emit(UpdateProfileLoading());
//     try {
//       await updateEmail.updateEmail(email: email);
//       emit(UpdateProfileLoaded());
//     } catch (e) {
//       emit(UpdateProfileError(error: e.toString()));
//     }
//   }
//
//   updateProfilePhone(String phone) async {
//     emit(UpdateProfileLoading());
//
//     try {
//       await updatePhone.updatePhone(phone: phone);
//       emit(UpdateProfileLoaded());
//     } catch (e) {
//       emit(UpdateProfileError(error: e.toString()));
//     }
//   }
//
//   updateProfilePassword(String password) async {
//     emit(UpdateProfileLoading());
//     try {
//       await updatePassword.updatePassword(password: password);
//       emit(UpdatePasswordProfileLoaded());
//     } catch (e) {
//       emit(UpdateProfileError(error: e.toString()));
//     }
//   }
//   /*
//   ----------------------------------
//   ----------update All Fields-------
//   ----------------------------------
//    */
// updateAllFieldsAccInfo({
//   required dynamic name,
//   required dynamic email,
//   required dynamic phone,
//   required dynamic birth_date_type,
//   required dynamic license_exp_date_type,
//   required dynamic id_exp_date_type,
//   //required dynamic password,
//   required dynamic birthDate,
//   required dynamic address,
//    required int country ,
//   required dynamic license_exp_date,
//   required dynamic version_number,
//   required dynamic license_id,
//   required dynamic id_exp_date
// })async{
//   try {
//     await updateAllFields.updateAllFields(
//         name: name,
//         email: email,
//         phone: phone,
//         birthDate: birthDate,
//         address: address,
//         country: country,
//         license_exp_date: license_exp_date,
//         version_number: version_number,
//         license_id: license_id,
//         id_exp_date: id_exp_date,
//       birth_date_type: birth_date_type,
//       id_exp_date_type: id_exp_date_type,
//       license_exp_date_type: license_exp_date_type,
//     );
//     // print(name.toString()+'%%');
//     // print(email.toString()+'%%');
//     // print(phone.toString()+'%%');
//     // print(id_exp_date.toString()+'%%');
//     // print(address.toString()+'%%');
//     // print(country.toString()+'%%');
//     // print(license_exp_date.toString()+'%%');
//     // print(birthDate.toString()+'%%');
//     // print(version_number.toString()+'%%');
//     // print(license_id.toString()+'%%');
//     // print(birth_date_type.toString()+'@1');
//     // print(id_exp_date_type.toString()+'@2');
//     // print(license_exp_date_type.toString()+'@3');
//     emit(UpdateAllProfileLoaded());
//
//   } catch (e) {
//     print(e.toString());
//     emit(UpdateProfileError(error: e.toString()));
//     print(e.toString());
//
//   }
// }
//   updateState() async {
//     final ProfileListData profileListData =
//     await getProfileRepository.getProfileData();
//     emit(ProfileLoaded(profileListData: profileListData));
//   }
//   updateSwitchState()async{
//     emit(UpdateStateOne());
//     await nationality.toString();
//     emit(UpdateState());
//   }
// }
