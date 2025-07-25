import 'package:flutter_recipe_app/data/data_source/bookmark_data_source.dart';

import '../dto/recipe_dto.dart';

class MockBookmarkDataSourceImpl implements BookmarkDataSource {
  final data = [
    {
      "category": "Indian",
      "id": 1,
      "name": "Traditional spare ribs baked",
      "image":
          "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
      "chef": "Chef John",
      "time": "20 min",
      "rating": 4.0,
      "ingredients": [
        {
          "ingredient": {
            "id": 3,
            "name": "Pork",
            "image":
                "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg",
          },
          "amount": 500,
        },
        {
          "ingredient": {
            "id": 9,
            "name": "Onion",
            "image":
                "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
          },
          "amount": 50,
        },
        {
          "ingredient": {
            "id": 8,
            "name": "Pepper",
            "image":
                "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg",
          },
          "amount": 10,
        },
        {
          "ingredient": {
            "id": 1,
            "name": "Tomato",
            "image":
                "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
          },
          "amount": 100,
        },
      ],
    },
    {
      "id": 2,
      "category": "Asian",
      "name": "Spice roasted chicken with flavored rice",
      "image":
          "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      "chef": "Mark Kelvin",
      "time": "20 min",
      "rating": 4.0,
      "ingredients": [
        {
          "ingredient": {
            "id": 6,
            "name": "Chicken",
            "image":
                "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg",
          },
          "amount": 300,
        },
        {
          "ingredient": {
            "id": 4,
            "name": "Rice",
            "image":
                "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg",
          },
          "amount": 200,
        },
        {
          "ingredient": {
            "id": 8,
            "name": "Pepper",
            "image":
                "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg",
          },
          "amount": 5,
        },
        {
          "ingredient": {
            "id": 3,
            "name": "Pork",
            "image":
                "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg",
          },
          "amount": 500,
        },
      ],
    },
    {
      "id": 3,
      "category": "Chinese",
      "name": "Spicy fried rice mix chicken bali",
      "image":
          "https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg",
      "chef": "Spicy Nelly",
      "time": "20 min",
      "rating": 4.0,
      "ingredients": [
        {
          "ingredient": {
            "id": 6,
            "name": "Chicken",
            "image":
                "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg",
          },
          "amount": 200,
        },
        {
          "ingredient": {
            "id": 4,
            "name": "Rice",
            "image":
                "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg",
          },
          "amount": 150,
        },
        {
          "ingredient": {
            "id": 1,
            "name": "Tomato",
            "image":
                "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
          },
          "amount": 100,
        },
      ],
    },
    {
      "category": "Japanese",
      "id": 4,
      "name": "Ttekbokki",
      "image":
          "https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_1280.jpg",
      "chef": "Kim Dahee",
      "time": "30 min",
      "rating": 5.0,
      "ingredients": [],
    },
  ];

  @override
  Future<List<RecipeDto>> getSavedRecipes() async {
    return data.map((e) => RecipeDto.fromJson(e)).toList();
  }
}

void main() async {
  final MockBookmarkDataSourceImpl dataSource = MockBookmarkDataSourceImpl();
  final result = await dataSource.getSavedRecipes();

  print(result);
}
