import 'package:flutter/material.dart';
import 'package:to_do_application/Objects/Task.dart';
import 'data/Repository.dart';

void main() {
  runApp(MaterialApp(home: ToDo()));
}

class ToDo extends StatefulWidget {
  int CurrentIndex = 0;

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do APP'),
      ),
      body: PageView(
        children: [AllTasksPage(), CompletePage(), InCompletePage()],
        onPageChanged: (index) {
          widget.CurrentIndex = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          currentIndex: widget.CurrentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'AllTasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Complete',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alarm_sharp), label: 'InComplete')
          ]),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          Repository.tasks.add(new Task(
              isComplete: false,
              Description: 'Description ${Repository.tasks.length + 1}',
              Id: Repository.tasks.length + 1,
              Title: 'Task ${Repository.tasks.length + 1}'));
          setState(() {});
        },
      ),
    );
  }
}

class InCompletePage extends StatefulWidget {
  @override
  _InCompletePageState createState() => _InCompletePageState();
}

class _InCompletePageState extends State<InCompletePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Repository.tasks.map((e) {
      if (!e.isComplete) {
        return Container(
          margin: EdgeInsets.all(30),
          color: Colors.deepOrange,
          child: ListTile(
            title: Text(e.Title),
            leading: Icon(Icons.add_moderator),
            subtitle: Text(e.Description),
            trailing: Checkbox(
                value: e.isComplete,
                onChanged: (value) {
                  e.isComplete = value;
                  setState(() {});
                }),
          ),
        );
      } else {
        return Container();
      }
    }).toList());
  }
}

class AllTasksPage extends StatefulWidget {
  @override
  _AllTasksPageState createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Repository.tasks.map((e) {
      return Container(
        margin: EdgeInsets.all(30),
        color: e.isComplete ? Colors.green : Colors.deepOrange,
        child: ListTile(
          title: Text(e.Title),
          leading: Icon(Icons.add_moderator),
          subtitle: Text(e.Description),
          trailing: Checkbox(
              value: e.isComplete,
              onChanged: (value) {
                e.isComplete = value;
                setState(() {});
              }),
        ),
      );
    }).toList());
  }
}

class CompletePage extends StatefulWidget {
  @override
  _CompletePageState createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Repository.tasks.map((e) {
      if (e.isComplete) {
        return Container(
          margin: EdgeInsets.all(30),
          color: Colors.green,
          child: ListTile(
            title: Text(e.Title),
            leading: Icon(Icons.add_moderator),
            subtitle: Text(e.Description),
            trailing: Checkbox(
                value: e.isComplete,
                onChanged: (value) {
                  e.isComplete = value;
                  setState(() {});
                }),
          ),
        );
      } else {
        return Container();
      }
    }).toList());
  }
}
