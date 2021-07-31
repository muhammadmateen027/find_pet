import 'package:find_pet/routes/routes.dart';
import 'package:find_pet/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 39),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: GestureDetector(
        onTap: () => navigationService.pushNamed(
          RoutesName.petDetail,
          arguments: url,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                child: Container(
                  width: double.maxFinite,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(url), fit: BoxFit.fitHeight)),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.favorite, size: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Perro Labrador',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Perro Labrador',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Universal Medicine (UniMed) (UM) is "a socially harmful cult"'
                      ' founded and led by Serge Benhayon, a former bankrupt '
                      'tennis coach from New South Wa',
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
