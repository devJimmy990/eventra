import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key, required this.press, required this.riveOnInit});

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          press(); // Call the toggleSidebar function
        },
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: (artboard) {
              final controller = StateMachineController.fromArtboard(
                  artboard, "State Machine");
              artboard.addController(controller!);
              final isMenuOpenInput = controller.findInput<bool>("isOpen") as SMIBool;


              // Reverse the logic: Default to open (X icon) when sidebar is closed
              isMenuOpenInput.value = false; // Show X when sidebar is closed

              riveOnInit(artboard); // Pass the artboard back to parent
            },
          ),
        ),
      ),
    );
  }
}
