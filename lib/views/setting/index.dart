import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scheduling_assistant/providers/settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);
    if (settingsAsync.hasError) {
      return Center(child: Text('加载失败: ${settingsAsync.error}'));
    }
    if (settingsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final data = settingsAsync.value!;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        _Title('设置'),

        const SizedBox(height: 16),

        _GroupCard(
          title: '日历设置',
          children: [
            _SwitchTile(
              title: '显示农历',
              subtitle: '在日历中显示农历信息',
              value: data.showLunar,
              onChanged: (v) {
                ref.read(settingsProvider.notifier).toggleLunar();
              },
            ),

            _Divider(),

            _SwitchTile(
              title: '显示节气',
              subtitle: '在日历中显示二十四节气',
              value: data.showSolarTerm,
              onChanged: (v) {
                ref.read(settingsProvider.notifier).toggleSolarTerm();
              },
            ),

            // _Divider(),

            // _SwitchTile(
            //   title: '显示颜色标识',
            //   subtitle: '在日历排班上显示设置的颜色',
            //   value: data.showColor,
            //   onChanged: (v) {
            //     ref.read(settingsProvider.notifier).toggleColor();
            //   },
            // ),
          ],
        ),

        // const SizedBox(height: 16),

        // _GroupCard(
        //   title: '提醒设置',
        //   children: [
        //     _StepperTile(
        //       title: '提前提醒时间',
        //       subtitle: '事件开始前多少分钟提醒',
        //       value: data.notifyBeforeMinutes,
        //       onChanged: (v) {
        //         ref.read(settingsProvider.notifier).setNotifyBeforeMinutes(v);
        //       },
        //       min: 0,
        //       max: 120,
        //       step: 5,
        //     ),
        //   ],
        // ),
        const SizedBox(height: 16),

        _GroupCard(
          title: '模板设置',
          children: [
            _PickerTile(
              title: '默认模板',
              subtitle: '选择默认排班模板',
              value: data.defaultTemplateId,
              options: const [
                PickerItem(0, '无'),
                PickerItem(1, '模板 A'),
                PickerItem(2, '模板 B'),
              ],
              onChanged: (v) {
                ref.read(settingsProvider.notifier).setDefaultTemplate(v);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _GroupCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Divider(height: 1, thickness: 0.6),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeTrackColor: Colors.green.shade400,
        inactiveThumbColor: Colors.grey.shade700,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}

class _StepperTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int value;
  final int min;
  final int max;
  final int step;
  final ValueChanged<int> onChanged;

  const _StepperTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.min = 0,
    this.max = 100,
    this.step = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: value > min ? () => onChanged(value - step) : null,
          ),
          Text(
            '$value',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: value < max ? () => onChanged(value + step) : null,
          ),
        ],
      ),
    );
  }
}

class PickerItem<T> {
  final T value;
  final String label;

  const PickerItem(this.value, this.label);
}

class _PickerTile<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final T? value;
  final List<PickerItem<T>> options;
  final ValueChanged<T> onChanged;

  const _PickerTile({
    required this.title,
    required this.value,
    required this.options,
    required this.onChanged,
    this.subtitle,
  });

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          children: options.map((e) {
            return ListTile(
              title: Text(e.label),
              onTap: () {
                onChanged(e.value);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = options
        .where((e) => e.value == value)
        .map((e) => e.label)
        .firstOrNull;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(selected ?? '未设置', style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: () => _showPicker(context),
    );
  }
}
