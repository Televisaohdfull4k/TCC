import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class EmployeeDashboardScreen extends StatefulWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  State<EmployeeDashboardScreen> createState() =>
      _EmployeeDashboardScreenState();
}

class _EmployeeDashboardScreenState extends State<EmployeeDashboardScreen> {
  int _selectedMoodIndex = -1; // -1 significa nenhum selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text(
          'Voltar',
          style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Saudação e Avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bom dia, Alex',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Como você está se sentindo hoje?',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.iconChevron,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=11',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildDailyCheckInCard(),
            const SizedBox(height: 24),

            _buildYourWeekCard(),
            const SizedBox(height: 32),

            const Text(
              'Recomendado para você',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildRecommendationCard(
              icon: Icons.self_improvement_rounded,
              title: 'Meditação de 5 Min',
              subtitle: 'Alivie a ansiedade matinal',
              iconColor: AppColors.textPrimary,
              bgColor: AppColors.iconMeditationBg,
            ),
            _buildRecommendationCard(
              icon: Icons.calendar_today_rounded,
              title: 'Agendar Sessão',
              subtitle: 'Fale com um especialista',
              iconColor: AppColors.textPrimary,
              bgColor: AppColors.iconSessionBg,
            ),
            _buildRecommendationCard(
              icon: Icons.psychology_rounded,
              title: 'Kit de Segurança',
              subtitle: 'Guias de bem-estar no trabalho',
              iconColor: Colors.white,
              bgColor: AppColors.iconToolkitBg,
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                icon: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Salvar Check-in Diário',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 14,
                  color: AppColors.textPrimary.withOpacity(0.7),
                ),
                const SizedBox(width: 8),
                Text(
                  'Seus dados são privados e criptografados',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textPrimary.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyCheckInCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Check-in Diário',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMoodOption(
                0,
                Icons.sentiment_very_dissatisfied_rounded,
                'Estressado',
              ),
              _buildMoodOption(1, Icons.sentiment_neutral_rounded, 'Ok'),
              _buildMoodOption(2, Icons.sentiment_satisfied_rounded, 'Bem'),
              _buildMoodOption(
                3,
                Icons.sentiment_very_satisfied_rounded,
                'Ótimo',
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'O que está pensando?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Opcional: Compartilhe um breve pensamento...',
              hintStyle: TextStyle(
                color: AppColors.textSecondary.withOpacity(0.5),
                fontSize: 13,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.background.withOpacity(0.5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColors.buttonPrimary.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodOption(int index, IconData icon, String label) {
    final isSelected = _selectedMoodIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMoodIndex = index;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.buttonPrimary.withOpacity(0.1)
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.buttonPrimary
                    : Colors.black.withOpacity(0.08),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Icon(
              icon,
              size: 32,
              color: isSelected
                  ? AppColors.buttonPrimary
                  : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourWeekCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sua Semana',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'Ver Insights',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: CustomPaint(painter: _WaveChartPainter()),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'].map((day) {
              return Text(
                day,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.03)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.iconChevron,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WaveChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = AppColors.chartLine
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final paintFill = Paint()
      ..color = AppColors.chartFill
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.5,
      size.width * 0.35,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.8,
      size.width * 0.7,
      size.height * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * -0.1,
      size.width,
      size.height * 0.35,
    );

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, paintFill);
    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
