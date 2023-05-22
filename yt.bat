@echo off

:Start
echo:
echo Super YT-DLP script activated
echo:
echo 1: Download video/playlist/channel from url
echo 2: Download audio/playlist from url
echo 3: Download video from youtube.txt
echo 4: Download audio from youtube.txt
echo 5: Normal archival url
echo 6: Normal archival youtube.txt
echo 7: Ultimate archival url
echo 8: Ultimate archival youtube.txt
echo 9: Update
echo:
:Again
set /p SELECTION=Make your choice: 
if %SELECTION%==1 set/p URL=URL: 
if %SELECTION%==2 set/p URL=URL: 
if %SELECTION%==5 set/p URL=URL: 
if %SELECTION%==7 set/p URL=URL: 

if %SELECTION%==1 goto Video_Url
if %SELECTION%==2 goto Audio_Url
if %SELECTION%==3 goto Video_TXT
if %SELECTION%==4 goto Audio_TXT
if %SELECTION%==5 goto Archive_Url
if %SELECTION%==6 goto Archive_TXT
if %SELECTION%==7 goto UArchive_Url
if %SELECTION%==8 goto UArchive_TXT
if %SELECTION%==9 goto Update
goto Again

:Video_Url

set /p VALUE=Channel folder? (Y/N) 
if /I %VALUE%==Y (
	yt-dlp --output "%%(channel)s/%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
	echo DONE!
	pause
	goto Start
)

if /I %VALUE%==N (
	yt-dlp --output "%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
	echo DONE!
	pause
	goto Start
)

echo idiot
goto Video_Url

:Audio_Url

set /p VALUE=Channel folder? (Y/N) 
set /p CHAP=Is the video multiple songs divided by chapters? (Y/N)
if /I %VALUE%==Y (
	if /I %CHAP%==Y (
		yt-dlp --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters --exec del -o "chapter:%%(channel)s/%%(title)s/%%(section_number)s - %%(section_title)s.%%(ext)s" %URL%	
		echo DONE!
		pause
		goto Start
	)
	if /I %CHAP%==N (
		yt-dlp --embed-metadata --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --output "%%(channel)s/%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s.%%(ext)s" %URL%
		echo DONE!
		pause
		goto Start
	)
)

if /I %VALUE%==N (
	if /I %CHAP%==Y (
		yt-dlp --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters --exec del -o "chapter:%%(title)s/%%(section_number)s - %%(section_title)s.%%(ext)s"	%URL%
		echo DONE!
		pause
		goto Start
	)
	if /I %CHAP%==N (
		yt-dlp --embed-metadata --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --output "%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s.%%(ext)s" %URL%
		echo DONE!
		pause
		goto Start
	)
)

echo idiot
goto Audio_Url

:Video_TXT

set /p VALUE=Channel folder? (Y/N) 
if /I %VALUE%==Y (
	yt-dlp --batch-file youtube.txt --output "%%(channel|)s/%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" 
	echo DONE!
	pause
	goto Start
)

if /I %VALUE%==N (
	yt-dlp --batch-file youtube.txt --output "%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" 
	echo DONE!
	pause
	goto Start
)

echo idiot
goto Video_TXT

:Audio_TXT

set /p VALUE=Channel folder? (Y/N) 
set /p CHAP=Is the video multiple songs divided by chapters? (Y/N)
if /I %VALUE%==Y (
	if /I %CHAP%==Y (
		yt-dlp --batch-file youtube.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters --exec del -o "chapter:%%(channel)s/%%(title)s/%%(section_number) - %%(section_title)s.%%(ext)s" 
		echo DONE!
		pause
		goto Start
	)
	if /I %CHAP%==N (
		yt-dlp --batch-file youtube.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --output "%%(channel)s/%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s.%%(ext)s" 
		echo DONE!
		pause
		goto Start
	)
)

