
import 'package:dartz/dartz.dart';
import 'package:demo_api_call_bloc_clean_architecture/app_errors.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/domain/entities/perams/no_params_file.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(NoParams params);
}
