import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget{
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  DateTime _selectDate;

  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitData(){
    if (_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null ){
      return;
    }

    widget.addTx(
      //titleController.text,
      //double.parse(amountController.text)
      enteredTitle,
      enteredAmount,
      _selectDate,

    );

    Navigator.of(context).pop();//to close input keyboard

  }

  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
    ).then((pickedDate){
      if(pickedDate == null){
        return;

      }

      setState(() {
        _selectDate = pickedDate;
      }
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(

        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                //onChanged: (value){titleInput = value;},
                controller: _titleController,
              ),

              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                //onChanged: (value) => amountInput = value,
                controller: _amountController,

                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),

             Container(
               height: 70,
              child:Row(
                 children: <Widget> [
                   Expanded(
              child:Text(
                 _selectDate == null ? 'No Date Chosen'
                     : 'Picked Date: ${DateFormat.yMd().format( _selectDate)}'
               ),
                   ),
                   // ignore: deprecated_member_use
                   FlatButton(
                     textColor: Theme.of(context).primaryColor,
                       child:Text(
                           'Choose Date',
                           style:TextStyle(fontWeight: FontWeight.bold)
                       ),
                       onPressed: _presentDatePicker,
                   ),
               ],
              ),
             ),


              // ignore: deprecated_member_use
              RaisedButton(
                /*onPressed: (){
                  addTx(titleController.text,double.parse(amountController.text));
                  //print(titleController.text);
                  //print(amountController.text);
                },*/
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                //textColor: Colors.purple,
                onPressed: _submitData,

              ),

            ],
          ),
        ),
      ),
    );
  }
}