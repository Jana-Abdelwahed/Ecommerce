import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColorSelector extends StatefulWidget {
  final ValueChanged<Color>? onColorSelected;

  const ProductColorSelector({super.key, this.onColorSelected});

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  final List<Color> _colors = [
    const Color(0xFF2F2E2E),
    const Color(0xFFBC3016),
    const Color(0xFF0973DD),
    const Color(0xFF00B633),
    const Color(0xFFFF6A63),
  ];

  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors[1];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _colors.map((color) {
        bool isSelected = _selectedColor == color;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
            if (widget.onColorSelected != null) {
              widget.onColorSelected!(color);
            }
          },
          child: Container(
            margin: EdgeInsets.only(right: 14.w),
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: isSelected
                ? Icon(Icons.check_rounded, color: Colors.white, size: 20.r)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
