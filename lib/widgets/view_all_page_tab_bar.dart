import 'package:flutter/material.dart';
import 'package:washly_mobile/widgets/bill_list.dart';
import '../dummy_data.dart';

class ViewAllTabBar extends StatefulWidget {
  ViewAllTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAllTabBar> createState() => _ViewAllTabBarState();
}

late TabController _tabController;

class _ViewAllTabBarState extends State<ViewAllTabBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        top: 50,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 47,
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      // give the indicator a decoration (color and border radius)
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: Color(0xffD7EF7D),
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                      tabs: const [
                        Tab(
                          text: "Ongoing Laundry",
                        ),
                        Tab(
                          text: "Completed Delivery",
                        )
                      ])),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BillList(
                      orderdetails: orderdetails,
                      isDeleveredVisible: false,
                    ),
                    BillList(
                      orderdetails: orderdetails,
                      isDeleveredVisible: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ));
  }
}
