import 'package:minder/views/card_view.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 4;
    //create a CardController
    SwipeableCardSectionController _cardController = SwipeableCardSectionController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            //add the first 3 cards
            items: [
              CardView(text: "Pizza", author: "Mario", image: Image.asset("assets/images/food/pizza.jpg")),
              CardView(text: "Ice Cream", author: "Penguin", image: Image.asset("assets/images/food/ice_cream.jpg")),
              CardView(text: "Smörgåstårta", author: "SwidishChef1997", image: Image.asset("assets/images/food/smorgostorta.jpg")),
            ],
            onCardSwiped: (dir, index, widget) {
              //Add the next card
              if (counter <= 20) {
                _cardController.addItem(CardView(text: "Card $counter"));
                counter++;
              }

              if (dir == Direction.left) {
                print('onDisliked ${(widget as CardView).text} $index');
              } else if (dir == Direction.right) {
                print('onLiked ${(widget as CardView).text} $index');
              } else if (dir == Direction.up) {
                print('onUp ${(widget as CardView).text} $index');
              } else if (dir == Direction.down) {
                print('onDown ${(widget as CardView).text} $index');
              }
            },
            enableSwipeUp: true,
            enableSwipeDown: true,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.chevron_left),
                  onPressed: () => _cardController.triggerSwipeLeft(),
                ),
                FloatingActionButton(
                  child: Icon(Icons.chevron_right),
                  onPressed: () => _cardController.triggerSwipeRight(),
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_upward),
                  onPressed: () => _cardController.triggerSwipeUp(),
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_downward),
                  onPressed: () => _cardController.triggerSwipeDown(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}