import 'package:flutter/material.dart';
import 'package:global_app/core/widgets/skeleton_loader.dart';

class PokemonCardSkeleton extends StatelessWidget {
  const PokemonCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 102,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Pokemon info skeleton
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pokemon number skeleton
                  SkeletonLoader(
                    width: 60,
                    height: 14,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // Pokemon name skeleton
                  SkeletonLoader(
                    width: 120,
                    height: 20,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // Types skeleton
                  Row(
                    children: [
                      SkeletonLoader(
                        width: 60,
                        height: 20,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      const SizedBox(width: 4),
                      SkeletonLoader(
                        width: 60,
                        height: 20,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Right side - Pokemon image skeleton
          Stack(
            alignment: Alignment.topRight,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 126,
                height: 102,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: SkeletonLoader(
                    width: 94,
                    height: 94,
                    borderRadius: BorderRadius.circular(47),
                  ),
                ),
              ),
              // Favorite icon skeleton
              Positioned(
                top: 8,
                right: 8,
                child: SkeletonLoader(
                  width: 32,
                  height: 32,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
