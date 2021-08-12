import 'package:contacts_book/models/contact.dart';
import 'package:contacts_book/provider/contacts.dart';
import 'package:contacts_book/screens/details/details.dart';
import 'package:contacts_book/screens/details/widgets/my_themed_icon.dart';
import 'package:contacts_book/style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  //Screen initial state
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus Contatos"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contacts.elementAt(index);
          return ListTile(
            leading: IconButton(
              icon: MyThemedIcon(icon: contact.isFavorite ? Icons.star : Icons.star_border),
              onPressed: (){
                setState(() {
                  contact.isFavorite = !contact.isFavorite;
                });
              },
              color: blueTheme,
            ),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      return Details(contact);
                    }
                  )
                );
              },
              color: grayTheme,
            ),
            title: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    contact.photo,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: grayTheme
                      ),
                    ),
                    Text(
                      contact.phoneNumber,
                      style: TextStyle(
                        color: grayTheme,
                        fontSize: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return Divider();
        },
        itemCount: contacts.length,
      ),
    );
  }
}