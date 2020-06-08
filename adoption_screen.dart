import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_ui/animal_detail_screen.dart';

class Animal {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroundColor;

  Animal({
    this.name,
    this.scientificName,
    this.age,
    this.distanceToUser,
    this.isFemale,
    this.imageUrl,
    this.backgroundColor,
  });
}

class AdoptionScreen extends StatefulWidget {
  final Function menuCallback;

  AdoptionScreen({@required this.menuCallback});

  @override
  _AdoptionScreenState createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  int selectedAnimalIconIndex = 0;

  final List<Animal> animals = [
    Animal(
      name: 'Sola',
      scientificName: 'Abyssinian cat',
      age: 2.0,
      distanceToUser: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
    Animal(
      name: 'Orion',
      scientificName: 'Abyssinian cat',
      age: 1.5,
      distanceToUser: '7.8 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: Color.fromRGBO(237, 214, 180, 1.0),
    ),
  ];

  List<String> animalTypes = [
    'Cats',
    'Dogs',
    'Parrots',
    'Fish',
    'Fish',
  ];

  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
    FontAwesomeIcons.fish,
  ];

  Widget buildAnimalIcon(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Material(
              color: selectedAnimalIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  animalIcons[index],
                  size: 30.0,
                  color: selectedAnimalIconIndex == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            animalTypes[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Icon(
                    FontAwesomeIcons.bars,
                  ),
                  onTap: widget.menuCallback,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Location',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Lyon, ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'France',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).primaryColor.withOpacity(0.06),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 20.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.search,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 18.0),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Search pets to adopt'),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.filter,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120.0,
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 24.0,
                            top: 8.0,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: animalTypes.length,
                          itemBuilder: (context, index) {
                            return buildAnimalIcon(index);
                          }),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            top: 10.0,
                          ),
                          itemCount: animals.length,
                          itemBuilder: (context, index) {
                            final animal = animals[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AnimalDetailScreen(animal: animal);
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 10.0,
                                  right: 20.0,
                                  left: 20.0,
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      elevation: 4.0,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 20.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            SizedBox(
                                              width: deviceWidth * 0.4,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      Text(
                                                        animal.name,
                                                        style: TextStyle(
                                                          fontSize: 26.0,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Icon(
                                                        animal.isFemale
                                                            ? FontAwesomeIcons
                                                                .venus
                                                            : FontAwesomeIcons
                                                                .mars,
                                                        color: Colors.grey,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    animal.scientificName,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    '${animal.age} years old',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 16.0,
                                                      ),
                                                      SizedBox(
                                                        width: 6.0,
                                                      ),
                                                      Text(
                                                        'Distance: ${animal.distanceToUser}',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: animal.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          height: 190.0,
                                          width: deviceWidth * 0.4,
                                        ),
                                        Hero(
                                          tag: animal.name,
                                          child: Image(
                                            image: AssetImage(animal.imageUrl),
                                            height: 220.0,
                                            fit: BoxFit.fitHeight,
                                            width: deviceWidth * 0.4,
                                          ),
                                        ),
                                      ],
                                      alignment: Alignment.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
