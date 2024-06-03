import 'package:flutter/material.dart';
import 'package:flutter_application/models/dish_info.dart';

class CustomDishWidget extends StatelessWidget {
  final DishInfo dishInfo;

  CustomDishWidget({required this.dishInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              dishInfo.dishType.text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                dishInfo.dishName.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Image.network(
                              dishInfo.urlDishImage.text,
                            ),
                            ...dishInfo.dishDescriptions
                                .asMap()
                                .entries
                                .map(
                              (entry) {
                                int index = entry.key;
                                TextEditingController controller =
                                    entry.value;

                                if (index % 2 == 0) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      controller.text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controller.text,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              child: Text(
                dishInfo.dishName.text,
                style: TextStyle(color: Color(0xFF333333)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
