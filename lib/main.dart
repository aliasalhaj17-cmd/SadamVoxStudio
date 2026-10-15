import 'package:flutter/material.dart';

void main() {
  runApp(const SadamVoxUltimateStudio());
}

class SadamVoxUltimateStudio extends StatelessWidget {
  const SadamVoxUltimateStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SADAM VOX',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF080502),
      ),
      home: const FinalStudioDashboard(),
    );
  }
}

class FinalStudioDashboard extends StatefulWidget {
  const FinalStudioDashboard({super.key});

  @override
  State<FinalStudioDashboard> createState() => _FinalStudioDashboardState();
}

class _FinalStudioDashboardState extends State<FinalStudioDashboard> with TickerProviderStateMixin {
  late AnimationController _mainAnimationController;
  late Animation<double> _uiScaleAnimation;

  @override
  void initState() {
    super.initState();
    _mainAnimationController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    _uiScaleAnimation = CurvedAnimation(parent: _mainAnimationController, curve: Curves.easeOutBack);
    _mainAnimationController.forward();
  }

  @override
  void dispose() {
    _mainAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF0C0804),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (isLandscape) {
                return _buildLandscapeLayout(constraints);
              } else {
                return _buildPortraitLayout(constraints);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout(BoxConstraints constraints) {
    final leftSidebarWidth = constraints.maxWidth * 0.18;
    final rightSidebarWidth = constraints.maxWidth * 0.15;

    return Row(
      children: [
        // القائمة الجانبية اليسرى المستخرجة تلقائياً من الرابط عبر الكود المحدث
        _buildLeftNetworkSidebar(leftSidebarWidth),

        Expanded(
          child: Column(
            children: [
              _buildTopControlHeader(constraints.maxHeight * 0.13),
              
              Expanded(
                flex: 4,
                child: ScaleTransition(
                  scale: _uiScaleAnimation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: LayoutBuilder(
                      builder: (context, frameConstraints) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network('https://googleapis.com', width: frameConstraints.maxWidth, fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox()),
                            
                            Positioned.fill(
                              child: Opacity(
                                opacity: 0.5,
                                child: Stack(
                                  children: [
                                    Positioned(left: frameConstraints.maxWidth * 0.08, top: frameConstraints.maxHeight * 0.2, child: Image.network('https://googleapis.com', height: frameConstraints.maxHeight * 0.2, errorBuilder: (c, e, s) => const SizedBox())),
                                    Positioned(left: frameConstraints.maxWidth * 0.3, bottom: frameConstraints.maxHeight * 0.15, child: Image.network('https://googleapis.com', height: frameConstraints.maxHeight * 0.2, errorBuilder: (c, e, s) => const SizedBox())),
                                    Positioned(left: frameConstraints.maxWidth * 0.52, top: frameConstraints.maxHeight * 0.1, child: Image.network('https://googleapis.com', height: frameConstraints.maxHeight * 0.26, errorBuilder: (c, e, s) => const SizedBox())),
                                    Positioned(left: frameConstraints.maxWidth * 0.74, bottom: frameConstraints.maxHeight * 0.18, child: Image.network('https://googleapis.com', height: frameConstraints.maxHeight * 0.18, errorBuilder: (c, e, s) => const SizedBox())),
                                  ],
                                ),
                              ),
                            ),
                            
                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildFeatureColumn('coin_voice_clone.png', 'lbl_voice_clone.png', 'txt_voice_clone.png', frameConstraints.maxHeight),
                                  _buildFeatureColumn('coin_ai_singer.png', 'lbl_ai_singer.png', 'txt_ai_singer.png', frameConstraints.maxHeight),
                                  _buildFeatureColumn('coin_voice_cleaner.png', 'lbl_voice_cleaner.png', 'txt_voice_cleaner.png', frameConstraints.maxHeight),
                                  _buildFeatureColumn('coin_music_composer.png', 'lbl_music_composer.png', 'txt_music_composer.png', frameConstraints.maxHeight),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox()),
                      ),
                      const SizedBox(width: 4),
                      
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                                  Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                                  Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),

                      Container(
                        width: constraints.maxWidth * 0.14,
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                            Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                            Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                            Expanded(child: Image.network('https://googleapis.com', fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox())),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        _buildRightSidebarMenu(rightSidebarWidth),
      ],
    );
  }

  Widget _buildLeftNetworkSidebar(double width) {
    return Container(
      width: width,
      decoration: const BoxDecoration(border: Border(right: BorderSide(color: Color(0xFF3A2A14), width: 1.5))),
      child: Column(
        children: [
          const SizedBox(height: 6),
          const Text('المشروعات المخزنة', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 11, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  