if /I %VALUE%==N (
	if /I %CHAP%==Y (
		yt-dlp --batch-file youtube.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --split-chapters --exec del -o "chapter:%%(title)s/%%(section_number) - %%(section_title)s.%%(ext)s"	
		echo DONE!
		pause
		goto Start
	)
	if /I %CHAP%==N (
		yt-dlp --batch-file youtube.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0 --output "%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s.%%(ext)s" 
		echo DONE!
		pause
		goto Start
	)
)

echo idiot
goto Audio_TXT

:Archive_Url

set /p VALUE=Channel folder? (Y/N)
if /I %VALUE%==Y (
		yt-dlp --download-archive archive.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --embed-subs --embed-chapters --output "%%(channel|)s/%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
		echo DONE!
		pause
		goto Start
)

if /I %VALUE%==N (
		yt-dlp --download-archive archive.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --embed-subs --embed-chapters --output "%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
		echo DONE!
		pause
		goto Start
)

echo idiot
goto Archive_Url

:Archive_TXT

set /p VALUE=Channel folder? (Y/N)
if /I %VALUE%==Y (
		yt-dlp --batch-file youtube.txt --download-archive archive.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --embed-subs --embed-chapters --output "%%(channel|)s/%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext"
		echo DONE!
		pause
		goto Start
)

if /I %VALUE%==N (
		yt-dlp --batch-file youtube.txt --download-archive archive.txt --embed-metadata --embed-thumbnail --convert-thumbnails jpg --embed-subs --embed-chapters --output "%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext"
		echo DONE!
		pause
		goto Start
)

echo idiot
goto Archive_TXT

:UArchive_Url

set /p VALUE=Channel folder? (Y/N)
set /p VALUE_COM=Write comments? (Y/N)
if /I %VALUE%==Y (
	if /I %VALUE_COM%==Y (
		yt-dlp --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-comments --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(channel)s/%%(playlist_title|)s/%%(playlist_index& - |)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
		echo DONE!
		pause
		goto Start
	)
	if /I %VALUE_COM%==N (
		yt-dlp --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(channel)s/%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
		echo DONE!
		pause
		goto Start
	)
)

if /I %VALUE%==N (
	if /I %VALUE_COM%==Y (
		yt-dlp --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-comments --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
		echo DONE!
		pause
		goto Start
	)
	if /I %VALUE_COM%==N (
		yt-dlp --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" %URL%
		echo DONE!
		pause
		goto Start
	)
)

echo idiot
goto UArchive_Url

:UArchive_TXT

set /p VALUE=Channel folder? (Y/N)
set /p VALUE_COM=Write comments? (Y/N)
if /I %VALUE%==Y (
	if /I %VALUE_COM%==Y (
		yt-dlp --batch-file youtube.txt --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-comments --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(channel|)s/%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" 
		echo DONE!
		pause
		goto Start
	)
	if /I %VALUE_COM%==N (
		yt-dlp --batch-file youtube.txt --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(channel|)s/%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" 
		echo DONE!
		pause
		goto Start
	)
)

if /I %VALUE%==N (
	if /I %VALUE_COM%==Y (
		yt-dlp --batch-file youtube.txt --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-comments --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" 
		echo DONE!
		pause
		goto Start
	)
	if /I %VALUE_COM%==N (
		yt-dlp --batch-file youtube.txt --download-archive ultimate_archive.txt --write-description --write-info-json --embed-info-json --embed-metadata --write-thumbnail --embed-thumbnail --convert-thumbnails jpg --write-subs --embed-subs --embed-chapters --output "%%(playlist_title|)s/%%(playlist_index& -|)s%%(title)s/%%(title)s_[%%(id)s].%%(ext)s" --format-sort "ext" 
		echo DONE!
		pause
		goto Start
	)
)

echo idiot
goto UArchive_TXT

:Update
echo Updating yt-dlp don't worry
yt-dlp.exe -U
goto Start

