import 'package:flutter/material.dart';
import 'package:location/src/themes/jeddTheme.dart';
import 'package:flutter/widgets.dart';

class ListViewSettings extends StatelessWidget {
  final List<ListVeiwItemModel> items;
  final Color bgColor = Color.fromRGBO(236, 240, 241, 2);
  final divider;
  ListViewSettings(this.items,
      {this.divider = const Divider(
        height: 1,
        indent: 70,
      )});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: this.items.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          // ? Section 
          if (items[index].section != null) {
            return Container(
              decoration: BoxDecoration(color: greyLight,),
              padding: EdgeInsets.only(top: 1, bottom: 1),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(items[index].section ,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.black)),
                subtitle: items[index].subtitle != null
                    ? Text(items[index].subtitle)
                    : null,
              ),
            );
          }
          // ? Render a list item
          return Container(
          
            child: ListTile(
              title: Text(items[index].title),
              leading: _leading(items[index]),
              subtitle: items[index].subtitle != null
                  ? Text(items[index].subtitle)
                  : null,
              trailing: _trailing(items[index]),
              onTap: items[index].onTap,
              
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          if (index != 0) {
            if (items[index + 1].section != null ||
                items[index].section != null) {
              return Container();
            }
          }
          return this.divider;
        },
      ),
    );
  }

  _leading(ListVeiwItemModel item) {
    if (item.icon == null && item.imgUrl == null) {
      return null;
    }
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      padding: EdgeInsets.all(4),

      child: item.icon != null
          ? Icon(
              item.icon,
              size: 25,
              color: item.iconColor != null ? item.iconColor : Colors.white,
            )
          : Image.asset(item.imgUrl),
      decoration: BoxDecoration(
          color: item.bgColor != null ? item.bgColor : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(7))),
    );
  }

  Widget _trailing(ListVeiwItemModel item) {
    final _next = Icon(Icons.arrow_forward_ios, size: 13);
    if (!item.trailing) {
      return null;
    }
    if (item.sideBtn != null) {
      return item.sideBtn;
    }
    if (item.sideText != null && item.showNextIcon) {
      return SizedBox(
        width: 149,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 120,
                      minWidth: 15,
                      
                    ),
                    child: Text(
                      item.sideText,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    )),
              ),
              SizedBox(width: 3),
              _next,
            ],
          ),
        ),
      );
    }
    if (item.showNextIcon) {
      return _next;
    }
  }
}

class ListVeiwItemModel {
  final String section;
  final String title;
  final String subtitle;
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final String imgUrl;
  final Function onTap;
  final bool trailing;
  final bool showNextIcon;
  final String sideText;
  final Widget sideBtn;

  ListVeiwItemModel.section({this.section = "", this.subtitle, this.bgColor})
      : imgUrl = null,
        icon = null,
        iconColor = null,
        onTap = null,
        title = null,
        sideBtn = null,
        showNextIcon = false,
        trailing = false,
        sideText = null;

  ListVeiwItemModel(
      {this.title,
      this.subtitle,
      this.bgColor,
      this.icon,
      this.iconColor,
      this.imgUrl,
      this.trailing = true,
      this.sideBtn,
      this.sideText,
      this.showNextIcon = true,
      this.onTap})
      : section = null;
  ListVeiwItemModel copyWith({
    String title,
    String subtitle,
    IconData icon,
    String imgUrl,
  }) {
    return ListVeiwItemModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      imgUrl: imgUrl ?? this.imgUrl,
      onTap: onTap ?? this.onTap,
    );
  }
}
