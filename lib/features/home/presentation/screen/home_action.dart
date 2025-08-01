import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.addBookmark(Recipe recipe) = AddBookmark;

  const factory HomeAction.deleteBookmark(int id) = DeleteBookmark;

  const factory HomeAction.selectCategory(String category) = SelectCategory;
}
