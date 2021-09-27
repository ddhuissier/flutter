import 'package:clean_archi/domain/entities/question.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuestions(
      {required int numQuestions, required int categoryId});
}
