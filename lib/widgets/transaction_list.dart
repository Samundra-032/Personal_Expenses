import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return /*Container(
      height: MediaQuery.of(context).size.height * 0.6,

        //child: ListView.builder(//alternative of SingleChildScrollView
        child: */
        transactions.isEmpty ? Column(children: <Widget>[
          Text('No Transaction added yet',
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            height: 400,
              child: Image.asset(
                'assets/image/waiting.png',
                fit: BoxFit.cover,
              )
          ),
        ],
        )
            :ListView.builder(
          itemBuilder: (ctx,index) {
            /*return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        //color: Colors.purple,
                        color: Theme.of(context).primaryColorDark,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        //color: Colors.purple,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        *//*style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),*//*
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          //color: Colors.grey,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );*/
            return Card(
              elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
              child:ListTile(
              leading: CircleAvatar(//we can use here a container with height width && boxdecoration (color & shape )
                radius: 30, 
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'
            ),
                  ),
                ),
            ),

              // ignore: deprecated_member_use
              title: Text(transactions[index].title,style: Theme.of(context).textTheme.title,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)
              ),
                trailing:
                IconButton(
                  icon:Icon(
                      Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transactions[index].id),
                ),


            ),
            );

          },
          itemCount: transactions.length,

        );

   // );
  }
}
