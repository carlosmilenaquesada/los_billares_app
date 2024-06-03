import 'package:flutter/material.dart';
import 'package:flutter_application/models/dish_info.dart';
import 'package:flutter_application/screens/change_menu_screen.dart';
import 'package:flutter_application/widgets/custom_dish_widget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class MainSelectionMenuScreen extends StatefulWidget {
  final http.Response response;
  MainSelectionMenuScreen({required this.response});

  @override
  MainSelectionMenuScreenState createState() => MainSelectionMenuScreenState();
}

class MainSelectionMenuScreenState extends State<MainSelectionMenuScreen> {
  bool _isContainerInfoVisible = true;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(2010, 1, 1);
  DateTime _lastDay = DateTime.utc(2040, 12, 31);

  late DishInfo _lunchFirstDish = DishInfo(
      "Primer plato",
      "Ensalada de pasta",
      [
        "Ingredientes",
        "Pasta alimenticia y compuesta  a las espinacas y al tomate (72%) (sémola de TRIGO duro, pasta alimenticia compuesta a las  espinacas (sémola de TRIGO duro, espinacas deshidratadas (2,5%), pasta alimenticia compuesta al tomate(sémola de TRIGO duro concentrado doble de tomate (5%)), fumet (agua, MERLUZA), vianda de mejillón (MOLUSCO) (Mytilus  chilensis ), calamar troceado (CALAMAR, agua),ATÚN migas (ATUN, aceite de girasol y sal), aceite de oliva virgen extra, sal yodada, vinagre de vino  (conservante E220 SULFITOS), ajo, guindilla molida, perejil y harina de maíz (almidón de  maíz).",
        "Alérgenos",
        "Contiene gluten, pescado, molusco, sulfitos, puede contener crustáceos y puede contener trazas de huevo, mostaza y soja.",
        "Valor nutricional",
        "786,4kJ / 187,89kcal"
      ],
      "https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/52bf/live/5bc2da50-f03a-11ee-93c8-19dcc8295613.jpg");
  /*late DishInfo _lunchSecondDish;
  late DishInfo _lunchDessert;
  late DishInfo _lunchDrink;
  late DishInfo _dinnerFirstDish;
  late DishInfo _dinnerSecondDish;
  late DishInfo _dinnerDessert;
  late DishInfo _dinnerDrink;*/

  void localeSync() async {
    await initializeDateFormatting('es_ES', null);
  }

  @override
  Widget build(BuildContext context) {
    localeSync();
    return Scaffold(
      appBar: AppBar(
        title: Text('Selección de menú'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isContainerInfoVisible)
                  Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 248, 227),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'NOTA',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  _isContainerInfoVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '- En la elaboración de todos nuestros platos no usamos ningún tipo de conservante (el sistema de conservación es envasado en atmósfera modificada), potenciador de sabor ni aditivo. No obstante algún ingrediente que compramos puede que contenga algún tipo de aditivo que debemos de reflejar en el etiquetado pero no es un añadido nuestro.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          '-En cuanto al pan hemos introducido la opción de poder elegir pan integral y habilitado la opción de seleccionar el tipo de pan tanto en el almuerzo como en la cena. Si tiene almuerzo y cena y desea realizar cambio de pan no olvide marcarlo tanto en el almuerzo como en la cena. Si elige cualquier opción que no sea la de bollito de pan normal (palillos, palillos integrales o pan integral) no es necesario que lo indique también en las observaciones.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Les recordamos que trabajamos con un precio de menú cerrado y no siempre podremos atender todas las peticiones recibidas.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Un cordial saludo,',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'LB Catering',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 229, 225),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                    ),
                    firstDay: _firstDay,
                    lastDay: _lastDay,
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      if (focusedDay.year > _lastDay.year) {
                        setState(() {
                          _firstDay = DateTime(focusedDay.year, 1, 1);
                          _lastDay = DateTime(focusedDay.year + 1, 12, 31);
                        });
                      } else if (focusedDay.year < _firstDay.year) {
                        setState(() {
                          _firstDay = DateTime(focusedDay.year - 1, 1, 1);
                          _lastDay = DateTime(focusedDay.year, 12, 31);
                        });
                      }
                      _focusedDay = focusedDay;
                    },
                    locale: 'es_ES',
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text('Menú del día',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              DateFormat('EEEE, dd-MMMM-yyyy', 'es_ES')
                                  .format(_selectedDay),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: Text(
                                'ALMUERZO',
                                style: TextStyle(
                                    color: Color(0xFFCE3842),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            SizedBox(height: 16),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: Text(
                                'CENA',
                                style: TextStyle(
                                    color: Color(0xFFCE3842),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            CustomDishWidget(dishInfo: _lunchFirstDish),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ChangeMenuScreen(
                                          dateTime: _selectedDay),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 5),
                                    Text('Cambiar menú'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
