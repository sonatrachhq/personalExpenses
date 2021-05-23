import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/PersonalExpensesApp/chart.dart';
import 'package:flutter_app/PersonalExpensesApp/newTransaction.dart';
import 'package:flutter_app/PersonalExpensesApp/transaction.dart';
import 'package:flutter_app/PersonalExpensesApp/transactionList.dart';





class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver{
  bool _showChart=false;

  final List<Transaction> _userTransactions=[
   /*Transaction(id: 't1', title: 'new shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'dresses', amount: 99.99, date: DateTime.now())*/
  ];

  List<Transaction> get _recentTransactions{
      return _userTransactions.where((transaction) {
            return transaction.date.isAfter(
                DateTime.now().subtract(
                    Duration(days:7)
                )
            );
      }).toList();
  }
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);// to have the state of app (inactive,paused,resumed or suspended)
    super.didChangeAppLifecycleState(state);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  void _addNewTransaction(String title,double amount, DateTime chosenDate){
    final newTx=Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id==id;
      });
    });
  }
  _startNewTransaction(BuildContext cntx){
    showModalBottomSheet(context: cntx, builder: (builderContex){
      return NewTransaction(_addNewTransaction);
    });
  }
  List<Widget> _builLandScapeContent(MediaQueryData mediaQuery,AppBar appBar,Widget txListWidget){
    return [Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Show chart'
        ),
        Switch.adaptive(value: _showChart, //we use adaptive to have an adaptive design for IOS and Android
          onChanged: (val){
            setState(() {
              _showChart=val;
            });
          },
          activeColor: Theme.of(context).accentColor,
        ),
      ],
    ),_showChart?
    Container(
    height: (mediaQuery.size.height - appBar.preferredSize.height -mediaQuery.padding.top)*0.6,

    child: Chart(_recentTransactions
    ),
    )
        : txListWidget,];
  }

  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery,AppBar appBar,Widget txListWidget){
    return [Container(
      height: (mediaQuery.size.height - appBar.preferredSize.height -mediaQuery.padding.top)*0.3,

      child: Chart(_recentTransactions
      ),
    ),txListWidget];
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation==Orientation.landscape;
    final appBar=AppBar(
      title: Text('Personal Expenses Application'),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              _startNewTransaction(context);
            }
        ),
      ],
    );
    final txListWidget=Container(
        height: (mediaQuery.size.height - appBar.preferredSize.height -mediaQuery.padding.top)*0.7,
        child: TransactionList(_userTransactions,_deleteTransaction)
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea( // we have to use safeArea
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             if(isLandscape) ..._builLandScapeContent(mediaQuery, appBar, txListWidget),
            if(!isLandscape) ..._buildPortraitContent(mediaQuery, appBar, txListWidget),

            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // to check if we're using android or IOS we have to import Dart:io and check the platform
      //moe detail to have an IOS interfaces on video 117 118 119 120 121
      floatingActionButton: Platform.isIOS? Container(): FloatingActionButton(
        child: Icon(
          Icons.add,
        ),

        onPressed: (){
            _startNewTransaction(context);
        },
      ),
    );
  }
}
