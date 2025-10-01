import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Todos los Pokémon en un solo lugar",
          body:
              "Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo",
          image: Image.asset("assets/images/onboarding1.png", height: 220),
          decoration: const PageDecoration(
            imageFlex: 3,
            bodyFlex: 2,
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
            imagePadding: EdgeInsets.only(top: 40),
            contentMargin: EdgeInsets.only(top: 20),
          ),
        ),
        PageViewModel(
          title: "Mantén tu Pokédex actualizada",
          body:
              "Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación",
          image: Image.asset("assets/images/onboarding2.png", height: 220),
          decoration: const PageDecoration(
            imageFlex: 3,
            bodyFlex: 2,
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
            imagePadding: EdgeInsets.only(top: 40),
            contentMargin: EdgeInsets.only(top: 20),
          ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, "/pokedex");
      },
      showNextButton: false,
      showSkipButton: false,
      done: const SizedBox.shrink(),
      dotsDecorator: DotsDecorator(
        size: const Size(8, 8),
        activeSize: const Size(20, 8),
        color: Colors.grey.shade300,
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),

      globalFooter: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              context.go('/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Continuar",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
