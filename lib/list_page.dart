import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_341/list_provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Consumer<ListProvider>(builder: (ctx, provider, __) {
        //var allData = ctx.watch<ListProvider>().getData();
        var allData = provider.getData();

        return allData.isNotEmpty
            ? ListView.builder(
                itemCount: allData.length,
            itemBuilder: (_, index) {
                return ListTile(
                  title: Text(allData[index]["title"]),
                  subtitle: Text(allData[index]["desc"]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          context.read<ListProvider>().updateData(mTitle: "Updated title", mDesc: "Updated desc", index: index);
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: (){
                          context.read<ListProvider>().deleteData(index: index);
                        }, icon: Icon(Icons.delete, color: Colors.red,)),
                      ],
                    ),
                  ),
                );
              })
            : Center(
                child: Text('No Items yet!!'),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/// counter Y
/// List<Map> add, update, delete, fetch Y
/// List<Model> add, update, delete, fetch N
/// Database with Provider N (Note app)
/// Complete ToDo app with DB and Provider
/// id, title, desc, isCompleted(false)



class AddNotePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context
              .read<ListProvider>()
              .addData(mTitle: "My Title", mDesc: "Desc");
        }, child: Text('Add')),
      ),
    );
  }

}
