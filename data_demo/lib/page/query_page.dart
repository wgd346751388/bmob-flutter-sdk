import 'package:flutter/material.dart';
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import '../bean/blog.dart';

class QueryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QueryPageState();
  }
}

class _QueryPageState extends State<QueryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("查询"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  _queryInclude(context);
                },
                color: Colors.blue[400],
                child: new Text('查询关联字段',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereEqual(context);
                },
                color: Colors.blue[400],
                child: new Text('等于条件查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereNotEqual(context);
                },
                color: Colors.blue[400],
                child: new Text('不等条件查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereLess(context);
                },
                color: Colors.blue[400],
                child: new Text('小于条件查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereLessEqual(context);
                },
                color: Colors.blue[400],
                child: new Text('小于等于查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereLarge(context);
                },
                color: Colors.blue[400],
                child: new Text('大于条件查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereLargeEqual(context);
                },
                color: Colors.blue[400],
                child: new Text('大于等于查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereArrayContain(context);
                },
                color: Colors.blue[400],
                child: new Text('数组包含查询',
                    style: new TextStyle(color: Colors.white))),
            RaisedButton(
                onPressed: () {
                  _queryWhereContainIn(context);
                },
                color: Colors.blue[400],
                child: new Text('范围包含查询',
                    style: new TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  //查询关联关系
  void _queryInclude(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.setInclude("author");
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
          if (blog.author != null) {
            print(blog.author.objectId);
            print(blog.author.username);
          }
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  //等于条件查询
  void _queryWhereEqual(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.addWhereEqualTo("title", "博客标题");
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  //不等条件查询
  void _queryWhereNotEqual(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.addWhereNotEqualTo("title", "博客标题");
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  void _queryWhereLess(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.addWhereLessThan("like", 80);
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  void _queryWhereLessEqual(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.addWhereLessThanOrEqualTo("like", 77);
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  void _queryWhereLarge(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.addWhereGreaterThan("like", 70);
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  void _queryWhereLargeEqual(BuildContext context) {
    BmobQuery<Blog> query = BmobQuery();
    query.addWhereGreaterThanOrEqualTo("like", 77);
    query.queryObjects(successListener: (List<dynamic> data) {
      List<Blog> blogs = data.map((i) => Blog.fromJson(i)).toList();
      for (Blog blog in blogs) {
        if (blog != null) {
          print(blog.objectId);
          print(blog.title);
          print(blog.content);
        }
      }
    }, errorListener: (BmobError error) {
      print(error.error);
      showError(context, error.error);
    });
  }

  void _queryWhereArrayContain(BuildContext context) {

  }

  void _queryWhereContainIn(BuildContext context) {}
}
