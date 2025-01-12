import 'package:equatable/equatable.dart';

class UserService extends Equatable {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String? image;
  final String? area;
  final String? address;
  final String? countryCode;
  final String? cityID;
  final double? lat;
  final double? long;
  final bool? status;
  final String? nid; //national identity  

  /// if false then user is offline
  final bool? isApproved;



  const UserService({
    required this.userId,
    required this.firstName,
    this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.image,
    this.area,
    required this.cityID,
    this.address,
    this.countryCode,
    this.status,
    this.isApproved,
    this.lat,
    this.long,
    required this.nid
  });

  @override
  List<Object?> get props => [userId];
}

