import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override

  _HomeState createState() => _HomeState();

}



class _HomeState extends State<Home> with TickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(

        length: 2,

        child: NestedScrollView(


          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

            return <Widget>[

              SliverAppBar(

                expandedHeight: 200.0,

                floating: false,

                pinned: true,

                flexibleSpace: FlexibleSpaceBar(

                    centerTitle: true,


                    title: Text("Our Title",

                        style: TextStyle(

                          color: Color(4278203238),

                          fontSize: 16.0,

                        )),

                    background: Image(image: AssetImage('images/buyonline.jpg'),
                      fit: BoxFit.cover,

                    )),

              ),

              SliverPersistentHeader(

                delegate: _SliverAppBarDelegate(

                  TabBar(

                    labelColor: Colors.black87,

                    unselectedLabelColor: Colors.grey,

                    tabs: [

                      Tab(icon: Icon(Icons.attach_money), text: "Seller"),

                      Tab(icon: Icon(Icons.add_shopping_cart), text: "Buyer"),

                    ],

                  ),

                ),

                pinned: true,

              ),

            ];

          },

          body: Center(

            child: TabBarView(
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("seller page"),
                     Text("add info here"),

                    ],
                ),
                Center(
                  child: Text("buyer page"),
                ),
              ],
              controller: _tabController,
            ),

          ),

        ),

      ),

    );

  }

}



class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  _SliverAppBarDelegate(this._tabBar);



  final TabBar _tabBar;



  @override

  double get minExtent => _tabBar.preferredSize.height;

  @override

  double get maxExtent => _tabBar.preferredSize.height;



  @override

  Widget build(

      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return new Container(

      child: _tabBar,

    );

  }



  @override

  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {

    return false;

  }

}