import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;
  final Color highlightColor;
  final Color baseColor;

  const CustomShimmer({
    Key? key,
    required this.child,
    this.highlightColor = const Color(0xfff6f7f9),
    this.baseColor = const Color(0xffe9ebee),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      //highlightColor: Color(0xFFDCE1EE),
      //baseColor: Color(0xA1CFD5E0),
      highlightColor: highlightColor,
      baseColor: baseColor,
      child: child,
    );
  }
}

class TextContainer extends StatelessWidget {
  final double width;
  final double height;

  const TextContainer({Key? key, required this.width, this.height = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}

class ShimmerChip extends StatelessWidget {
  const ShimmerChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ChoiceChip(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0.0,
        label: Container(
          width: double.maxFinite,
          child: Text(
            ' KM',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        selected: false,
        selectedColor: Colors.blue,
        backgroundColor: Colors.white,
        onSelected: (isSelected) {},
      ),
    );
  }
}

class ShimmerChipList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1, 2, 3, 4]
          .map((_) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ShimmerChip(),
                ),
              ))
          .toList(growable: false),
    );
  }
}

class SearchShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Color(0xFFE5F8FF),
        child: TextField(
          //onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),

            ///hintText: hintText,
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandableShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: TextContainer(
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        children: <Widget>[
          ShimmerSimpleListTile(
            isSubtitle: true,
          ),
          ShimmerSimpleListTile(
            isSubtitle: true,
          ),
        ],
      ),
    );
  }
}

class FeedShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xffe9ebee),
        ),
        title: TextContainer(
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        subtitle: TextContainer(
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextContainer(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
          ShimmerSimpleListTile(
            isSubtitle: true,
          ),
        ],
      ),
    );
  }
}

enum ListTileType { Simple, Detailed, CheckBox }

class ListViewShimmer extends StatelessWidget {
  final ListTileType listTileType;
  final bool isTrailing;
  final bool isSubtitle;

  const ListViewShimmer(
      {Key? key,
      required this.listTileType,
      this.isTrailing = true,
      this.isSubtitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 9,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return listTileType == ListTileType.Simple
            ? ShimmerSimpleListTile(
                isSubtitle: isSubtitle,
                isTrailing: isTrailing,
              )
            : listTileType == ListTileType.Detailed
                ? Container(
                    child: Text('TO be implemented'),
                  )
                : ShimmerCheckboxListTile();
      },
    );
  }
}

class ShimmerSimpleListTile extends StatelessWidget {
  final bool isTrailing;
  final bool isSubtitle;

  const ShimmerSimpleListTile(
      {Key? key, this.isTrailing = true, this.isSubtitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        title: TextContainer(
          width: MediaQuery.of(context).size.width / 1.4,
        ),
        trailing: isTrailing ? Icon(Icons.arrow_forward_ios, size: 18) : null,
        subtitle: isSubtitle
            ? TextContainer(
                width: MediaQuery.of(context).size.width / 4,
              )
            : null,
      ),
    );
  }
}

class ShimmerCheckboxListTile extends StatelessWidget {
  final bool isSubtitle;

  const ShimmerCheckboxListTile({Key? key, this.isSubtitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: CheckboxListTile(
        onChanged: (_) {},
        value: false,
        checkColor: Colors.white,
        activeColor: Colors.green,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextContainer(
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        subtitle: isSubtitle
            ? TextContainer(
                width: MediaQuery.of(context).size.width / 4,
              )
            : null,
      ),
    );
  }
}
