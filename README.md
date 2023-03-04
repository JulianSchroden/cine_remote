![Cine Remote Banner](docs/assets/cine_remote_banner.png)
<br>
<br>

<p align="center">
Cine Remote allows you to remote-control your Canon camera using its WiFi remote control capabilities.
</p>
<br>
<br>

Table of Contents

- [Project Status](#project-status)
- [Features](#features)
- [List of Supported Cameras](#list-of-supported-cameras)
- [Future Development](#future-development)

<br>

## Project Status

In its current version, the app is in a proof-of-concept state and supports only the Canon C100 II.
While implementing the communication with the camera, I used its browser-remote functionality to reverse engineer the issued API calls. For more info on the C100 II's API and my development process, check out [my blog](https://julianschroden.com/series/Exploring-the-Canon-Browser-Remote-API/1/).

<p align="center">
  <img src="docs/assets/cine_remote_teaser.gif" alt="Cine Remote Demo"/>
</p>
<br>

## Features

- **Property control**: You can change the aperture, ISO, shutter angle and white balance.
- **Start and Stop Recording**
- **Property Update Handling**: The app continuously polls for property updates to keep the displayed data in sync, even when you alter a value on the camera.
- **Live View Preview**: Turn on the Live View preview to check your exposure and framing.
- **Demo Mode**: Even without a supported model, you can try out the Cine Remote app using its demo mode, which mimics the camera's responses and response times.

<br>

## List of Supported Cameras

- Canon EOS C100 II

<br>

## Future Development

- Adding support for more cameras
  - PTP/IP-based cameras (older Canon EOS models)
  - CCAPI-based cameras (modern Canon EOS models)
- Improving error handling, e. g. detecting when the camera disconnects.
- Adding overlays to the Live View Player (e.g., the rule of thirds grid)
