import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/perspective_card.dart';

// Imports das telas
import 'employee/employee_login_screen.dart';
import 'psicologo/tela_dashboard_psicologo.dart';

class ChoosePerspectiveScreen extends StatelessWidget {
  const ChoosePerspectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),

                    const Text(
                      'MindBridge',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Conectando o bem-estar corporativo\nà segurança psicológica.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Escolha sua perspectiva',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Opção 1: Colaborador
                    PerspectiveCard(
                      title: 'Colaborador',
                      subtitle: 'Acesse check-ins de humor, recursos e o ...',
                      icon: Icons.self_improvement_rounded,
                      iconColor: AppColors.iconEmployee,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeeLoginScreen(),
                          ),
                        );
                      },
                    ),

                    // Opção 3: Psicólogo
                    PerspectiveCard(
                      title: 'Psicólogo',
                      subtitle:
                          'Gerencie consultas e dê suporte aos seus pacien...',
                      icon: Icons.psychology_rounded,
                      iconColor: AppColors.iconPsychologist,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TelaDashboardPsicologo(),
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    const SizedBox(height: 24),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.verified_user_rounded,
                          color: AppColors.iconPrivacy,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Sua privacidade é nossa prioridade. Dados individuais\n são sempre anonimizados para os relatórios de RH.',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_rounded,
                        color: AppColors.textAction,
                        size: 20,
                      ),
                      label: const Text(
                        'Configurações de Privacidade',
                        style: TextStyle(
                          color: AppColors.textAction,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
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
