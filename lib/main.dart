import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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

  // 1. الواجهة الأفقية الكاملة والاحترافية للآيباد (iPad Layout)
  Widget _buildLandscapeLayout(BoxConstraints constraints) {
    final leftSidebarWidth = constraints.maxWidth * 0.18;
    final rightSidebarWidth = constraints.maxWidth * 0.15;

    return Row(
      children: [
        // القائمة الجانبية اليسرى: لوحات المشروعات الخمسة المخزنة
        _buildLeftProjectsSidebar(leftSidebarWidth),

        // المنطقة المركزية واليسرى الكبرى
        Expanded(
          child: Column(
            children: [
              // السقف العلوي: أزرار التحكم والشعارات
              _buildTopControlHeader(constraints.maxHeight * 0.13),
              
              // المنطقة الوسطى: إطار الميداليات والنوتات العائمة
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
                            Image.asset('assets/circles_frame.png', width: frameConstraints.maxWidth, fit: BoxFit.contain),
                            
                            // النوتات اللحنية العائمة بالخلفية
                            Positioned.fill(
                              child: Opacity(
                                opacity: 0.5,
                                child: Stack(
                                  children: [
                                    Positioned(left: frameConstraints.maxWidth * 0.08, top: frameConstraints.maxHeight * 0.2, child: Image.asset('assets/qAwEOw.png', height: frameConstraints.maxHeight * 0.2)),
                                    Positioned(left: frameConstraints.maxWidth * 0.3, bottom: frameConstraints.maxHeight * 0.15, child: Image.asset('assets/ZticoQ.png', height: frameConstraints.maxHeight * 0.2)),
                                    Positioned(left: frameConstraints.maxWidth * 0.52, top: frameConstraints.maxHeight * 0.1, child: Image.asset('assets/kj6fJS.png', height: frameConstraints.maxHeight * 0.26)),
                                    Positioned(left: frameConstraints.maxWidth * 0.74, bottom: frameConstraints.maxHeight * 0.18, child: Image.asset('assets/hhUUNe.png', height: frameConstraints.maxHeight * 0.18)),
                                  ],
                                ),
                              ),
                            ),
                            
                            // الميداليات الذهبية واللافتات في الواجهة
                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildFeatureColumn('assets/coin_voice_clone.png', 'assets/lbl_voice_clone.png', 'assets/txt_voice_clone.png', frameConstraints.maxHeight),
                                  _buildFeatureColumn('assets/coin_ai_singer.png', 'assets/lbl_ai_singer.png', 'assets/txt_ai_singer.png', frameConstraints.maxHeight),
                                  _buildFeatureColumn('assets/coin_voice_cleaner.png', 'assets/lbl_voice_cleaner.png', 'assets/txt_voice_cleaner.png', frameConstraints.maxHeight),
                                  _buildFeatureColumn('assets/coin_music_composer.png', 'assets/lbl_music_composer.png', 'assets/txt_music_composer.png', frameConstraints.maxHeight),
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
              
              // اللوحة السفلية الضخمة: المشغل الرئيسي + لوحات مراقبة النظام السحابي
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      // لوحة المشغل الرئيسي الفخم جهة اليسار
                      Expanded(
                        flex: 4,
                        child: Image.asset('assets/image_mpu28O.png', fit: BoxFit.contain),
                      ),
                      const SizedBox(width: 4),
                      
                      // لوحات المراقبة والمعالجة وحالة النظام والملفات السريعة رص متتالي
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(child: Image.asset('assets/image_WKW8lD.png', fit: BoxFit.contain)), // نظرة عامة
                                  Expanded(child: Image.asset('assets/image_CfcwW2.png', fit: BoxFit.contain)), // حالة النظام
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(child: Image.asset('assets/image_QWNFqQ.png', fit: BoxFit.contain)), // المعالجة
                                  Expanded(child: Image.asset('assets/image_nXbJZN.png', fit: BoxFit.contain)), // ملفات سريعة
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),

                      // المربع لإدارة المشاريع الأربعة (تفكيك كارد الأزرار الأربعة)
                      Container(
                        width: constraints.maxWidth * 0.14,
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Column(
                          mainAxisAlignment: Main => main.spaceEvenly,
                          children: [
                            Expanded(child: _buildGridSpriteButton('assets/image_8VLLvs.png', 0)), // استيراد
                            Expanded(child: _buildGridSpriteButton('assets/image_8VLLvs.png', 1)), // تصدير
                            Expanded(child: _buildGridSpriteButton('assets/image_8VLLvs.png', 2)), // فتح
                            Expanded(child: _buildGridSpriteButton('assets/image_8VLLvs.png', 3)), // جديد
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

        // القائمة الجانبية اليمنى: أزرار الخدمات والوظائف التسعة
        _buildRightSidebarMenu(rightSidebarWidth),
      ],
    );
  }

  // دالة تفكيك قائمة المشروعات الخمسة عمودياً
  Widget _buildLeftProjectsSidebar(double width) {
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
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                  child: AspectRatio(
                    aspectRatio: 2.8,
                    child: ClipRect(
                      child: CustomPaint(
                        
