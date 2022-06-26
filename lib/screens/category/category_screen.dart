import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:help/components/error_box.dart';
import 'package:help/models/category.dart';
import 'package:help/stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({this.showAll = true, this.selected});

  final Category? selected;
  final bool showAll;

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    //return Container();  }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Observer(builder: (_) {
            if (categoryStore.error != null) {
              return ErrorBox(
                message: categoryStore.error,
              );
            } else if (categoryStore.categoryList.isEmpty) {
              return const Center(
                child: const CircularProgressIndicator(),
              );
            } else {
              final categories = showAll
                  ? categoryStore.allCategoryList
                  : categoryStore.categoryList;

              return ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (_, __) {
                  return const Divider(height: 0.1, color: Colors.black);
                },
                itemBuilder: (_, index) {
                  final category = categories[index];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: category.id == selected?.id
                          ? Colors.black.withAlpha(50)
                          : null,
                      child: Text(
                        category.description,
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
