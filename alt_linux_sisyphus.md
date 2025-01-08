# Alt Linux Sisyphus
При проблемах воспроизведения видео в Yandex браузере нужно:
1. Найти папку установки браузера и утилиту поиска кодеков:
```shell
sudo find /. -name find_ffmpeg -type f 
```
1. Скачиваем и распаковываем из [репозитория](https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases) крайнюю версию кодека
1. Копируем файл кодека `libffmpeg.so` в папку браузера
1. Запускаем утилиту поиска кодеков `find_ffmpeg` и проверяем ее вывод.   
   Если вывод такой:
   ```
   Found ffmpeg: /usr/lib64/ffmpeg-plugin-browser/libffmpeg.so
    	avcodec: 3999080
    	avformat: 3998567
    	avutil: 3871588
   FFmpeg version is too new. Need:
    	avcodec: 3999076
    	avformat: 3998564
    	avutil: 3870564
   Found ffmpeg: /usr/lib64/yandex/browser/libffmpeg.so
    	avcodec: 3999080
    	avformat: 3998567
    	avutil: 3871588
   FFmpeg version is too new. Need:
    	avcodec: 3999076
    	avformat: 3998564
    	avutil: 3870564
   ```
   то скачанная версия слишком новая. Качаем пдедыдущие версии пока не добьемся положительного результата:
   ```
   Found ffmpeg: /usr/lib64/yandex/browser/libffmpeg.so
    	avcodec: 3999078
    	avformat: 3998564
    	avutil: 3870564
   Ffmpeg version is OK! Let's use it.
   ```
