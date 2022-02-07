@echo on
powershell -Command " & flutter build web --no-sound-null-safety"
powershell -Command " & git add ."
powershell -Command " & git commit -m %1"
powershell -Command " & git push origin main"
