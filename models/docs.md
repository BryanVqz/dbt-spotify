{% docs track_start_definitions %} 
# Track Status Definitions

| **Status**            | **Definition**                                                                 |
|-----------------------|---------------------------------------------------------------------------------|
| `trackdone`           | The track or media playback was completed successfully.                         |
| `backbtn`             | User clicked the "Back" button, likely to replay or go to a previous track.     |
| `clickrow`            | User clicked on a row—likely in a playlist or table—to initiate an action.      |
| `playbtn`             | User clicked the "Play" button to start or resume playback.                     |
| `fwdbtn`              | User clicked the "Forward" button to skip ahead or move to the next track.      |
| `appload`             | The application finished loading.                                               |
| `trackerror`          | An error occurred during track playback (e.g., missing file, load failure).     |
| `switched-to-video`   | User or system switched from audio to video mode.                               |
| `autoplay`            | Playback started automatically, without user input (e.g., on app load).         |
| `remote`              | A remote command or external control initiated playback or another action.      |
| `trackstart`          | Track or media playback was initiated (by user or autoplay).                    |
| `unknown`             | An event with an unidentified or unsupported status occurred.                   |
{% enddocs %}



{% docs track_end_definitions %}
# Track Status Definitions

| **Status**                        | **Definition**                                                                |
|----------------------------------|--------------------------------------------------------------------------------|
| `trackdone`                      | The track or media playback was completed successfully.                        |
| `backbtn`                        | User clicked the "Back" button, likely to replay or go to a previous track.    |
| `clickrow`                       | User clicked on a row—likely in a playlist or table—to initiate an action.     |
| `playbtn`                        | User clicked the "Play" button to start or resume playback.                    |
| `fwdbtn`                         | User clicked the "Forward" button to skip ahead or move to the next track.     |
| `appload`                        | The application finished loading.                                              |
| `trackerror`                     | An error occurred during track playback (e.g., missing file, load failure).    |
| `switched-to-video`              | User or system switched from audio to video mode.                              |
| `autoplay`                       | Playback started automatically, without user input (e.g., on app load).        |
| `remote`                         | A remote command or external control initiated playback or another action.     |
| `trackstart`                     | Track or media playback was initiated (by user or autoplay).                   |
| `unknown`                        | An event with an unidentified or unsupported status occurred.                  |
| `endplay`                        | The user or system ended playback (not necessarily due to track completion).   |
| `logout`                         | User logged out of the application or session.                                 |
| `trackend`                       | Playback ended—may overlap with `trackdone`, but possibly earlier or manual.   |
| `unexpected-exit`                | Application closed or playback stopped unexpectedly (e.g., crash, forced exit).|
| `unexpected-exit-while-paused`   | App or session closed while media was paused.                                  |
{% enddocs %}