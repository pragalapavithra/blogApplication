import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

@RoutePage(name:"BlogPageRouter")
class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Blog Page");
  }
}
