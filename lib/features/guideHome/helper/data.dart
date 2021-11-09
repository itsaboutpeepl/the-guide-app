//redux section action
import 'package:peepl/features/guideHome/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.labelName = 'Latest';
  categoryModel.categoryName = 'Business';

  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2

  categoryModel = CategoryModel();
  categoryModel.labelName = 'Food & Drink';
  categoryModel.categoryName = "Entertainment";

  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.labelName = "Culture";
  categoryModel.categoryName = "General";

  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.labelName = "Family";
  categoryModel.categoryName = "Health";

  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.labelName = "Features";
  categoryModel.categoryName = "Science";

  category.add(categoryModel);

  return category;
}

//should probably be redux side
