import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/data/bookmark/domain/repository/bookmark_repository.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../core/data/recipe/domain/repository/recipe_repository.dart';
import 'home_action.dart';
import 'home_screen_state.dart';

class HomeScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  HomeScreenState _state = const HomeScreenState();

  HomeScreenState get state => _state;

  HomeScreenViewModel({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;

  void onAction(HomeAction action) {
    switch (action) {
      case AddBookmark():
        _addBookmark(action.recipe);
      case DeleteBookmark():
        _deleteBookmark(action.id);
      case SelectCategory():
        _selectCategory(action.category);
    }
  }

  Future<void> fetchRecipes() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final recipes = await _recipeRepository.getRecipes();

    _state = state.copyWith(
      recipes: recipes,
      filteredRecipes: recipes,
      isLoading: false,
    );
    notifyListeners();
  }

  void _selectCategory(String category) {
    final List<Recipe> filteredRecipes;

    if (category == 'All') {
      filteredRecipes = state.recipes;
    } else {
      filteredRecipes = state.recipes
          .where((recipe) => recipe.category == category)
          .toList();
    }

    _state = state.copyWith(
      selectedCategory: category,
      filteredRecipes: filteredRecipes,
    );
    notifyListeners();
  }

  void _addBookmark(Recipe recipe) {
    _bookmarkRepository.addRecipe(recipe);
    _updateBookmarkState(recipe.id, true);
  }

  void _deleteBookmark(int id) {
    _bookmarkRepository.deleteRecipe(id);
    _updateBookmarkState(id, false);
  }

  void _updateBookmarkState(int recipeId, bool isBookmarked) {
    final currentBookmarkedIds = List<int>.from(state.bookmarkedRecipeIds);

    if (isBookmarked) {
      if (!currentBookmarkedIds.contains(recipeId)) {
        currentBookmarkedIds.add(recipeId);
      }
    } else {
      currentBookmarkedIds.remove(recipeId);
    }

    _state = state.copyWith(
      bookmarkedRecipeIds: currentBookmarkedIds,
    );
    notifyListeners();
  }
}
