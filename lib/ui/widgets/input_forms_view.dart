import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputFormsView extends HookWidget {
  final List<Widget> children;
  InputFormsView({@required this.children});

  @override
  Widget build(BuildContext context) {
    final sc = useScrollController();
    useEffect(() {
      _setOnScroll(sc, context);
      return null;
    }, []);
    return ListView(
        controller: sc,
        children: <Widget>[
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children
                )
              )
            )
          )
        ]
      );
  }

  _setOnScroll(ScrollController sc, BuildContext ctx) {
    sc.addListener(() => FocusScope.of(ctx).unfocus());
  }
}
