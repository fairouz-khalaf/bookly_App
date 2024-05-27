import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  /*  I will define what i do on the homeView
  then when AnyBody need to work on home view in this App  i will force him to fetch BestSellerBooks and FeaturedBooks*/

  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();

  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}
