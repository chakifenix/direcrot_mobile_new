import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 100,
              child: Text('Widget 1'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverAppBar(
            primary: false,
            backgroundColor: Colors.blue,
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'test',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text('regisData'),
                    ],
                  ),
                  Image.asset('images/pdf_icon.png')
                ],
              ),
            ]),
            floating: true,
            expandedHeight: 100,
            pinned: true,
            toolbarHeight: 100,
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: index.isEven ? Colors.white : Colors.black12,
                height: 100.0,
              );
            },
            itemCount: 25,
          ),
        ],
      ),
    );
  }
}
