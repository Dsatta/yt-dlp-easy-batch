# yt-dlp-easy-batch
Easy batch file for yt-dlp

Simple script i made to download stuff with yt-dlp (The code sucks a lot i'm sorry)

**Requires yt-dlp and ffmpeg in the same folder as the batch script or in your %PATH%**<br>
(Both can be easily downloaded from their respective websites or you can use scoop)

Options are pretty self explanatory but

<ol>
  <li> Downloads video from video/playlist/channel in mp4 with the best quality in a folder named as the playlist(or not if it isn't a playlist), if it's a playlist it also includes the playlist index in the filename
    <li> Downloads audio from video/playlist/channel in mp3 with metadata added and thumbnail (you might get wack metadata if the uploader is a third party), same folder structure as above
      <ul>
        <li> You can also divide a long album/collection of songs uploaded as a single video divided by chapters!
      </ul>
      <li> Same as 1 but reads the links from youtube.txt
        <li> Same as 2 but reads the links from youtube.txt
          <li> Same as 1 but also downloads subtitles, chapters, and embeds thumbnail and creates an archive.txt file that tracks what videos you have downloaded 
            <li> Same as 5 but reads links from youtube.txt
              <li> Archives EVERYTHING about the video (all info in a json, description, subtitles, chapters, thumbnail, and optionally comments) and instead creates ultimate-archive.txt
                <li> Same as 7 but reads from youtube.txt
                  <li> Update
       </ol>
                 
All options optionally can put the files in a folder named as the channel name
