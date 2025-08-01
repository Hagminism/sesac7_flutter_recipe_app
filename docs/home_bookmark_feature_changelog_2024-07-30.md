# 홈 화면 북마크 기능 변경사항 정리

**일시:** 2024-07-30

---

## 1. 북마크 상태 관리 방식 개선
- **설명:**
  - 기존 로컬 상태 기반 북마크 관리에서 중앙 집중식 관리로 변경
  - 레시피 ID 기반으로 북마크 상태를 관리하여 카테고리 변경 시에도 올바른 상태 유지
  - 북마크 상태가 리스트 인덱스가 아닌 실제 레시피 ID에 따라 표시되도록 수정
- **수정 파일:**
  - `lib/features/home/presentation/screen/home_screen_state.dart`
  - `lib/features/home/presentation/screen/home_screen_view_model.dart`
  - `lib/features/home/presentation/screen/home_screen.dart`
  - `lib/features/home/presentation/component/dish_card.dart`
- **주요 수정 변수/로직:**
  - `HomeScreenState`에 `bookmarkedRecipeIds` 필드 추가
  - `HomeScreenViewModel`에 `_updateBookmarkState` 메서드 추가:
    ```dart
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
    ```

---

## 2. DishCard 컴포넌트 구조 개선
- **설명:**
  - StatefulWidget에서 StatelessWidget으로 변경하여 더 효율적인 구조로 개선
  - 북마크 상태를 props로 받아 로컬 상태 관리 제거
  - 컴포넌트의 책임을 명확히 분리
- **수정 파일:**
  - `lib/features/home/presentation/component/dish_card.dart`
- **주요 수정 변수/로직:**
  - `DishCard` 클래스를 `StatelessWidget`으로 변경
  - `isBookmarked` 파라미터 추가
  - `_DishCardState` 클래스 제거
  - 모든 `widget.` 참조를 직접 변수명으로 변경:
    - `widget.recipe.name` → `recipe.name`
    - `widget.recipe.cookingTime` → `recipe.cookingTime`
    - `widget.recipe.image` → `recipe.image`
    - `widget.recipe.rating` → `recipe.rating`
    - `widget.isBookmarked` → `isBookmarked`
    - `widget.onBookmarkButtonClicked` → `onBookmarkButtonClicked`

---

## 3. 북마크 상태 전달 로직 구현
- **설명:**
  - HomeScreen에서 DishCard에 현재 북마크 상태를 전달하는 로직 구현
  - 레시피 ID 기반으로 북마크 상태를 확인하여 정확한 상태 표시
- **수정 파일:**
  - `lib/features/home/presentation/screen/home_screen.dart`
- **주요 수정 변수/로직:**
  - `DishCard` 호출 시 `isBookmarked` 파라미터 추가:
    ```dart
    isBookmarked: state.bookmarkedRecipeIds.contains(
      state.filteredRecipes[index].id,
    ),
    ```

---

## 4. 북마크 액션 처리 개선
- **설명:**
  - 북마크 추가/삭제 시 중앙 상태 관리 시스템과 연동
  - 북마크 상태 변경 시 즉시 UI에 반영되도록 개선
- **수정 파일:**
  - `lib/features/home/presentation/screen/home_screen_view_model.dart`
- **주요 수정 변수/로직:**
  - `_addBookmark` 메서드에 `_updateBookmarkState(recipe.id, true)` 추가
  - `_deleteBookmark` 메서드에 `_updateBookmarkState(id, false)` 추가

---

**요약:**
- 북마크 상태가 레시피 ID 기반으로 올바르게 관리됨
- 카테고리 변경 시에도 북마크 상태가 정확한 레시피에 표시됨
- 빈 카테고리에서 돌아와도 북마크 상태가 유지됨
- DishCard가 StatelessWidget으로 변경되어 더 효율적인 구조가 됨
- 중앙 집중식 상태 관리로 일관성 있는 북마크 기능 구현 