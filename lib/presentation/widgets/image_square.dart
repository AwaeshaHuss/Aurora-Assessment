import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageSquare extends StatelessWidget {
  final String? imageUrl;
  final bool loading;
  final String? error;
  final VoidCallback? onTap;

  const ImageSquare({super.key, this.imageUrl, this.loading = false, this.error, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: SizedBox.expand(
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: imageUrl == null
                        ? (loading
                            ? const Center(child: CircularProgressIndicator())
                            : Container(
                                key: const ValueKey('empty'),
                                color: Theme.of(context).colorScheme.surfaceVariant,
                                child: const Center(child: Text('No image')),
                              ))
                        : GestureDetector(
                            key: ValueKey(imageUrl),
                            onTap: onTap,
                            child: CachedNetworkImage(
                              imageUrl: imageUrl!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Theme.of(context).colorScheme.surfaceVariant,
                                child: const Center(child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Theme.of(context).colorScheme.surfaceVariant,
                                child: const Center(child: Icon(Icons.broken_image)),
                              ),
                            ),
                          ),
                  ),
                ),
                if (error != null)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black26,
                      child: Center(child: Text('Error loading image', style: TextStyle(color: Theme.of(context).colorScheme.onBackground))),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
