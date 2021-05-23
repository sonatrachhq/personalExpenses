import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController =TextEditingController();

  final _amountController =TextEditingController();
  DateTime _selectedDate;


  void _submitData(/*String val*/){
    //we use String val as a parameter because we'll call this function with onSubmit method inside input which takes a string parameter
    //the alternative is to use (_)=> and call the function without this parameter (_) doesn't mean anything just for syntax

    final entredTitle=_titleController.text;
    final entredAmount=double.parse(_amountController.text);
    if(entredTitle.isNotEmpty&&entredAmount>0&& _selectedDate!=null){
      widget.addTx(_titleController.text,
          double.parse(_amountController.text),
      _selectedDate);
      Navigator.of(context).pop();
    }

  }

  void _showDatePicker(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()
    ).then((pickedDate) {
        if(pickedDate==null){
            return;
        }
        setState(() {
          _selectedDate=pickedDate;
        });

    });
  }

  @override
  Widget build(BuildContext context) {
    return    SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top:10,
          left:10,
          right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom+6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration:InputDecoration(
                  labelText: 'Title',
                ) ,
                controller: _titleController,
                onSubmitted: (_)=>_submitData(),
              ),
              TextField(
                decoration:InputDecoration(
                  labelText: 'Amount',
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_)=>_submitData(),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        _selectedDate==null?'No date chosen!': 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}'
                    ),
                  ),
                  TextButton(
                      onPressed: _showDatePicker,
                      child: Text('Choose a date',
                      style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _submitData,

                child: Text(
                  'Add transaction',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
