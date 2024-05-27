// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(String errMessage) : super(errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        log("Connection timeout error occurred.");
      
        break;
      case DioErrorType.sendTimeout:
        log("Send timeout error occurred.");
       
        break;
      case DioErrorType.receiveTimeout:
        log("Receive timeout error occurred.");
     
        break;
      case DioErrorType.badCertificate:
        log("Bad certificate error occurred.");
       
        break;
      case DioErrorType.badResponse:
        log("Bad response error occurred.");
     
        break;
      case DioErrorType.cancel:
        log("Request cancellation error occurred.");
     
        break;
      case DioErrorType.connectionError:
        log("Connection error occurred.");
    
        break;
      case DioErrorType.unknown:
        log("Unknown error occurred.");
  
        break;
      default:
        log("Unhandled error type occurred.");

        break;
    }
    
    throw Exception('Unknown error occurred');
  }
}