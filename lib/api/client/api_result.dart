import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/core/constanse/app_text.dart';
import 'package:movies_app/core/exceptions/dio_exceptions.dart';
import 'package:movies_app/core/exceptions/response_exceptions.dart';
sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends Result<T> {
  Failure({required this.responseException});

  final ResponseException responseException;
}

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    final bool connection = await ConnectionManager.checkConnection();
    if (connection) {
      final data = await apiCall();
      return Success(data);
    } else {
      return Failure(
        responseException: ResponseException(
          message: AppText.connectionError.tr(),
        ),
      );
    }
  } on DioException catch (error) {
    return Failure(
      responseException: DioExceptions.handleError(error).responseException,
    );
  } catch (error) {
    return Failure(
      responseException: ResponseException(
        message: "${AppText.unknownErrorMessage.tr()} ${error.toString()}",
      ),
    );
  }
}