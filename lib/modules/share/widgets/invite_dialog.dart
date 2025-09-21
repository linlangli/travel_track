import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_track/extensions/widget.dart';

/// 邀请弹窗
/// 显示行程名称、说明文案、邀请码（可复制）以及装饰性图标。
class InviteDialog extends StatelessWidget {
  const InviteDialog({
    super.key,
    required this.tripName,
    required this.inviteCode,
    this.onCopy,
    this.onJoin,
  });

  final String tripName; // 行程名称
  final String inviteCode; // 邀请码（数字/字母）
  final VoidCallback? onCopy; // 复制回调
  final VoidCallback? onJoin; // 加入/确认回调

  static Future<T?> show<T>(BuildContext context, {
    required String tripName,
    required String inviteCode,
    VoidCallback? onCopy,
    VoidCallback? onJoin,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      builder: (_) => InviteDialog(
        tripName: tripName,
        inviteCode: inviteCode,
        onCopy: onCopy,
        onJoin: onJoin,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final digits = inviteCode.trim();
    final chars = digits.characters.take(8).toList(); // 最多展示 8 位

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 420, maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
          child: Stack(
            children: [
              // 主体列
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _TripTag(name: tripName),
                  const SizedBox(height: 32),
                  Text(
                    "一起加入，来一场说走就走的旅行吧...",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.4,
                      color: Colors.black87,
                      fontFamily: 'MuyaoSoftbrush',
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "输入坐标，找到我们",
                      style: theme.textTheme.titleSmall?.copyWith(
                        letterSpacing: 1,
                        fontFamily: "MuyaoSoftbrush"
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _CodeBoxes(chars: chars),
                ],
              ),

              // 右上角编辑图标
              Positioned(
                top: 0,
                right: 4,
                child: SvgPicture.asset(
                  'assets/images/icons/share_icon.svg',
                  width: 40,
                  height: 40,
                ),
              ),
              Positioned(
                top: 128,
                right: 24,
                child: SvgPicture.asset(
                  'assets/images/icons/copy_icon.svg',
                  width: 32,
                  height: 32,
                ).button(onTap: () async {
                    await Clipboard.setData(ClipboardData(text: digits));
                    onCopy?.call();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('已复制邀请码')),
                      );
                    }
                }),
              ),
              // 底部右侧消息/表情
              Positioned(
                right: 24,
                bottom: 48,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/cry_icon.svg',
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '委婉拒绝',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 32,
                bottom: 54,
                child: SvgPicture.asset(
                  'assets/images/icons/telescope_icon.svg',
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TripTag extends StatelessWidget {
  const _TripTag({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF2C04E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontFamily: 'MuyaoSoftbrush',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _CodeBoxes extends StatelessWidget {
  const _CodeBoxes({required this.chars});
  final List<String> chars;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(chars.length, (i) {
        return Container(
          width: 40,
          height: 54,
          margin: EdgeInsets.only(right: i == chars.length - 1 ? 0 : 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 1.4),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            chars[i],
            style: const TextStyle(
              fontFamily: 'MuyaoSoftbrush',
              fontSize: 28,
              height: 1.1,
              letterSpacing: 1,
            ),
          ),
        );
      }),
    );
  }
}

