import 'package:flutter/material.dart';
import 'package:flutter_provider_firebase/ui/add_todo_page.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context),
            // _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Center(
      child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTodoPage(),
              ),
            );
          },
          child: Text("add schedule")),
    );
  }

  Widget _buildListView(List<dynamic> list) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CheckboxListTile(
                value: list[index].isDone,
                title: Text(list[index].title),
                subtitle: Text(list[index].description),
                onChanged: (val) {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment(0.75, 0.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outlined),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
