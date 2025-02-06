
import 'package:flutter/material.dart'; //where everythin

void main() {
 runApp(MyApp());
}//entry point runs the app 

class MyApp extends StatelessWidget {  //stateless intial build 
 @override
 Widget build(BuildContext context) {
  return MaterialApp(  //basic app functions like themes basic set up how to navigate the theme 
  //what this does it manages the state of the tab each tab has 3 properties
   home: DefaultTabController(
    length: 3,
    child: _TabsNonScrollableDemo(),
   ),
  );
 }
}

class _TabsNonScrollableDemo extends StatefulWidget { // this is the stateful widget hold the look of the tab
 @override
 __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
  with SingleTickerProviderStateMixin, RestorationMixin {
 late TabController _tabController;

 final RestorableInt tabIndex = RestorableInt(0);//bring you back to the main tab 

 @override
 String get restorationId => 'tab_non_scrollable_demo';

 @override
 void restoreState(RestorationBucket? oldBucket, bool initialRestore) { //reset to tab index once app restarted
  registerForRestoration(tabIndex, 'tab_index');
  _tabController.index = tabIndex.value;
 }

 @override
 void initState() { //init adds event listener (action) updates
 super.initState();
  _tabController = TabController( 
   initialIndex: 0,
   length: 5,
   vsync: this,
 );
 _tabController.addListener(() {
 setState(() {
 tabIndex.value = _tabController.index;
 });
 });
 }
//super.dispose keyword this would 
 @override
 void dispose() { //remove the tab controller anytime you get rid of it 
 _tabController.dispose();
 tabIndex.dispose();
  super.dispose();
 }

 @override
 Widget build(BuildContext context) {
// For the ToDo task hint: consider defining the widget and name of the tabs here 
 final tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'tab 4', 'tab 5'];

  return Scaffold( //building ui the intial object that 
 appBar: AppBar(
 automaticallyImplyLeading: false,
 title: Text(
 'devon app',
 ),
 bottom: TabBar(
 controller: _tabController,
 isScrollable: false,
 tabs: [
 for (final tab in tabs) Tab(text: tab),
 ],
 ),
 ),
 body: TabBarView(
 controller: _tabController,
 children: [
// hint for the to do task:Considering creating the different for different tabs 
 for (final tab in tabs)
 Center(
child: Text(tab),
 ),
 ],
 ),
  );
 }
}