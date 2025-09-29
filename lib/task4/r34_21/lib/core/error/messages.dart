import 'faliures.dart';

mixin MapFailureMessages {
  String mapFailureToMessage(Failure failure) {
    return switch (failure) {
      ServerFailure() => 'Server Failure',
      CacheFailure() => 'Cache Failure',
      UnexpectedFailure() => 'Unexpected Error',
      BadRequestException() => 'BadRequestException Error', 

      UnAuthorizedException() => 'UnAuthorizedException Error', 

      NotFoundException() => 'NotFoundException Error', 
      
    };
  }
}