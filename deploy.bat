@echo on
flutter build web --no-sound-null-safety
git add .
git commit -m %1
git push origin main