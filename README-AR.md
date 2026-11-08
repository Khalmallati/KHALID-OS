# KHALID OS Cloud 1.0
واجهة Linux خفيفة مستوحاة من ChromeOS: شريط سفلي، صفحة بدء، مشغّل تطبيقات، وهوية Emerald.

- الهدف: Intel Atom N455 / RAM 1GB / x86 i386.
- الأساس: Debian 12 Bookworm i386.
- سطح المكتب: LXDE + Openbox + tint2.
- لا يحتوي المشروع على ChromeOS أو ملفات Google.
- التصفح الحديث والذكاء الاصطناعي المحلي محدودان جداً على 1GB RAM.

## بناء ISO
على Debian Linux: ثبّت live-build debootstrap squashfs-tools xorriso isolinux syslinux-common syslinux-utils dosfstools mtools ثم نفّذ:
```bash
sudo ./scripts/build-iso.sh
```
الناتج: `output/KHALID-OS-Cloud-1.0-i386.iso`.

## GitHub Actions
ارفع محتويات المشروع إلى GitHub، ثم Actions > Build KHALID OS Cloud ISO > Run workflow. نزّل Artifact بعد نجاح البناء.

مساعد KHALID AI محلي بسيط مع API سحابي اختياري. لا تضع مفاتيح API في المستودع العام.