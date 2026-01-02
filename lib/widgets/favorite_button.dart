// import 'package:flutter/material.dart';

// import '../screens/home_screen.dart';
// import '../screens/favorites_page.dart';
// import '../screens/cart_screen.dart';
// import '../screens/profile_screen.dart';

// class BottomNav extends StatelessWidget {
//   final int index;

//   const BottomNav({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: index,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.pink,
//       unselectedItemColor: Colors.grey,

//       onTap: (i) {
//         if (i == index) return;

//         Widget page;
//         switch (i) {
//           case 0:
//             page = const HomeScreen();
//             break;
//           case 1:
//             page = const FavoritesPage();
//             break;
//           case 2:
//             page = const CartPage();
//             break;
//           case 3:
//             page = const ProfilePage();
//             break;
//           default:
//             page = const HomeScreen();
//         }

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => page),
//         );
//       },

//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite),
//           label: 'Fav',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart),
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }






// import 'package:flutter/material.dart';

// class FavoriteButton extends StatefulWidget {
//   final bool isFavorite;
//   final VoidCallback onTap;

//   const FavoriteButton({
//     super.key,
//     required this.isFavorite,
//     required this.onTap,
//   });

//   @override
//   State<FavoriteButton> createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//       lowerBound: 0.8,
//       upperBound: 1.2,
//     );
//   }

//   void _animate() {
//     _controller.forward().then((_) => _controller.reverse());
//     widget.onTap();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _controller,
//       child: IconButton(
//         icon: Icon(
//           widget.isFavorite ? Icons.favorite : Icons.favorite_border,
//           color: widget.isFavorite ? Colors.pink : Colors.grey,
//         ),
//         onPressed: _animate,
//       ),
//     );
//   }
// }















// import 'package:flutter/material.dart';

// class FavoriteButton extends StatefulWidget {
//   final bool isFavorite;
//   final VoidCallback onTap;

//   const FavoriteButton({
//     super.key,
//     required this.isFavorite,
//     required this.onTap,
//   });

//   @override
//   State<FavoriteButton> createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scale;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );

//     _scale = Tween<double>(begin: 1.0, end: 1.2).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOut,
//       ),
//     );
//   }

//   @override
//   void didUpdateWidget(covariant FavoriteButton oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     /// Animate ONLY when favorite state changes
//     if (oldWidget.isFavorite != widget.isFavorite) {
//       _controller.forward().then((_) => _controller.reverse());
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _scale,
//       child: IconButton(
//         icon: Icon(
//           widget.isFavorite
//               ? Icons.favorite
//               : Icons.favorite_border,
//           color: widget.isFavorite ? Colors.pink : Colors.grey,
//         ),
//         onPressed: widget.onTap,
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class FavoriteButton extends StatefulWidget {
//   final bool isFavorite;
//   final VoidCallback onTap;

//   const FavoriteButton({
//     super.key,
//     required this.isFavorite,
//     required this.onTap,
//   });

//   @override
//   State<FavoriteButton> createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scale;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//       lowerBound: 0.9,
//       upperBound: 1.2,
//     );

//     _scale = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     );
//   }

//   void _handleTap() {
//     _controller.forward().then((_) => _controller.reverse());
//     widget.onTap();
//   }

//   @override
//   void didUpdateWidget(covariant FavoriteButton oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     /// If favorite state changed externally (Provider/Firestore)
//     if (oldWidget.isFavorite != widget.isFavorite) {
//       _controller.forward().then((_) => _controller.reverse());
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _scale,
//       child: IconButton(
//         icon: Icon(
//           widget.isFavorite
//               ? Icons.favorite
//               : Icons.favorite_border,
//           color: widget.isFavorite ? Colors.pink : Colors.grey,
//         ),
//         onPressed: _handleTap,
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.pink : Colors.grey,
      ),
      onPressed: onTap,
    );
  }
}
