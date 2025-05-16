import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const SplashScreen(this.myRepository, {super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _slideController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..forward().whenComplete(() {
            Future.delayed(Duration(milliseconds: 300), () {
              _slideController.reverse();
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LogInScreen(widget.myRepository),
                ),
              );
            }
          });

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, -1.0),
      end: Offset.fromDirection(1.0),
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    _colorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Color(0xFF68829E),
      end: Color(0xFFAEBD38),
    ).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _colorAnimation = ColorTween(
          begin: Color(0xFFAEBD38),
          end: Color(0xFFBFDCCF),
        ).animate(_colorController);
      } else if (status == AnimationStatus.dismissed) {
        _colorAnimation = ColorTween(
          begin: Color(0xFFBFDCCF),
          end: Color(0xFF68829E),
        ).animate(_colorController);
      }
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _colorAnimation.value ?? Color(0xFF68829E),
                  Color(0xFF1995AD),
                  Color(0xFF6AB187),

                  _colorAnimation.value ?? Color(0xFFAEBD38),
                  Color(0xFFBFDCCF),
                ],
              ),
            ),
            child: Center(
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset('assets/logo/logo.png'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
