run:
	flutter clean
	flutter run

deploy:
	flutter build apk
	firebase appdistribution:distribute \
	build/app/outputs/apk/release/app-release.apk \
	--app 1:273650104146:android:ec8fba19e15438aec2ac8b \
	--groups "testckcapp" \
	--release-notes-file "./release-notes.txt"

deploy-test:
	flutter build apk --split-per-abi
	firebase appdistribution:distribute \
	build/app/outputs/apk/release/app-arm64-v8a-release.apk \
	--app 1:273650104146:android:ec8fba19e15438aec2ac8b \
	--testers "baoloc008@gmail.com" \
	--release-notes-file "./release-notes.txt"
