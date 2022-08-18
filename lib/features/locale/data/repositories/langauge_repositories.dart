
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../login/data/data_sources/langauge_data_source.dart';
import '../../domain/repositories/base_language_repositories.dart';

class LanguageRepository implements BaseLanguageRepository {
  final BaseLanguageLocaleDataSource languageLocaleDataSource;

  const LanguageRepository({required this.languageLocaleDataSource});

  @override
  Future<Either<Failure, bool>> changeLanguage(
      {required String languageCode}) async {
    try {
      final languageIsChanged = await languageLocaleDataSource.changeLanguage(
          languageCode: languageCode);
      return Right(languageIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLanguage() async {
    try {
      final languageCode = await languageLocaleDataSource.getSavedLanguage();
      return Right(languageCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}