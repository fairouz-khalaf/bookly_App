import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
   // the first step is take object from repo class(not repoImpl)
  final HomeRepo homeRepo;
  // seconde step build method to fetch my data from Api
  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(errorMessage: failure.errMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books: books));
    });
  }

}
