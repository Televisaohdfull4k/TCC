import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class TelaDashboardPsicologo extends StatelessWidget {
  const TelaDashboardPsicologo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // Botão flutuante no canto inferior direito
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.buttonPrimary,
        elevation: 0,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nova Sessão',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho: Saudação e Ícone de Notificação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bom dia,',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Dra. Sarah Miller',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black.withOpacity(0.08)),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Métricas do dia (Chips verde e azul)
              Row(
                children: [
                  Expanded(
                    child: _construirCardMetrica(
                      icone: Icons.calendar_today_rounded,
                      numero: '12',
                      rotulo: 'Sessões Hoje',
                      corFundo: AppColors.chipVerdeFundo,
                      corIconeTexto: AppColors.chipVerdeTexto,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _construirCardMetrica(
                      icone: Icons.people_outline_rounded,
                      numero: '48',
                      rotulo: 'Pacientes Ativos',
                      corFundo: AppColors.chipAzulFundo,
                      corIconeTexto: AppColors.chipAzulTexto,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Seção da Agenda Horizontal
              const Text(
                'Sua Agenda',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 90,
                // ListView horizontal para rolar os dias da semana
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _construirDiaAgenda('Seg', '24', selecionado: true),
                    _construirDiaAgenda('Ter', '25', selecionado: false),
                    _construirDiaAgenda('Qua', '26', selecionado: false),
                    _construirDiaAgenda('Qui', '27', selecionado: false),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Seção de Próximas Sessões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Próximas Sessões',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Ver Histórico',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Cards das consultas
              _construirCardSessao(
                nome: 'Marcus Thompson',
                sessaoStatus: 'Sessão 4',
                horario: '09:00 - 10:00',
                tipoAcesso: 'Videochamada',
                textoBadge: 'Confirmada',
                corBadgeFundo: AppColors.badgeVerdeFundo,
                corBadgeTexto: AppColors.badgeVerdeTexto,
                imagemUrl: 'https://i.pravatar.cc/150?img=11',
              ),
              const SizedBox(height: 16),
              _construirCardSessao(
                nome: 'Elena Rodriguez',
                sessaoStatus: 'Sessão 12',
                horario: '10:30 - 11:30',
                tipoAcesso: 'Presencial',
                textoBadge: 'Começando em breve',
                corBadgeFundo: AppColors.badgeLaranjaFundo,
                corBadgeTexto: AppColors.badgeLaranjaTexto,
                imagemUrl: 'https://i.pravatar.cc/150?img=5',
              ),

              // Espaço extra no final para o botão flutuante não tampar o último item
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widgets Auxiliares ---

  Widget _construirCardMetrica({
    required IconData icone,
    required String numero,
    required String rotulo,
    required Color corFundo,
    required Color corIconeTexto,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: corIconeTexto, size: 24),
          const SizedBox(height: 12),
          Text(
            numero,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: corIconeTexto,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            rotulo,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirDiaAgenda(
    String diaSemana,
    String diaMes, {
    required bool selecionado,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 70,
      decoration: BoxDecoration(
        color: selecionado ? AppColors.buttonPrimary : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: selecionado
              ? Colors.transparent
              : Colors.black.withOpacity(0.08),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            diaSemana,
            style: TextStyle(
              fontSize: 13,
              color: selecionado
                  ? Colors.white.withOpacity(0.8)
                  : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            diaMes,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: selecionado ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirCardSessao({
    required String nome,
    required String sessaoStatus,
    required String horario,
    required String tipoAcesso,
    required String textoBadge,
    required Color corBadgeFundo,
    required Color corBadgeTexto,
    required String imagemUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(imagemUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.history_rounded,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          sessaoStatus,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: corBadgeFundo,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  textoBadge,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: corBadgeTexto,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: Color(0xFFF0F0F0)),
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                horario,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 24),
              const Icon(
                Icons.videocam_outlined,
                size: 18,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                tipoAcesso,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
